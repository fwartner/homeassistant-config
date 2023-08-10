"""Entities"""

from homeassistant.components.switch import SwitchDeviceClass
from homeassistant.helpers.update_coordinator import CoordinatorEntity

from . import PersonioUpdateCoordinator
from .const import DOMAIN


class PersonioAttendanceEntity(CoordinatorEntity[PersonioUpdateCoordinator]):
    """Representation of a attendance entity."""

    def __init__(
        self,
        coordinator: PersonioUpdateCoordinator,
        entity_suffix: str,
    ) -> None:
        """Init from config, hookup enitity and coordinator."""
        super().__init__(coordinator)

        self._attr_name = "Personio Attendance"
        self._attr_unique_id = f"{DOMAIN}_attendance_{entity_suffix}"
        self._attr_device_class = SwitchDeviceClass.SWITCH
        self._attr_icon = "mdi:briefcase"

    @property
    def available(self) -> bool:
        """Return if the entity is available."""
        return True
