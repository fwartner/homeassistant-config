"""Personio config flow."""

from typing import Any

from requests import HTTPError
import voluptuous as vol

from homeassistant import config_entries
from homeassistant.const import CONF_CLIENT_ID, CONF_CLIENT_SECRET
from homeassistant.data_entry_flow import FlowResult
import homeassistant.helpers.config_validation as cv

from .api import authenticate
from .const import CONF_APP_ID, CONF_PARTNER_ID, CONF_USER, DOMAIN


class PersonioConfigFlow(config_entries.ConfigFlow, domain=DOMAIN):
    """Personio config flow."""

    # The schema version of the entries that it creates
    # Home Assistant will call your migrate method if the version changes
    VERSION = 1

    async def async_step_user(self, user_input: dict[str, Any] | None = None):
        """Initial configuration step."""
        data_schema = vol.Schema(
            {
                vol.Required(CONF_CLIENT_ID): cv.string,
                vol.Required(CONF_CLIENT_SECRET): cv.string,
                vol.Optional(CONF_PARTNER_ID): cv.string,
                vol.Optional(CONF_APP_ID): cv.string,
                vol.Required(CONF_USER): cv.string,
            }
        )

        if user_input is None:
            return self.async_show_form(step_id="user", data_schema=data_schema)

        data = {
            CONF_CLIENT_ID: user_input[CONF_CLIENT_ID],
            CONF_CLIENT_SECRET: user_input[CONF_CLIENT_SECRET],
            CONF_PARTNER_ID: user_input.get(CONF_PARTNER_ID),
            CONF_APP_ID: user_input.get(CONF_APP_ID),
            CONF_USER: user_input.get(CONF_USER),
        }

        return await self._validate_and_create("user", data_schema, data)

    async def _validate_and_create(
        self, step_id: str, data_schema: vol.Schema, data: dict
    ) -> FlowResult:
        """Validate data and show form if it is invalid."""
        errors: dict[str, str] = {}

        # noinspection PyBroadException
        try:
            await self.hass.async_add_executor_job(
                authenticate,
                data[CONF_CLIENT_ID],
                data[CONF_CLIENT_SECRET],
                data[CONF_PARTNER_ID],
                data[CONF_APP_ID],
            )
        except HTTPError as err:
            if err.response.status_code == 403:
                errors["base"] = "invalid_auth"
            else:
                errors["base"] = "unknown"
        except Exception:  # pylint: disable=broad-except
            errors["base"] = "unknown"
        else:
            return self.async_create_entry(
                title="Personio",
                data=data,
            )

        return self.async_show_form(
            step_id=step_id,
            data_schema=data_schema,
            errors=errors,
        )
