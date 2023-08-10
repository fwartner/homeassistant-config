"""Music Assistant (music-assistant.github.io) integration."""
from __future__ import annotations

from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.exceptions import ConfigEntryError
from homeassistant.helpers.issue_registry import IssueSeverity, async_create_issue

from .const import DOMAIN


# ruff: noqa: PLR0915, ARG001
async def async_setup_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Set up from a config entry."""
    async_create_issue(
        hass,
        DOMAIN,
        "not_compatible",
        is_fixable=False,
        severity=IssueSeverity.ERROR,
        learn_more_url="https://github.com/music-assistant/hass-music-assistant/blob/main/README.md#installation-of-the-home-assistant-beta-integration",
        translation_key="not_compatible",
    )
    raise ConfigEntryError("Incompatible version")
