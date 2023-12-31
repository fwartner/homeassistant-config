"""Ember Mug Custom Integration."""
from __future__ import annotations

import asyncio
import logging
from sys import version_info
from typing import TYPE_CHECKING

from bleak import BleakError
from ember_mug import EmberMug
from homeassistant.components import bluetooth
from homeassistant.components.bluetooth import (
    BluetoothCallbackMatcher,
    BluetoothScanningMode,
)
from homeassistant.const import (
    CONF_ADDRESS,
    CONF_MAC,
    CONF_NAME,
    CONF_TEMPERATURE_UNIT,
    EVENT_HOMEASSISTANT_STOP,
    Platform,
    UnitOfTemperature,
)
from homeassistant.exceptions import ConfigEntryNotReady

from .const import CONF_DEBUG, CONF_INCLUDE_EXTRA, DOMAIN
from .coordinator import MugDataUpdateCoordinator
from .models import HassMugData

if version_info.minor < 12:
    # library required before Python 3.12
    import async_timeout
else:
    async_timeout = asyncio

if TYPE_CHECKING:
    from homeassistant.config_entries import ConfigEntry
    from homeassistant.core import Event, HomeAssistant


PLATFORMS = [
    Platform.BINARY_SENSOR,
    Platform.LIGHT,
    Platform.NUMBER,
    Platform.SELECT,
    Platform.SENSOR,
    Platform.TEXT,
]
_LOGGER = logging.getLogger(__name__)


async def async_setup_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Set up Mug Platform."""
    if DOMAIN not in hass.data:
        hass.data[DOMAIN] = {}

    address: str = entry.data[CONF_ADDRESS].upper()
    ble_device = bluetooth.async_ble_device_from_address(hass, address)
    if not ble_device:
        raise ConfigEntryNotReady(
            f"Could not find Ember Mug with address {entry.data[CONF_ADDRESS]}",
        )

    ember_mug = EmberMug(
        ble_device,
        include_extra=entry.data.get(CONF_INCLUDE_EXTRA, False),
        debug=entry.data.get(CONF_DEBUG, False),
    )
    mug_coordinator = MugDataUpdateCoordinator(
        hass,
        _LOGGER,
        ember_mug,
        entry.unique_id,
        entry.data.get(CONF_NAME, entry.title),
    )

    startup_event = asyncio.Event()
    cancel_first_update = mug_coordinator.mug.register_callback(
        lambda *_: startup_event.set(),
    )

    entry.async_on_unload(
        bluetooth.async_register_callback(
            hass,
            mug_coordinator.handle_bluetooth_event,
            BluetoothCallbackMatcher(address=address, connectable=True),
            BluetoothScanningMode.ACTIVE,
        ),
    )

    try:
        await mug_coordinator.async_config_entry_first_refresh()
    except ConfigEntryNotReady:
        cancel_first_update()
        raise

    try:
        async with async_timeout.timeout(60):
            await startup_event.wait()
    except TimeoutError as ex:
        raise ConfigEntryNotReady(
            "Unable to communicate with the device; "
            f"Try moving the Bluetooth adapter closer to {mug_coordinator.data.name}",
        ) from ex
    finally:
        cancel_first_update()

    entry.async_on_unload(
        bluetooth.async_track_unavailable(
            hass,
            mug_coordinator.handle_unavailable,
            address,
        ),
    )

    hass.data.setdefault(DOMAIN, {})[entry.entry_id] = HassMugData(
        ember_mug,
        mug_coordinator,
    )

    await set_temperature_unit(mug_coordinator, entry.data[CONF_TEMPERATURE_UNIT])
    entry.async_on_unload(entry.add_update_listener(async_update_listener))
    await hass.config_entries.async_forward_entry_setups(entry, PLATFORMS)

    async def _async_stop(event: Event) -> None:
        """Close the connection."""
        await mug_coordinator.mug.disconnect()

    entry.async_on_unload(
        hass.bus.async_listen_once(EVENT_HOMEASSISTANT_STOP, _async_stop),
    )

    return True


async def set_temperature_unit(
    mug_coordinator: MugDataUpdateCoordinator,
    unit: UnitOfTemperature,
) -> None:
    """Try to set Mug Unit if different from current one."""
    if mug_coordinator.data.temperature_unit == unit:
        # No need
        return
    try:
        async with async_timeout.timeout(10):
            await mug_coordinator.mug.set_temperature_unit(unit)
    except (BleakError, TimeoutError, EOFError) as e:
        _LOGGER.warning("Unable to set temperature unit to %s: %s.", unit, e)


async def async_update_listener(hass: HomeAssistant, entry: ConfigEntry) -> None:
    """Handle options update."""
    await hass.config_entries.async_reload(entry.entry_id)


async def async_migrate_entry(hass, config_entry: ConfigEntry):
    """Migrate old entry."""
    _LOGGER.debug("Migrating from version %s", config_entry.version)

    if config_entry.version == 1:
        config_entry.version = 2
        old_data = {**config_entry.data}
        unit = old_data.get(CONF_TEMPERATURE_UNIT, "°C")
        hass.config_entries.async_update_entry(
            config_entry,
            data={
                CONF_ADDRESS: old_data[CONF_MAC],
                CONF_NAME: old_data[CONF_NAME],
                CONF_TEMPERATURE_UNIT: UnitOfTemperature.FAHRENHEIT if unit == "°F" else UnitOfTemperature.CELSIUS,
                CONF_INCLUDE_EXTRA: False,
                CONF_DEBUG: False,
            },
        )

    _LOGGER.info("Migration to version %s successful", config_entry.version)
    return True


async def async_unload_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Unload a config entry."""
    unload_ok = await hass.config_entries.async_unload_platforms(entry, PLATFORMS)
    if unload_ok:
        hass_mug_data: HassMugData = hass.data[DOMAIN].pop(entry.entry_id)
        await hass_mug_data.coordinator.mug.disconnect()

        if not hass.config_entries.async_entries(DOMAIN):
            hass.data.pop(DOMAIN)

    return unload_ok
