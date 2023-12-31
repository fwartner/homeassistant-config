"""Sensor Entity for Ember Mug."""
from __future__ import annotations

from functools import cached_property
from typing import TYPE_CHECKING, Any

from homeassistant.components.sensor import (
    SensorDeviceClass,
    SensorEntity,
    SensorEntityDescription,
    SensorStateClass,
)
from homeassistant.const import ATTR_BATTERY_CHARGING, PERCENTAGE, UnitOfTemperature
from homeassistant.helpers.entity import EntityCategory

from .const import (
    ATTR_BATTERY_VOLTAGE,
    DOMAIN,
    ICON_DEFAULT,
    ICON_EMPTY,
    ICON_UNAVAILABLE,
    LIQUID_STATE_MAPPING,
    LIQUID_STATE_OPTIONS,
    LIQUID_STATE_TEMP_ICONS,
    LiquidStateValue,
)
from .entity import BaseMugValueEntity

if TYPE_CHECKING:
    from homeassistant.config_entries import ConfigEntry
    from homeassistant.core import HomeAssistant
    from homeassistant.helpers.entity_platform import AddEntitiesCallback

    from . import HassMugData
    from .coordinator import MugDataUpdateCoordinator


SENSOR_TYPES = {
    "liquid_state": SensorEntityDescription(
        key="state",
        device_class=SensorDeviceClass.ENUM,
        options=LIQUID_STATE_OPTIONS,
    ),
    "liquid_level": SensorEntityDescription(
        key="liquid_level",
        icon="mdi:cup-water",
        suggested_display_precision=0,
        native_unit_of_measurement=PERCENTAGE,
    ),
    "current_temp": SensorEntityDescription(
        key="current_temp",
        suggested_display_precision=1,
        native_unit_of_measurement=UnitOfTemperature.CELSIUS,
        state_class=SensorStateClass.MEASUREMENT,
        device_class=SensorDeviceClass.TEMPERATURE,
    ),
    "battery.percent": SensorEntityDescription(
        key="battery_percent",
        suggested_display_precision=1,
        native_unit_of_measurement=PERCENTAGE,
        device_class=SensorDeviceClass.BATTERY,
        state_class=SensorStateClass.MEASUREMENT,
        entity_category=EntityCategory.DIAGNOSTIC,
    ),
}


class EmberMugSensor(BaseMugValueEntity, SensorEntity):
    """Representation of a Mug sensor."""

    _domain = "sensor"

    def __init__(
        self,
        coordinator: MugDataUpdateCoordinator,
        mug_attr: str,
    ) -> None:
        """Initialize the Mug sensor."""
        self.entity_description = SENSOR_TYPES[mug_attr]
        super().__init__(coordinator, mug_attr)


class EmberMugStateSensor(EmberMugSensor):
    """Base Mug State Sensor."""

    @property
    def icon(self) -> str:
        """Change icon based on state."""
        state = self.state
        if state is None or self.coordinator.available is False:
            return ICON_UNAVAILABLE
        if state == LiquidStateValue.EMPTY:
            return ICON_EMPTY
        return ICON_DEFAULT

    @property
    def native_value(self) -> str | None:
        """Return liquid state key."""
        if state := super().native_value:
            return LIQUID_STATE_MAPPING[state].value
        return None

    @property
    def extra_state_attributes(self) -> dict[str, Any]:
        """Return device specific state attributes."""
        data = self.coordinator.data
        attrs = {
            "firmware_info": data.firmware,
            "raw_state": data.liquid_state,
        }
        if data.model.include_extra:
            attrs |= {
                "date_time_zone": data.date_time_zone,
                "udsk": data.udsk,
                "dsk": data.dsk,
            }
        return attrs | super().extra_state_attributes


class EmberMugLiquidLevelSensor(EmberMugSensor):
    """Liquid Level Sensor."""

    @cached_property
    def max_level(self) -> int:
        """Max level is different for travel mug."""
        if self.coordinator.mug.is_travel_mug:
            return 100
        return 30

    @property
    def native_value(self) -> float | int:
        """Return information about the liquid level."""
        liquid_level: float | None = super().native_value
        if liquid_level:
            # 30 -> Full
            # 5, 6 -> Low
            # 0 -> Empty
            return liquid_level / self.max_level * 100
        return 0

    @property
    def extra_state_attributes(self) -> dict[str, Any]:
        """Return device specific state attributes."""
        return {
            "raw_liquid_level": self.coordinator.data.liquid_level,
            **super().extra_state_attributes,
        }


class EmberMugTemperatureSensor(EmberMugSensor):
    """Mug Temperature sensor."""

    @property
    def icon(self) -> str | None:
        """Set icon based on temperature."""
        if self._mug_attr != "current_temp":
            return "mdi:thermometer"
        icon = LIQUID_STATE_TEMP_ICONS.get(
            self.coordinator.data.liquid_state,
            "thermometer",
        )
        return f"mdi:{icon}"

    @property
    def extra_state_attributes(self) -> dict[str, Any]:
        """Return device specific state attributes."""
        return {
            "native_value": self.coordinator.data.current_temp,
            **super().extra_state_attributes,
        }


class EmberMugBatterySensor(EmberMugSensor):
    """Mug Battery Sensor."""

    @property
    def extra_state_attributes(self) -> dict[str, Any]:
        """Return device specific state attributes."""
        data = self.coordinator.data
        attrs = {
            ATTR_BATTERY_CHARGING: data.battery.on_charging_base if data.battery else None,
        }
        if ATTR_BATTERY_VOLTAGE in data.model.attribute_labels:
            attrs[ATTR_BATTERY_VOLTAGE] = data.battery_voltage
        return attrs | super().extra_state_attributes


async def async_setup_entry(
    hass: HomeAssistant,
    entry: ConfigEntry,
    async_add_entities: AddEntitiesCallback,
) -> None:
    """Set up Entities."""
    data: HassMugData = hass.data[DOMAIN][entry.entry_id]
    if entry.entry_id is None:
        raise ValueError("Missing config entry ID")
    entities: list[EmberMugSensor] = [
        EmberMugStateSensor(data.coordinator, "liquid_state"),
        EmberMugLiquidLevelSensor(data.coordinator, "liquid_level"),
        EmberMugTemperatureSensor(data.coordinator, "current_temp"),
        EmberMugBatterySensor(data.coordinator, "battery.percent"),
    ]
    async_add_entities(entities)
