"""
ConfigFlow for EnergyScore
Inspiration from Aaron Godfrey's custom component tutorial, parts 3 and 4
"""

import logging
from typing import Any

from homeassistant import config_entries
from homeassistant.components.sensor import DOMAIN as SENSOR_DOMAIN
from homeassistant.const import CONF_NAME, CONF_UNIQUE_ID
from homeassistant.core import callback
from homeassistant.data_entry_flow import FlowResult
from homeassistant.helpers import selector
import homeassistant.helpers.config_validation as cv
import voluptuous as vol

from .const import (
    CONF_ENERGY_ENTITY,
    CONF_PRICE_ENTITY,
    CONF_ROLLING_HOURS,
    CONF_TRESHOLD,
    DOMAIN,
)

_LOGGER: logging.Logger = logging.getLogger(__package__)

CONFIG_SCHEMA = vol.Schema(
    {
        vol.Required(CONF_NAME): selector.TextSelector(),
        vol.Required(CONF_ENERGY_ENTITY): selector.EntitySelector(
            selector.EntitySelectorConfig(
                domain=[SENSOR_DOMAIN],
            ),
        ),
        vol.Required(CONF_PRICE_ENTITY): selector.EntitySelector(
            selector.EntitySelectorConfig(
                domain=[SENSOR_DOMAIN],
            ),
        ),
    }
)


class EnergyScoreConfigFlow(config_entries.ConfigFlow, domain=DOMAIN):
    """EnergyScore config flow."""

    VERSION = 2

    async def async_step_user(self, user_input: dict[str, Any] | None = None):
        """Invoked when a user initiates a flow via the user interface."""

        if user_input is not None:
            self.data = user_input
            self.options = {}

            # Create a unique ID:
            _unique_id = (
                f"ES_{self.data['energy_entity']}_{self.data['price_entity']}".replace(
                    "sensor.", ""
                )
            )
            await self.async_set_unique_id(_unique_id)
            self._abort_if_unique_id_configured()
            self.data["unique_id"] = _unique_id

            # Set the default options:
            self.options[CONF_TRESHOLD] = 0
            self.options[CONF_ROLLING_HOURS] = 24

            return self.async_create_entry(
                title=self.data["name"], data=self.data, options=self.options
            )

        return self.async_show_form(step_id="user", data_schema=CONFIG_SCHEMA)

    @staticmethod
    @callback
    def async_get_options_flow(
        config_entry: config_entries.ConfigEntry,
    ) -> config_entries.OptionsFlow:
        """Create the options flow."""
        return OptionsFlowHandler(config_entry)


class OptionsFlowHandler(config_entries.OptionsFlow):
    """EnergyScore options flow."""

    def __init__(self, config_entry: config_entries.ConfigEntry) -> None:
        """Initialize options flow."""
        self.config_entry = config_entry
        self.current_config: dict = dict(config_entry.data)
        self.current_options = dict(config_entry.options)

    async def async_step_init(
        self, user_input: dict[str, Any] | None = None
    ) -> FlowResult:
        """Manage the options."""

        if user_input is not None:
            return self.async_create_entry(title="", data=user_input)

        options_schema = vol.Schema(
            {
                vol.Required(
                    CONF_TRESHOLD, default=self.current_options[CONF_TRESHOLD]
                ): vol.Coerce(float),
                vol.Required(
                    CONF_ROLLING_HOURS, default=self.current_options[CONF_ROLLING_HOURS]
                ): vol.All(int, vol.Range(min=2, max=168)),
            }
        )

        return self.async_show_form(step_id="init", data_schema=options_schema)
