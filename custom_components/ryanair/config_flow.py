"""Config flow for Ryanair integration."""
from __future__ import annotations

from typing import Any
import uuid
import hashlib
from pathlib import Path
import voluptuous as vol
from homeassistant import config_entries
from homeassistant.core import HomeAssistant
from homeassistant.data_entry_flow import FlowResult
from homeassistant.const import CONF_EMAIL, CONF_PASSWORD
from homeassistant.helpers.json import save_json
from homeassistant.util.json import load_json_object
from .const import (
    DOMAIN,
    CONF_DEVICE_FINGERPRINT,
    TOKEN,
    CUSTOMER_ID,
    CODE_PASSWORD_WRONG,
    CODE_UNKNOWN_DEVICE,
    MFA_TOKEN,
    MFA_CODE,
    CODE_MFA_CODE_WRONG,
    PERSISTENCE
)
from homeassistant.helpers.aiohttp_client import async_get_clientsession
from .coordinator import RyanairCoordinator, RyanairMfaCoordinator
from .errors import CannotConnect

CREDENTIALS = Path(__file__).parent / PERSISTENCE

STEP_USER_DATA_SCHEMA = vol.Schema(
    {
        vol.Required(CONF_EMAIL): str,
        vol.Required(CONF_PASSWORD): str,
    }
)
STEP_MFA = vol.Schema(
    {
        vol.Required(MFA_CODE): str,
    }
)


async def validate_input(hass: HomeAssistant, data: dict[str, Any]) -> dict[str, Any]:
    """Validate the user input allows us to connect."""
    session = async_get_clientsession(hass)
    coordinator = RyanairCoordinator(hass, session, data)

    await coordinator.async_refresh()

    if coordinator.last_exception is not None:
        raise coordinator.last_exception

    body = coordinator.data

    err = None
    responseData = None
    if "code" in body:
        # Password is wrong, so display message.
        # {"code": "Mfa.Wrong.Code","message": "Mfa wrong code", "additionalData": [{"code": "Mfa.Available.Attempts","message": "4"}]}
        if body["code"] == CODE_PASSWORD_WRONG:
            err = (
                body["message"]
                + " "
                + body["additionalData"][0]["message"]
                + " retries remaining"
            )
        # New device, begin MFA process
        # {'code': 'Account.UnknownDeviceFingerprint', 'message': 'Unknown device fingerprint', 'additionalData': [{'code': 'Mfa.Token', 'message': '<MFA_TOKEN>'}]}
        if body["code"] == CODE_UNKNOWN_DEVICE:
            responseData = {MFA_TOKEN: body["additionalData"][0]["message"]}
    # Successful Login
    # {"customerId": "<CUSTOMER_ID>","token": "<ACCESS_TOKEN>"}
    if CUSTOMER_ID in body:
        responseData = {CUSTOMER_ID: body[CUSTOMER_ID], TOKEN: body[TOKEN]}

    # Return info that you want to store in the config entry.
    return {"title": str(data[CONF_EMAIL]), "data": responseData, "error": err}


async def validate_mfa_input(
    hass: HomeAssistant, data: dict[str, Any]
) -> dict[str, Any]:
    """Validate the MFA input allows us to connect."""

    session = async_get_clientsession(hass)
    coordinator = RyanairMfaCoordinator(hass, session, data)

    await coordinator.async_refresh()

    if coordinator.last_exception is not None:
        raise coordinator.last_exception

    body = coordinator.data

    err = None
    responseData = None
    # MFA Code is wrong, so display message.
    # {"code": "Mfa.Wrong.Code","message": "Mfa wrong code", "additionalData": [{"code": "Mfa.Available.Attempts","message": "4"}]}
    if "code" in body:
        if body["code"] == CODE_MFA_CODE_WRONG:
            err = (
                body["message"]
                + " "
                + body["additionalData"][0]["message"]
                + " retries remaining"
            )
    # Successful Login
    # {"customerId": "<CUSTOMER_ID>","token": "<ACCESS_TOKEN>"}
    if CUSTOMER_ID in body:
        responseData = {CUSTOMER_ID: body[CUSTOMER_ID], TOKEN: body[TOKEN]}

    return {"title": str(data[CONF_EMAIL]), "data": responseData, "error": err}


class ConfigFlow(config_entries.ConfigFlow, domain=DOMAIN):
    """Handle a config flow for Ryanair."""

    VERSION = 1

    def __init__(self) -> None:
        self._mfa_token: str | None = None
        self._fingerprint: str | None = None
        self._email: str | None = None

    async def async_step_mfa(
        self, user_input: dict[str, Any] | None = None
    ) -> FlowResult:
        """Handle the MFA step."""

        errors = {}
        placeholder = ""
        user_input[MFA_TOKEN] = self._mfa_token
        user_input[CONF_EMAIL] = self._email
        user_input[CONF_DEVICE_FINGERPRINT] = self._fingerprint

        try:
            info = await validate_mfa_input(self.hass, user_input)
        except CannotConnect:
            errors["base"] = "cannot_connect"
        else:
            if info["error"] is not None:
                errors["base"] = "invalid_auth"
                placeholder = info["error"]
            else:
                # if data is not null and contains MFA TOKEN then initiate MFA capture
                if CUSTOMER_ID in info["data"]:
                    users = load_json_object(CREDENTIALS)

                    users[user_input[CONF_DEVICE_FINGERPRINT]
                          ][CONF_DEVICE_FINGERPRINT] = user_input[CONF_DEVICE_FINGERPRINT]
                    users[user_input[CONF_DEVICE_FINGERPRINT]
                          ][CUSTOMER_ID] = info["data"][CUSTOMER_ID]
                    users[user_input[CONF_DEVICE_FINGERPRINT]
                          ][TOKEN] = info["data"][TOKEN]

                    save_json(CREDENTIALS, users)
                    return self.async_create_entry(
                        title=info["title"], data=users[user_input[CONF_DEVICE_FINGERPRINT]]
                    )

        return self.async_show_form(
            step_id="mfa",
            data_schema=STEP_MFA,
            description_placeholders={"email": placeholder},
            errors=errors,
        )

    async def async_step_user(
        self, user_input: dict[str, Any] | None = None
    ) -> FlowResult:
        """Handle the initial step."""
        if user_input is None:
            return self.async_show_form(
                step_id="user",
                data_schema=STEP_USER_DATA_SCHEMA,
                description_placeholders={"retries": ""},
            )

        errors = {}
        placeholder = ""

        unique_id = hashlib.md5(
            user_input[CONF_EMAIL].encode("UTF-8")).hexdigest()
        self._fingerprint = str(uuid.UUID(hex=unique_id))
        self._email = user_input[CONF_EMAIL]

        user_input[CONF_DEVICE_FINGERPRINT] = self._fingerprint

        users = load_json_object(CREDENTIALS)
        ryanairData = {
            CONF_EMAIL: user_input[CONF_EMAIL],
            CONF_PASSWORD: user_input[CONF_PASSWORD],
            CONF_DEVICE_FINGERPRINT: user_input[CONF_DEVICE_FINGERPRINT],
        }
        users[user_input[CONF_DEVICE_FINGERPRINT]] = ryanairData
        save_json(CREDENTIALS, users)
        try:
            info = await validate_input(self.hass, user_input)
        except CannotConnect:
            errors["base"] = "cannot_connect"
        else:
            if info["error"] is not None:
                errors["base"] = "invalid_auth"
                placeholder = info["error"]
            else:
                # if data is not null and contains MFA TOKEN then initiate MFA capture
                if info["data"] is not None:
                    # MFA TOKEN initiates MFA code capture
                    if MFA_TOKEN in info["data"]:
                        self._mfa_token = info["data"][MFA_TOKEN]
                        return self.async_show_form(
                            step_id="mfa",
                            data_schema=STEP_MFA,
                            description_placeholders={
                                "email": "Please enter the 8 character verification code sent to "
                                + info["title"]
                            },
                        )
                    if CUSTOMER_ID in info["data"]:
                        users = load_json_object(CREDENTIALS)

                        users[user_input[CONF_DEVICE_FINGERPRINT]
                              ][CONF_DEVICE_FINGERPRINT] = user_input[CONF_DEVICE_FINGERPRINT]
                        users[user_input[CONF_DEVICE_FINGERPRINT]
                              ][CUSTOMER_ID] = info["data"][CUSTOMER_ID]
                        users[user_input[CONF_DEVICE_FINGERPRINT]
                              ][TOKEN] = info["data"][TOKEN]

                        save_json(CREDENTIALS, users)
                        return self.async_create_entry(
                            title=info["title"], data=users[user_input[CONF_DEVICE_FINGERPRINT]]
                        )

        return self.async_show_form(
            step_id="user",
            data_schema=STEP_USER_DATA_SCHEMA,
            description_placeholders={"retries": placeholder},
            errors=errors,
        )
