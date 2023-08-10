"""Personio integration."""

from __future__ import annotations

import logging

from homeassistant.config_entries import ConfigEntry
from homeassistant.const import Platform
from homeassistant.core import HomeAssistant
from homeassistant.helpers.template import now
from homeassistant.helpers.update_coordinator import DataUpdateCoordinator

from .api import Attendances, Authentication, Employees
from .const import CONF_USER, COORDINATOR, DOMAIN

_LOGGER = logging.getLogger(__name__)

PLATFORMS = [Platform.SWITCH]


async def async_setup_entry(hass: HomeAssistant, entry: ConfigEntry):
    """Set up entry."""

    config = entry.as_dict()

    hass.data.setdefault(DOMAIN, {})[entry.entry_id] = {
        COORDINATOR: None,
    }

    authentication = Authentication()
    coordinator = PersonioUpdateCoordinator(
        hass, authentication, config["data"][CONF_USER]
    )

    hass.data[DOMAIN][entry.entry_id][COORDINATOR] = coordinator

    await hass.config_entries.async_forward_entry_setups(entry, PLATFORMS)
    await hass.async_add_executor_job(authentication.set_config, config)

    return True


async def async_unload_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Unload a config entry."""
    return await hass.config_entries.async_unload_platforms(entry, PLATFORMS)


class PersonioUpdateCoordinator(DataUpdateCoordinator[None]):
    """Class to manage personio API calls single endpoint."""

    def __init__(
        self, hass: HomeAssistant, authentication: Authentication, user_email: str
    ) -> None:
        """Initialize global Personio API coordiantor."""
        super().__init__(
            hass,
            _LOGGER,
            name=DOMAIN,
            update_interval=None,
        )
        self._hass = hass
        self._authentication = authentication
        self._employees_api = Employees(authentication)
        self._attendance_api = Attendances(authentication)

        self._user_email = user_email
        self._user_id = None

    async def get_user_id(self) -> int:
        """Get a users ID through their email."""
        if self._user_id:
            return self._user_id

        self._user_id = await self._hass.async_add_executor_job(
            self._employees_api.get_employee_id_by_mail,
            self._user_email,
        )

        return self._user_id

    async def add_attendance(self, start_time: float, end_time: float):
        """Add users attendance data."""
        uid = await self.get_user_id()

        self._hass.async_add_executor_job(
            self._attendance_api.add_attendance,
            uid,
            start_time,
            end_time,
            now(self._hass),
        )
