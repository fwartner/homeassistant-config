"""Config flow for Stream Deck."""
import logging
from typing import Any
from urllib.parse import urlparse

from streamdeckapi import SDInfo, StreamDeckApi, get_model
import voluptuous as vol

from homeassistant.components import ssdp, zeroconf
from homeassistant.config_entries import ConfigEntry, ConfigFlow, OptionsFlow
from homeassistant.const import CONF_HOST, CONF_MODEL, CONF_NAME, CONF_UNIQUE_ID
from homeassistant.data_entry_flow import FlowResult
from homeassistant.helpers import selector

from .const import (
    AVAILABLE_PLATFORMS,
    CONF_BUTTONS,
    CONF_ENABLED_PLATFORMS,
    CONF_SHOW_NAME,
    CONF_VERSION,
    DEFAULT_PLATFORMS,
    DOMAIN,
)

_LOGGER = logging.getLogger(__name__)


class StreamDeckConfigFlow(ConfigFlow, domain=DOMAIN):
    """Config Flow for Stream Deck Integration."""

    host: str | None = None
    unique_id: str | None = None

    async def _get_unique_id(self) -> SDInfo | None:
        deck = StreamDeckApi(self.host)
        info = await deck.get_info()
        if not isinstance(info, SDInfo) or len(info.devices) == 0:
            self.unique_id = self.host
            return None
        self.unique_id = self.host
        # Prevent duplicates
        _LOGGER.warning("Setting unique id to %s", self.unique_id)
        await self.async_set_unique_id(self.unique_id)
        self._abort_if_unique_id_configured()
        return info

    async def async_step_ssdp(self, discovery_info: ssdp.SsdpServiceInfo) -> FlowResult:
        """Handle ssdp discovery flow."""
        location = discovery_info.ssdp_location
        hostname = urlparse(location).hostname
        _LOGGER.debug("SSDP found. Location: %s", location)
        if not isinstance(hostname, str):
            return self.async_abort(reason="no_hostname")
        self.host = hostname
        info = await self._get_unique_id()

        await self.async_set_unique_id(self.unique_id)

        if not isinstance(info, SDInfo):
            return self.async_abort(reason="no_streamdeck")
        _LOGGER.info(
            "Found Streamdeck at host %s with unique_id %s", self.host, self.unique_id
        )
        return self.async_show_form(step_id="user")

    async def async_step_zeroconf(
        self, discovery_info: zeroconf.ZeroconfServiceInfo
    ) -> FlowResult:
        """Handle zeroconf discovery flow."""
        hostname = discovery_info.host
        _LOGGER.debug("Zeroconf found. Hostname: %s", hostname)
        if not isinstance(hostname, str):
            return self.async_abort(reason="no_hostname")
        self.host = hostname
        info = await self._get_unique_id()

        await self.async_set_unique_id(self.unique_id)

        if not isinstance(info, SDInfo):
            return self.async_abort(reason="no_streamdeck")
        _LOGGER.info(
            "Found Streamdeck at host %s with unique_id %s", self.host, self.unique_id
        )
        return self.async_show_form(step_id="user")

    async def async_step_user(
        self, user_input: dict[str, Any] | None = None
    ) -> FlowResult:
        """Handle user config flow."""
        if user_input:
            self.host = user_input.get(CONF_HOST, "")
            if not isinstance(self.host, str):
                raise ValueError("Unknown type for host")
            await self._get_unique_id()
            _LOGGER.info("Host %s has unique_id %s", self.host, self.unique_id)

        errors: dict[str, str] = {}
        if self.host is not None and self.unique_id is not None:
            deck = StreamDeckApi(self.host)
            info = await deck.get_info()

            if not isinstance(info, SDInfo):
                errors["base"] = "cannot_connect"
                data_schema = vol.Schema(
                    {
                        vol.Required(CONF_NAME, default="Stream Deck"): str,
                        vol.Required(CONF_HOST, default=""): str,
                        vol.Required(
                            CONF_SHOW_NAME, default=True
                        ): selector.BooleanSelector(),
                        vol.Required(
                            CONF_ENABLED_PLATFORMS,
                            default=DEFAULT_PLATFORMS,
                        ): selector.SelectSelector(
                            selector.SelectSelectorConfig(
                                options=AVAILABLE_PLATFORMS,
                                multiple=True,
                                mode=selector.SelectSelectorMode.LIST,
                            )
                        ),
                    }
                )
                return self.async_show_form(
                    step_id="user",
                    data_schema=data_schema,
                    errors=errors,
                )

            await self._get_unique_id()

            if user_input is not None:
                # Create config_entry
                data = {
                    CONF_NAME: user_input[CONF_NAME],
                    CONF_HOST: self.host,
                    CONF_UNIQUE_ID: self.unique_id,
                    CONF_MODEL: get_model(info),
                    CONF_VERSION: info.application.version,
                    CONF_SHOW_NAME: user_input[CONF_SHOW_NAME],
                    CONF_ENABLED_PLATFORMS: user_input[CONF_ENABLED_PLATFORMS],
                    CONF_BUTTONS: {},
                }
                return self.async_create_entry(
                    title=f"{user_input[CONF_NAME]} at {self.host}", data=data
                )

        data_schema = vol.Schema(
            {
                vol.Required(CONF_NAME, default="Stream Deck"): str,
                vol.Required(CONF_HOST, default=self.host): str,
                vol.Required(CONF_SHOW_NAME, default=True): selector.BooleanSelector(),
                vol.Required(
                    CONF_ENABLED_PLATFORMS,
                    default=DEFAULT_PLATFORMS,
                ): selector.SelectSelector(
                    selector.SelectSelectorConfig(
                        options=AVAILABLE_PLATFORMS,
                        multiple=True,
                        mode=selector.SelectSelectorMode.LIST,
                    )
                ),
            }
        )
        return self.async_show_form(
            step_id="user",
            data_schema=data_schema,
            errors=errors,
            last_step=True,
        )

    @staticmethod
    def async_get_options_flow(
        config_entry: ConfigEntry,
    ) -> OptionsFlow:
        """Create the options flow."""
        return OptionsFlowHandler(config_entry)


class OptionsFlowHandler(OptionsFlow):
    """Handle a option flow."""

    def __init__(self, config_entry: ConfigEntry) -> None:
        """Initialize options flow."""
        self.config_entry = config_entry

    async def async_step_init(
        self, user_input: dict[str, Any] | None = None
    ) -> FlowResult:
        """Manage the options."""
        if user_input is not None:
            changed = self.hass.config_entries.async_update_entry(
                self.config_entry,
                data={
                    **self.config_entry.data,
                    **{
                        CONF_SHOW_NAME: user_input[CONF_SHOW_NAME],
                        CONF_ENABLED_PLATFORMS: user_input[CONF_ENABLED_PLATFORMS],
                    },
                },
            )
            if changed is False:
                _LOGGER.error(
                    "Method OptionsFlowHandler.async_step_init: Config entry %s has not been changed",
                    self.config_entry.entry_id,
                )
            return self.async_create_entry(
                title="",
                data={
                    CONF_SHOW_NAME: user_input[CONF_SHOW_NAME],
                    CONF_ENABLED_PLATFORMS: user_input[CONF_ENABLED_PLATFORMS],
                },
            )

        return self.async_show_form(
            step_id="init",
            data_schema=vol.Schema(
                {
                    vol.Required(
                        CONF_SHOW_NAME,
                        default=self.config_entry.data.get(CONF_SHOW_NAME, True),
                    ): selector.BooleanSelector(),
                    vol.Required(
                        CONF_ENABLED_PLATFORMS,
                        default=self.config_entry.data.get(
                            CONF_ENABLED_PLATFORMS, DEFAULT_PLATFORMS
                        ),
                    ): selector.SelectSelector(
                        selector.SelectSelectorConfig(
                            options=AVAILABLE_PLATFORMS,
                            multiple=True,
                            mode=selector.SelectSelectorMode.LIST,
                        )
                    ),
                }
            ),
        )
