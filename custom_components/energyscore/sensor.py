"""Sensor platform for energyscore."""
import datetime
import logging
from typing import Any, Callable

from homeassistant.components.sensor import (
    PLATFORM_SCHEMA,
    SensorEntity,
    SensorStateClass,
)
from homeassistant.config_entries import ConfigEntry
from homeassistant.const import (
    CONF_NAME,
    CONF_UNIQUE_ID,
    STATE_UNAVAILABLE,
    STATE_UNKNOWN,
)
from homeassistant.core import HomeAssistant
import homeassistant.helpers.config_validation as cv
from homeassistant.helpers.entity import DeviceInfo, get_unit_of_measurement
import homeassistant.helpers.entity_registry as er
from homeassistant.helpers.restore_state import RestoreEntity
from homeassistant.helpers.typing import ConfigType, DiscoveryInfoType
from homeassistant.util import dt
import numpy as np
import voluptuous as vol

from .const import (
    CONF_ENERGY_ENTITY,
    CONF_PRICE_ENTITY,
    CONF_ROLLING_HOURS,
    CONF_TRESHOLD,
    COST_AVG,
    COST_MAX,
    COST_MIN,
    DOMAIN,
    ENERGY,
    ENERGY_TODAY,
    ICON,
    ICON_COST,
    ICON_SAVINGS,
    LAST_ENERGY,
    LAST_UPDATED,
    PRICES,
    QUALITY,
)

_LOGGER: logging.Logger = logging.getLogger(__package__)

# Time between updating data
SCAN_INTERVAL = datetime.timedelta(minutes=10)

PLATFORM_SCHEMA = PLATFORM_SCHEMA.extend(
    {
        vol.Required(CONF_NAME): cv.string,
        vol.Required(CONF_ENERGY_ENTITY): cv.entity_id,
        vol.Required(CONF_PRICE_ENTITY): cv.entity_id,
        vol.Required(CONF_UNIQUE_ID): cv.string,
        vol.Optional(CONF_TRESHOLD, default=0): vol.Coerce(float),
        vol.Optional(CONF_ROLLING_HOURS, default=24): vol.All(
            int, vol.Range(min=2, max=168)
        ),
    }
)


async def async_setup_entry(
    hass: HomeAssistant,
    config_entry: ConfigEntry,
    async_add_entities,
):
    """Setup sensors from a config entry created in the integrations UI"""

    # Reading the config from UI
    config = hass.data[DOMAIN][config_entry.entry_id]
    energy_treshold = config_entry.options.get(CONF_TRESHOLD)
    rolling_hours = config_entry.options.get(CONF_ROLLING_HOURS)
    _LOGGER.debug("Config: %s", config)
    _LOGGER.debug("Options: %s", config_entry.options)

    sensors = [
        EnergyScore(hass, config, energy_treshold, rolling_hours),
        Cost(hass, config),
        PotentialSavings(hass, config),
    ]
    async_add_entities(sensors, update_before_add=False)


async def async_setup_platform(
    hass: HomeAssistant,
    config: ConfigType,
    async_add_entities: Callable,
    discovery_info: DiscoveryInfoType | None = None,
) -> None:
    """Set up sensors from YAML config"""
    energy_treshold = config[CONF_TRESHOLD]
    rolling_hours = config[CONF_ROLLING_HOURS]
    _LOGGER.debug("Config: %s", config)
    sensors = [
        EnergyScore(hass, config, energy_treshold, rolling_hours),
        Cost(hass, config),
        PotentialSavings(hass, config),
    ]
    async_add_entities(sensors, update_before_add=False)


def normalise_price(price_dict) -> dict:
    """Normalises price dict"""
    if price_dict == {}:
        return {}
    max_value = max(price_dict.values())
    min_value = min(price_dict.values())
    if max_value == min_value:
        return {key: 1 for key, value in price_dict.items()}
    return {
        key: (max_value - value) / (max_value - min_value)
        for key, value in price_dict.items()
    }


def normalise_energy(energy_dict) -> dict:
    """Normalises energy dict to sum up to 1"""
    if energy_dict == {}:
        return {}
    sum_values = sum(energy_dict.values())
    return {key: value / sum_values for key, value in energy_dict.items()}


def calculate_hourly_energy_usage(energy_dict: dict) -> dict:
    """Calculate energy usage per hour from total"""
    energy_usage = {}
    for key, value in energy_dict.items():
        previous = key - datetime.timedelta(hours=1)
        if previous in energy_dict and energy_dict[key] is not None:
            # Check if the energy sensor is resetting
            if energy_dict[previous] is None or (value < energy_dict[previous]):
                energy_usage[key] = value
            else:
                energy_usage[key] = value - energy_dict[previous]
        elif previous in energy_dict and energy_dict[key] is not None:
            energy_usage[key] = value
    return energy_usage


def calculate_energy_usage(energy_dict: dict) -> float:
    """Calculate energy usage based on two consecutive energy readings"""
    if len(energy_dict) == 2 and all(
        isinstance(value, float) for value in energy_dict.values()
    ):
        earliest = energy_dict[min(energy_dict)]
        latest = energy_dict[max(energy_dict)]
        if latest >= earliest:  # Check totalling sensor
            return latest - earliest
        else:
            return latest
    else:
        return None


class EnergyScore(SensorEntity, RestoreEntity):
    """EnergyScore Sensor class"""

    _attr_state_class = SensorStateClass.MEASUREMENT
    _attr_native_unit_of_measurement = "%"

    def __init__(self, hass, config, energy_treshold, rolling_hours):
        self._attr_icon: str = ICON
        self._attr_unique_id = config.get(CONF_UNIQUE_ID)

        self._energy = None
        self._energy_entity = config[CONF_ENERGY_ENTITY]
        self.hass = hass  # TODO: needed?
        self._name = f"{config[CONF_NAME]} EnergyScore"
        self._norm_energy = np.array(None)
        self._norm_prices = np.array(None)
        self._price = None
        self._price_entity = config[CONF_PRICE_ENTITY]
        self._rolling_hours = rolling_hours
        self._state = 100
        self._treshold = energy_treshold
        self.attr = {
            CONF_ENERGY_ENTITY: self._energy_entity,
            CONF_PRICE_ENTITY: self._price_entity,
            QUALITY: 0,
            ENERGY: {},
            PRICES: {},
            LAST_UPDATED: None,
        }

    @property
    def device_info(self) -> DeviceInfo:
        """Return the device info accosiated with the entity"""
        return DeviceInfo(
            identifiers={(DOMAIN, self._attr_unique_id)},
            name=self.name,
            manufacturer=DOMAIN,
        )

    @property
    def name(self) -> str:
        """Return the name of the sensor."""
        return self._name

    @property
    def state(self) -> Any:
        """Return the state of the sensor."""
        return self._state

    @property
    def extra_state_attributes(self):
        return self.attr

    async def async_added_to_hass(self) -> None:
        """Restore last state"""
        _LOGGER.debug("Trying to restore: %s", self._name)
        await super().async_added_to_hass()
        if (
            last_state := await self.async_get_last_state()
        ) and last_state.state not in (STATE_UNKNOWN, STATE_UNAVAILABLE):
            self._state = last_state.state
            for attribute in [ENERGY, PRICES, LAST_UPDATED, QUALITY]:
                if attribute in last_state.attributes:
                    self.attr[attribute] = last_state.attributes[attribute]
            _LOGGER.debug("Restored %s", self._name)
        else:
            _LOGGER.debug("Was not able to restore %s", self._name)

    def process_new_data(self):
        """Processes the update data"""
        now = dt.now().replace(
            minute=0, second=0, microsecond=0
        )  # TZ aware datetime obj based on user settings

        # Parse datetimes from strings
        for i in [ENERGY, PRICES]:
            self.attr[i] = {
                dt.parse_datetime(key): value
                for key, value in self.attr[i].items()
                if isinstance(key, str)
            }

        # Add new data, need to check declining energy first
        previous = now - datetime.timedelta(hours=1)
        if (
            previous in self.attr[ENERGY]
            and self.attr[ENERGY][previous] is not None
            and self._energy.state < self.attr[ENERGY][previous]
        ):
            _state_class = self._energy.attributes.get("state_class")
            _last_reset = self._energy.attributes.get("last_reset")
            if _last_reset is not None:
                _last_reset = dt.parse_datetime(_last_reset).replace(
                    minute=0, second=0, microsecond=0
                )

            # Check state classes:
            if _state_class == "total_increasing" or (
                _state_class == "total" and _last_reset is not None
            ):
                self.attr[ENERGY][now] = self._energy.state
            else:
                if _state_class == "total":
                    _warn_text = """, but there is no last_reset attribute to confirm that the sensor is expected to decline the value."""
                else:
                    _warn_text = """. Please change energy entity to a total/total_increasing, or fix the current energy entity state class."""
                _LOGGER.warning(
                    "%s - The energy entity's state class is %s%s",
                    self._name,
                    _state_class,
                    _warn_text,
                )
                self.attr[ENERGY][now] = None
        else:
            self.attr[ENERGY][now] = self._energy.state
        self.attr[PRICES][now] = self._price.state

        # Calculate energy data per hour from total:
        _energy_usage = calculate_hourly_energy_usage(self.attr[ENERGY])

        # Remove all energy usage below treshold:
        _energy_usage = {k: v for k, v in _energy_usage.items() if v >= self._treshold}

        # Clean out old data:
        def cutoff(data: dict, hours: int) -> dict:
            """Cuts off old energy and price data"""
            cut_hours = now - datetime.timedelta(hours=hours)
            return {time: value for (time, value) in data.items() if time > cut_hours}

        _energy_usage = cutoff(_energy_usage, self._rolling_hours)
        self.attr[PRICES] = cutoff(self.attr[PRICES], self._rolling_hours)
        self.attr[ENERGY] = cutoff(self.attr[ENERGY], self._rolling_hours + 1)

        _LOGGER.debug(
            "%s - Calculated energy usage: %s",
            self._name,
            [round(val, 2) for key, val in _energy_usage.items()],
        )

        # Calculate quality and break out if applicable
        q = min(len(self.attr[PRICES]), len(_energy_usage)) / self._rolling_hours
        self.attr[QUALITY] = round(q, 2)
        _LOGGER.debug("%s - Quality: %s", self._name, self.attr[QUALITY])
        if self.attr[QUALITY] == 0 or len(set(self.attr[ENERGY].values())) == 1:
            _LOGGER.debug(
                "%s - Not able to calculate energy use in the last %s hours",
                self._name,
                self._rolling_hours,
            )
            # TODO: Check if it is actually possible to have quality = 0
            # and if so, should the return really be 100?
            return 100

        # Normalise and intersect the data
        _norm_prices = normalise_price(self.attr[PRICES])
        _norm_energies = normalise_energy(_energy_usage)
        _intersection = self.attr[PRICES].keys() & _energy_usage.keys()
        _price_array = np.array([_norm_prices[x] for x in _intersection])
        _energy_array = np.array([_norm_energies[x] for x in _intersection])
        _LOGGER.debug("%s - Norm prices: %s", self._name, np.round(_price_array, 2))
        _LOGGER.debug("%s - Norm energy: %s", self._name, np.round(_energy_array, 2))

        # Calculate the energyscore
        _score = np.dot(_price_array, _energy_array)
        _LOGGER.debug("%s - Score: %s", self._name, _score)

        return int(_score * 100)

    async def async_update(self):
        """Updates the sensor"""

        # Below can be moved to an update handler
        try:
            self._price = self.hass.states.get(self._price_entity)
            self._energy = self.hass.states.get(self._energy_entity)

            if self._price.state in [STATE_UNAVAILABLE, STATE_UNKNOWN]:
                _LOGGER.info("%s - Price data is %s", self._name, self._price.state)
                self._price = False
            if self._energy.state in [STATE_UNAVAILABLE, STATE_UNKNOWN]:
                _LOGGER.info("%s - Energy data is %s", self._name, self._energy.state)
                self._energy = False
            if not self._price or not self._energy:
                return

            self._price.state = round(float(self._price.state), 2)
            self._energy.state = round(float(self._energy.state), 2)

        except ValueError:
            _LOGGER.exception("%s - Possibly non-numeric source state", self._name)
        except Exception:
            _LOGGER.exception("%s - Could not fetch price and energy data", self._name)
        else:
            try:
                self._state = self.process_new_data()
            except Exception:
                _LOGGER.exception(
                    "%s - Could not process the updated data and produce the new EnergyScore",
                    self._name,
                )
            else:
                self.attr[LAST_UPDATED] = dt.now()

                # Datatimes needs to be converted to strings in state attributes
                self.attr[PRICES] = {
                    key.strftime("%Y-%m-%dT%H:%M:%S%z"): val
                    for key, val in self.attr[PRICES].items()
                }
                self.attr[ENERGY] = {
                    key.strftime("%Y-%m-%dT%H:%M:%S%z"): val
                    for key, val in self.attr[ENERGY].items()
                }


class Cost(SensorEntity, RestoreEntity):
    """Current day cost sensor class"""

    _attr_state_class = SensorStateClass.TOTAL_INCREASING

    def __init__(self, hass: HomeAssistant, config):
        self._attr_icon: str = ICON_COST
        self._attr_unit_of_measurement = None
        self._attr_unique_id = f"{config.get(CONF_UNIQUE_ID)}_cost"
        self._energy_entity = config[CONF_ENERGY_ENTITY]
        self._name = f"{config[CONF_NAME]} Cost"
        self._price_entity = config[CONF_PRICE_ENTITY]
        self._state = None
        self.attr = {LAST_ENERGY: {}, LAST_UPDATED: None}
        self.config = config
        self.energy = None
        self.energy_usage = None
        self.hass = hass
        self.price = None

    @property
    def device_info(self) -> DeviceInfo:
        """Return the device info accosiated with the entity"""
        return DeviceInfo(
            identifiers={(DOMAIN, self.config.get(CONF_UNIQUE_ID))},
            name=self.config[CONF_NAME],
            manufacturer=DOMAIN,
        )

    @property
    def name(self) -> str:
        """Return the name of the sensor."""
        return self._name

    @property
    def state(self) -> Any:
        """Return the state of the sensor."""
        return self._state

    @property
    def extra_state_attributes(self):
        return self.attr

    @property
    def unit_of_measurement(self) -> str:
        """Return the unit of measurement."""
        return self.get_uom()

    def get_uom(self) -> str:
        """Finds the unit of measurement based on source entities"""
        entity_reg = er.async_get(self.hass)
        if entity_reg.async_is_registered(
            self._price_entity
        ) and entity_reg.async_is_registered(self._energy_entity):
            price_uom = get_unit_of_measurement(self.hass, self._price_entity)
            energy_uom = get_unit_of_measurement(self.hass, self._energy_entity)
            if "/" in price_uom and price_uom.split("/")[1] == energy_uom:
                self._attr_unit_of_measurement = price_uom.split("/")[0]
            else:
                _LOGGER.info(
                    "Cannot provide unit of measurement for %s since the units of measurement for price (%s) and energy (%s) sensors do not match",
                    self._name,
                    price_uom,
                    energy_uom,
                )
        else:
            _LOGGER.info(
                "Cannot provide unit of measurement for %s since the source sensors are not available",
                self._name,
            )
        return self._attr_unit_of_measurement

    async def async_added_to_hass(self) -> None:
        """Restore last state if same date"""
        _LOGGER.debug("Trying to restore %s", self._name)
        await super().async_added_to_hass()
        if (
            (last_state := await self.async_get_last_state())
            and last_state.state not in (STATE_UNKNOWN, STATE_UNAVAILABLE)
            and last_state.attributes[LAST_UPDATED] is not None
        ):
            # Try to restore the unit of measurement if not already set
            if (
                self._attr_unit_of_measurement is None
                and "unit_of_measurement" in last_state.attributes
                and last_state.attributes["unit_of_measurement"] is not None
            ):
                self._attr_unit_of_measurement = last_state.attributes[
                    "unit_of_measurement"
                ]

            self.attr[LAST_UPDATED] = dt.parse_datetime(
                last_state.attributes[LAST_UPDATED]
            )
            if self.attr[LAST_UPDATED].date() == dt.now().date():
                self._state = float(last_state.state)
                self.attr[LAST_ENERGY] = last_state.attributes[LAST_ENERGY]
                _LOGGER.debug("Restored %s", self._name)
            else:
                self._state = 0

    def process_new_data(self):
        """Processes the update data"""
        now = dt.now()

        # Parse datetimes from strings
        self.attr[LAST_ENERGY] = {
            dt.parse_datetime(key): value
            for key, value in self.attr[LAST_ENERGY].items()
            if isinstance(key, str)
        }

        # Add current energy
        self.attr[LAST_ENERGY][now] = self.energy.state
        _LOGGER.debug(
            "Cost calc for %s - Last energy: %s", self.name, self.attr[LAST_ENERGY]
        )

        # Calculate energy usage
        self.energy_usage = calculate_energy_usage(self.attr[LAST_ENERGY])
        _LOGGER.debug(
            "Cost calc for %s - Energy usage: %s", self.name, self.energy_usage
        )

        if self.energy_usage is None:
            return

        cost = self.price.state * self.energy_usage

        # Check new date
        if (
            min(self.attr[LAST_ENERGY]).date() != max(self.attr[LAST_ENERGY]).date()
            or self._state is None
        ):
            self._state = round(cost, 2)
        else:
            self._state = round(self._state + cost, 2)
        _LOGGER.debug("%s - Cost: %s", self._name, self._state)

        # Clean old data
        self.attr[LAST_ENERGY] = {
            time: value
            for (time, value) in self.attr[LAST_ENERGY].items()
            if time == now
        }

        return

    async def async_update(self):
        """Updates the sensor"""

        if self._attr_unit_of_measurement is None:
            self.get_uom()

        _LOGGER.debug("The cost for %s are being updated", self._name)
        try:
            self.price = self.hass.states.get(self._price_entity)
            self.energy = self.hass.states.get(self._energy_entity)

            if self.price.state in [STATE_UNAVAILABLE, STATE_UNKNOWN]:
                _LOGGER.info("%s - Price data is %s", self._name, self.price.state)
                self.price = False
            if self.energy.state in [STATE_UNAVAILABLE, STATE_UNKNOWN]:
                _LOGGER.info("%s - Energy data is %s", self._name, self.energy.state)
                self.energy = False
            if not self.price or not self.energy:
                return

            self.price.state = round(float(self.price.state), 2)
            self.energy.state = round(float(self.energy.state), 2)

        except ValueError:
            _LOGGER.exception("%s - Possibly non-numeric source state", self._name)
        except Exception:
            _LOGGER.exception("%s - Could not fetch price and energy data", self._name)
        else:
            self.process_new_data()

            # Datetimes needs to be converted to strings in state attributes
            self.attr[LAST_ENERGY] = {
                key.strftime("%Y-%m-%dT%H:%M:%S%z"): val
                for key, val in self.attr[LAST_ENERGY].items()
            }
            self.attr[LAST_UPDATED] = dt.now()


class PotentialSavings(SensorEntity, RestoreEntity):
    """Current day savings sensor class"""

    _attr_state_class = SensorStateClass.MEASUREMENT

    def __init__(self, hass, config):
        self._attr_icon: str = ICON_SAVINGS
        self._attr_unit_of_measurement = None
        self._attr_unique_id = f"{config.get(CONF_UNIQUE_ID)}_potential_savings"
        self._hass = hass
        self._name = f"{config[CONF_NAME]} Potential Savings"
        self._state = None
        self.attr = {
            COST_AVG: None,
            COST_MIN: None,
            COST_MAX: None,
            ENERGY_TODAY: None,
            LAST_ENERGY: {},
            LAST_UPDATED: None,
            PRICES: {},
            QUALITY: None,
        }
        self.config = config
        self.cost_uid = f"{config.get(CONF_UNIQUE_ID)}_cost"
        self.cost = None
        self.cost_entity = None
        self.energy = None
        self.energy_entity = config[CONF_ENERGY_ENTITY]
        self.price = None
        self.price_entity = config[CONF_PRICE_ENTITY]
        self.score_uid = config.get(CONF_UNIQUE_ID)

    @property
    def device_info(self) -> DeviceInfo:
        """Return the device info accosiated with the entity"""
        return DeviceInfo(
            identifiers={(DOMAIN, self.config.get(CONF_UNIQUE_ID))},
            name=self.config[CONF_NAME],
            manufacturer=DOMAIN,
        )

    @property
    def name(self) -> str:
        """Return the name of the sensor."""
        return self._name

    @property
    def state(self) -> Any:
        """Return the state of the sensor."""
        return self._state

    @property
    def extra_state_attributes(self):
        return self.attr

    @property
    def unit_of_measurement(self) -> str:
        """Return the unit of measurement."""
        return self._attr_unit_of_measurement

    async def async_added_to_hass(self) -> None:
        """Restore last state if same date"""
        _LOGGER.debug("Trying to restore %s", self._name)
        await super().async_added_to_hass()
        if (
            (last_state := await self.async_get_last_state())
            and last_state.state not in (STATE_UNKNOWN, STATE_UNAVAILABLE)
            and last_state.attributes[LAST_UPDATED] is not None
        ):
            # Try to restore the unit of measurement if not already set
            if (
                self._attr_unit_of_measurement is None
                and "unit_of_measurement" in last_state.attributes
                and last_state.attributes["unit_of_measurement"] is not None
            ):
                self._attr_unit_of_measurement = last_state.attributes[
                    "unit_of_measurement"
                ]

            self.attr[LAST_UPDATED] = dt.parse_datetime(
                last_state.attributes[LAST_UPDATED]
            )

            if self.attr[LAST_UPDATED].date() == dt.now().date():
                self._state = float(last_state.state)
                for attribute in [
                    COST_AVG,
                    COST_MIN,
                    COST_MAX,
                    ENERGY_TODAY,
                    LAST_ENERGY,
                    PRICES,
                    QUALITY,
                ]:
                    if attribute in last_state.attributes:
                        self.attr[attribute] = last_state.attributes[attribute]
            else:
                self._state = 0
            _LOGGER.debug("Restored %s", self._name)

    def process_new_data(self):
        """Processes the update data"""
        # Fist part similar to cost sensor. Simplify?
        now = dt.now()

        # Parse datetimes from strings
        for i in [LAST_ENERGY, PRICES]:
            if self.attr[i] is not None:
                self.attr[i] = {
                    dt.parse_datetime(key): value
                    for key, value in self.attr[i].items()
                    if isinstance(key, str)
                }

        # Reset cost if last update was another day
        last_cost = self.cost.attributes.get("last_updated")
        if last_cost is not None and last_cost.date() != now.date():
            self.cost.state = 0
            _LOGGER.debug("%s - Updated cost to 0", self._name)

        # Find current day prices
        self.attr[PRICES][
            now.replace(minute=0, second=0, microsecond=0)
        ] = self.price.state
        self.attr[PRICES] = {
            time: value
            for (time, value) in self.attr[PRICES].items()
            if time.date() == now.date()
        }

        # Calculate energy usage
        self.attr[LAST_ENERGY][now] = self.energy.state
        energy_usage = calculate_energy_usage(self.attr[LAST_ENERGY])
        _LOGGER.debug("%s - Energy usage: %s", self._name, energy_usage)
        if energy_usage is None or len(self.attr[PRICES]) == 0:
            return
        if (
            min(self.attr[LAST_ENERGY]).date() != max(self.attr[LAST_ENERGY]).date()
            or self.attr[ENERGY_TODAY] is None
        ):
            self.attr[ENERGY_TODAY] = round(energy_usage, 2)
        else:
            self.attr[ENERGY_TODAY] = round(self.attr[ENERGY_TODAY] + energy_usage, 2)

        # Calculate costs
        self.attr[COST_AVG] = round(
            sum(self.attr[PRICES].values())
            / len(self.attr[PRICES].values())
            * self.attr[ENERGY_TODAY],
            2,
        )
        self.attr[COST_MIN] = round(
            min(self.attr[PRICES].values()) * self.attr[ENERGY_TODAY], 2
        )
        self.attr[COST_MAX] = round(
            max(self.attr[PRICES].values()) * self.attr[ENERGY_TODAY], 2
        )
        _LOGGER.debug(
            "%s - Calculated costs - Avg: %s, Max: %s, Min: %s",
            self._name,
            self.attr[COST_AVG],
            self.attr[COST_MAX],
            self.attr[COST_MIN],
        )

        # Compare min and actual cost to get potential
        self._state = (
            round(self.cost.state - self.attr[COST_MIN], 2)
            if not self.cost.state - self.attr[COST_MIN] < 0
            else 0
        )
        _LOGGER.debug("%s - Potential Savings: %s", self._name, self._state)

        # Calculate quality
        self.attr[QUALITY] = round(len(self.attr[PRICES]) / (now.hour + 1), 2)

        # Clean old data
        self.attr[LAST_ENERGY] = {
            time: value
            for (time, value) in self.attr[LAST_ENERGY].items()
            if time == now
        }

    async def async_update(self):
        """Updates the potential sensor"""
        _LOGGER.debug("The savings for %s are being updated", self._name)

        try:
            # Get Cost entity and unit of measurement
            entity_reg = er.async_get(self._hass)
            self.cost_entity = entity_reg.async_get_entity_id(
                "sensor", DOMAIN, self.cost_uid
            )
            self._attr_unit_of_measurement = get_unit_of_measurement(
                self.hass, self.cost_entity
            )

            # Update source states
            self.cost = self.hass.states.get(self.cost_entity)
            self.energy = self.hass.states.get(self.energy_entity)
            self.price = self.hass.states.get(self.price_entity)

            for sensor in [self.cost, self.energy, self.price]:
                if sensor.state in [STATE_UNAVAILABLE, STATE_UNKNOWN]:
                    _LOGGER.info(
                        "%s - Potential data cannot be updated, state is %s for %s",
                        self.name,
                        sensor.state,
                        sensor.entity_id,
                    )
                    return
                sensor.state = float(sensor.state)

            _LOGGER.debug(
                "The cost used in savings for %s is: %s, and is last updated: %s",
                self._name,
                self.cost.state,
                self.cost.attributes.get("last_updated"),
            )

        except ValueError:
            _LOGGER.exception("%s - Possibly non-numeric source state", self._name)
        else:
            self.process_new_data()

            # Datetimes needs to be converted to strings in state attributes
            self.attr[LAST_ENERGY] = {
                key.strftime("%Y-%m-%dT%H:%M:%S%z"): val
                for key, val in self.attr[LAST_ENERGY].items()
            }

            self.attr[PRICES] = {
                key.strftime("%Y-%m-%dT%H:%M:%S%z"): val
                for key, val in self.attr[PRICES].items()
            }

            self.attr[LAST_UPDATED] = dt.now().strftime("%Y-%m-%dT%H:%M:%S%z")
