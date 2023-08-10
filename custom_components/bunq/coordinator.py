"""Provides the Bunq DataUpdateCoordinator."""
from __future__ import annotations

from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.aiohttp_client import async_get_clientsession
from homeassistant.helpers.config_entry_oauth2_flow import OAuth2Session
from homeassistant.helpers.update_coordinator import DataUpdateCoordinator, UpdateFailed
from .models import BunqStatus
from .exceptions import BunqApiError
from .const import DOMAIN, ENVIRONMENT, LOGGER, UPDATE_INTERVAL
from .bunq_api import BunqApi

class BunqDataUpdateCoordinator(DataUpdateCoordinator):
    """Class to manage fetching Bunq data from single endpoint."""

    def __init__(
        self, hass: HomeAssistant, *, entry: ConfigEntry, session: OAuth2Session
    ) -> None:
        """Initialize global Bunq data updater."""
        self.session = session
        self.entry = entry

        async def async_token_refresh() -> str:
            await session.async_ensure_token_valid()
            token = session.token["access_token"]
            LOGGER.debug(str(token))
            return str(token)

        client_session = async_get_clientsession(hass)
        self.bunq = BunqApi(
            environment=ENVIRONMENT,
            token=session.token["access_token"],
            session=client_session,
            token_refresh_method=async_token_refresh,
        )

        super().__init__(hass, LOGGER, name=DOMAIN, update_interval=UPDATE_INTERVAL)

    async def _async_update_data(self) -> BunqStatus:
        try:
            return await self.bunq.update()
        except BunqApiError as error:
            raise UpdateFailed(f"Invalid response from API: {error}") from error
