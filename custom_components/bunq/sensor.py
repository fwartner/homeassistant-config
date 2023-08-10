"""Support for bunq account balance."""
from __future__ import annotations
from .bunq_balance_sensor import BunqBalanceSensor
from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback
from .const import DOMAIN
from .coordinator import BunqDataUpdateCoordinator


async def async_setup_entry(
    hass: HomeAssistant, entry: ConfigEntry, async_add_entities: AddEntitiesCallback
) -> None:
    """Set up a bunq sensor entry."""
    coordinator: BunqDataUpdateCoordinator = hass.data[DOMAIN][entry.entry_id]
    sensors = []
    for account in coordinator.bunq.status.accounts:
        sensors.append(BunqBalanceSensor(coordinator, account))

    async_add_entities(
        sensors
    )