"""Platform for binary sensor integration."""

from dataclasses import dataclass
import time
from typing import Any

from homeassistant.components.switch import SwitchEntity, SwitchEntityDescription
from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback
from homeassistant.helpers.restore_state import RestoreEntity

from . import PersonioUpdateCoordinator
from .const import COORDINATOR, DOMAIN
from .entity import PersonioAttendanceEntity

ATTR_IS_ON = "attr_is_on"
ATTR_TURN_ON_TIME = "attr_turn_on_time"


@dataclass
class PersonioAttendanceSwitchEntityDescription(SwitchEntityDescription):
    """Describes a Tailscale binary sensor entity."""


async def async_setup_entry(
    hass: HomeAssistant, entry: ConfigEntry, async_add_entities: AddEntitiesCallback
) -> None:
    """Add Personio binary sensors-"""

    coordinator = hass.data[DOMAIN][entry.entry_id][COORDINATOR]

    async_add_entities([PersonioAttendanceSwitch(coordinator, entry.entry_id)])


class PersonioAttendanceSwitch(PersonioAttendanceEntity, SwitchEntity, RestoreEntity):
    """Define an Personio Attendance binary sensor."""

    entity_description: PersonioAttendanceSwitchEntityDescription

    def __init__(self, coordinator: PersonioUpdateCoordinator, suffix: str) -> None:
        """Initialize the binary sensor."""
        super().__init__(coordinator, suffix)
        self._turn_on_time = None
        self._coordinator = coordinator

    async def async_turn_on(self, **kwargs: Any) -> None:
        """Turn the switch on."""
        # No-op for turn on. Data is written on turn off.
        self._attr_is_on = True
        self._turn_on_time = time.time()
        self.async_write_ha_state()

    async def async_turn_off(self, **kwargs: Any) -> None:
        """Turn the switch off."""
        await self._coordinator.add_attendance(self._turn_on_time, time.time())
        self._turn_on_time = None
        self._attr_is_on = False
        self.async_write_ha_state()

    # State restoration

    @property
    def extra_state_attributes(self) -> dict[str, Any] | None:
        """Return the state attributes."""
        return {
            ATTR_IS_ON: self._attr_is_on,
            ATTR_TURN_ON_TIME: self._turn_on_time,
        }

    async def async_added_to_hass(self) -> None:
        """Restore previous state on restart to avoid blocking startup."""
        await super().async_added_to_hass()

        last_state = await self.async_get_last_state()

        if last_state is not None:
            attributes = last_state.attributes
            keys = attributes.keys()
            if ATTR_IS_ON in keys:
                self._attr_is_on = attributes[ATTR_IS_ON]
            if ATTR_TURN_ON_TIME in keys:
                self._turn_on_time = attributes[ATTR_TURN_ON_TIME]
