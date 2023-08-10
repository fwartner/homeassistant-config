"""Config flow for MusicAssistant integration."""
from __future__ import annotations

from typing import Any

from homeassistant import config_entries
from homeassistant.data_entry_flow import FlowResult

from .const import DOMAIN


class ConfigFlow(config_entries.ConfigFlow, domain=DOMAIN):
    """Handle a config flow for MusicAssistant."""

    VERSION = 1

    async def async_step_user(
        self, user_input: dict[str, Any] | None = None  # noqa: ARG002
    ) -> FlowResult:
        """Handle the initial step."""
        return await self.async_step_manual()

    async def async_step_manual(self, user_input: dict[str, Any] | None = None) -> FlowResult:
        """Handle a manual configuration."""
