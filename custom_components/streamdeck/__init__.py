"""The Stream Deck integration."""
from __future__ import annotations

import asyncio
from enum import Enum
import logging
import re

from mdiicons import MDI
from streamdeckapi import SDWebsocketMessage, StreamDeckApi
import voluptuous as vol

from homeassistant.components import climate
from homeassistant.components.climate import SERVICE_SET_TEMPERATURE, HVACMode
from homeassistant.components.media_player import (
    ATTR_MEDIA_VOLUME_LEVEL,
    SERVICE_MEDIA_PAUSE,
    SERVICE_MEDIA_PLAY,
    STATE_PLAYING,
)
from homeassistant.components.select import SelectEntity
from homeassistant.config_entries import ConfigEntry
from homeassistant.const import (
    ATTR_DEVICE_ID,
    ATTR_ENTITY_ID,
    ATTR_TEMPERATURE,
    ATTR_UNIT_OF_MEASUREMENT,
    CONF_BRIGHTNESS,
    CONF_ENTITY_ID,
    CONF_EVENT_DATA,
    CONF_HOST,
    CONF_MODEL,
    CONF_NAME,
    CONF_UNIQUE_ID,
    EVENT_STATE_CHANGED,
    SERVICE_TOGGLE,
    SERVICE_TURN_ON,
    SERVICE_VOLUME_SET,
    STATE_OFF,
    STATE_ON,
    STATE_UNAVAILABLE,
    Platform,
)
from homeassistant.core import Event, HomeAssistant, ServiceCall, State
from homeassistant.exceptions import ConfigEntryNotReady
from homeassistant.helpers.entity import DeviceInfo
from homeassistant.helpers.typing import ConfigType

from .const import (
    ATTR_POSITION,
    ATTR_UUID,
    CLIMATE_UP_DOWN_STEPS,
    COLOR_ACTIVE,
    COLOR_INACTIVE,
    COLOR_MODIFIER,
    COLOR_OFF,
    COLOR_ON,
    COLOR_UNAVAILABLE,
    CONF_BUTTONS,
    CONF_ENABLED_PLATFORMS,
    CONF_SHOW_NAME,
    CONF_VERSION,
    DATA_API,
    DATA_CURRENT_ENTITY,
    DATA_SELECT_ENTITIES,
    DEFAULT_ICONS,
    DEFAULT_PLATFORMS,
    DOMAIN,
    EVENT_LONG_PRESS,
    EVENT_SHORT_PRESS,
    LIGHT_UP_DOWN_STEPS,
    MANUFACTURER,
    MDI_DEFAULT,
    MDI_PREFIX,
    SELECT_DEFAULT_OPTIONS,
    SELECT_OPTION_DOWN,
    SELECT_OPTION_UP,
    TOGGLEABLE_PLATFORMS,
    UP_DOWN_PLATFORMS,
    VOLUME_UP_DOWN_STEPS,
)

_LOGGER = logging.getLogger(__name__)
PLATFORMS: list[Platform] = [Platform.SELECT]


def setup(hass: HomeAssistant, config: ConfigType) -> bool:
    """Set up Stream Deck Integration."""

    async def sevice_sdinfo(call: ServiceCall) -> None:
        """Handle Service sdinfo."""
        entries: list[ConfigEntry] = hass.config_entries.async_entries(DOMAIN)
        for entry in entries:
            _LOGGER.info(entry.entry_id)
            api: StreamDeckApi = hass.data[DOMAIN][entry.entry_id][DATA_API]
            if not isinstance(api, StreamDeckApi):
                return
            info = await api.get_info()
            if info is not None:
                hass.bus.async_fire(
                    f"{DOMAIN}_status", {CONF_HOST: api.host, CONF_EVENT_DATA: info}
                )

    async def sevice_dump(call: ServiceCall) -> None:
        """Handle Service dump."""
        entries: list[ConfigEntry] = hass.config_entries.async_entries(DOMAIN)
        for entry in entries:
            _LOGGER.info(entry.entry_id)
            hass.bus.async_fire(
                f"{DOMAIN}_dump",
                {
                    "entry_id": entry.entry_id,
                    CONF_BUTTONS: entry.data.get(CONF_BUTTONS),
                    CONF_UNIQUE_ID: entry.data.get(CONF_UNIQUE_ID),
                    CONF_ENABLED_PLATFORMS: entry.data.get(CONF_ENABLED_PLATFORMS),
                },
            )

    # Register services
    hass.services.register(DOMAIN, "sdinfo", sevice_sdinfo, schema=vol.Schema({}))
    hass.services.register(DOMAIN, "dump", sevice_dump, schema=vol.Schema({}))

    return True


async def async_setup_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Set up Stream Deck from a config entry."""

    host = entry.data.get(CONF_HOST, "")
    api: StreamDeckApi | None = None

    def on_button_press(uuid: str):
        button = StreamDeckButton.get_button(hass, entry.entry_id, uuid)
        button.button_pressed()

    def on_ws_message(msg: SDWebsocketMessage):
        hass.bus.async_fire(
            f"{DOMAIN}_{msg.event}", {CONF_HOST: host, CONF_EVENT_DATA: msg.args}
        )
        if msg.event == EVENT_SHORT_PRESS and isinstance(msg.args, str):
            on_button_press(msg.args)
        elif msg.event == EVENT_LONG_PRESS and isinstance(msg.args, str):
            # Update current entity
            entity = get_button_entity(hass, entry.entry_id, msg.args)
            if entity is None:
                return
            hass.data[DOMAIN][entry.entry_id][DATA_CURRENT_ENTITY] = entity
            _LOGGER.info("Set current button to %s", entity)
            # Update icons for UP and DOWN buttons (updates all buttons, in case there are multiple)
            StreamDeckButton.update_all_button_icons(hass, entry.entry_id)

    # Create data structure
    hass.data.setdefault(DOMAIN, {})
    hass.data[DOMAIN].setdefault(entry.entry_id, {})
    hass.data[DOMAIN][entry.entry_id][DATA_CURRENT_ENTITY] = None
    hass.data[DOMAIN][entry.entry_id][CONF_SHOW_NAME] = entry.data.get(CONF_SHOW_NAME)
    hass.data[DOMAIN][entry.entry_id].setdefault(DATA_SELECT_ENTITIES, [])

    # Create API client
    hass.data[DOMAIN][entry.entry_id][DATA_API] = StreamDeckApi(
        host,
        on_ws_message=on_ws_message,
        on_ws_connect=lambda: StreamDeckButton.update_all_button_icons(
            hass, entry.entry_id
        ),
    )
    api = hass.data[DOMAIN][entry.entry_id][DATA_API]

    if api is None:
        return False

    # Check if Stream Deck is available
    info = await api.get_info()
    if info is None:
        _LOGGER.error("Stream Deck not available at %s", api.host)
        raise ConfigEntryNotReady(f"Timeout while connecting to {api.host}")

    await hass.config_entries.async_forward_entry_setups(entry, PLATFORMS)

    # Register update listener for options flow updates
    entry.async_on_unload(entry.add_update_listener(update_listener))

    # Fill config entry with buttons
    button_entries = {}
    for _, button_info in info.buttons.items():
        button = StreamDeckButton(button_info.uuid, hass, entry.entry_id)
        button.set_type(ButtonType.ENTITY_BUTTON)
        button.set_entity("")
        button_entries[button_info.uuid] = button.to_dict()
    current_buttons: dict = entry.data[CONF_BUTTONS]
    for uuid, config in current_buttons.items():
        button = StreamDeckButton.from_dict(config, hass, entry.entry_id)
        button_entries[uuid] = button.to_dict()
    changed = hass.config_entries.async_update_entry(
        entry,
        data={
            **entry.data,
            **{CONF_BUTTONS: button_entries},
        },
    )
    if changed is False:
        _LOGGER.error(
            "Method async_setup_entry: Config entry %s has not been changed",
            entry.entry_id,
        )

    api.start_websocket_loop()

    # Add listener for entity change events
    hass.bus.async_listen(
        EVENT_STATE_CHANGED,
        lambda event: on_entity_state_change(hass, entry.entry_id, event),
    )

    return True


async def async_unload_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Unload a config entry."""
    api: StreamDeckApi = hass.data[DOMAIN][entry.entry_id][DATA_API]
    api.stop_websocket_loop()
    if unload_ok := await hass.config_entries.async_unload_platforms(
        entry, [Platform.SELECT]
    ):
        hass.data[DOMAIN].pop(entry.entry_id)
    return unload_ok


async def update_listener(hass: HomeAssistant, entry: ConfigEntry):
    """Handle options update."""
    hass.data[DOMAIN][entry.entry_id][CONF_SHOW_NAME] = entry.data.get(CONF_SHOW_NAME)
    StreamDeckButton.update_all_button_icons(hass, entry.entry_id)


#
#   Entities
#


class StreamDeckSelect(SelectEntity):
    """Stream Deck Select sensor."""

    def __init__(
        self,
        device: DeviceInfo | None,
        uuid: str,
        entry_id: str,
        enabled_platforms: list[str],
        position: str,
        button_device: str,
        initial: str = "",
    ) -> None:
        """Init the select sensor."""
        self._attr_name = f"{uuid} ({position})"
        self._attr_unique_id = get_unique_id(f"{uuid}")
        self._attr_device_info = device
        self._sd_entry_id = entry_id
        self._btn_uuid = uuid
        self._enabled_platforms = enabled_platforms
        self._attr_options = SELECT_DEFAULT_OPTIONS
        self._attr_current_option = initial
        self._attr_extra_state_attributes = {
            ATTR_UUID: uuid,
            ATTR_POSITION: position,
            ATTR_DEVICE_ID: button_device,
        }

    async def async_select_option(self, option: str) -> None:
        """Change the selected option."""
        self._attr_current_option = option
        # Get current config entry
        entry = self.hass.config_entries.async_get_entry(self._sd_entry_id)
        if entry is None:
            _LOGGER.error(
                "Method async_select_option: Config entry %s not available",
                self._sd_entry_id,
            )
            return
        if entry.data.get(CONF_BUTTONS) is None:
            _LOGGER.error(
                "Method async_select_option: Config entry %s has no data for 'buttons'",
                self._sd_entry_id,
            )
            return

        # Create Button object
        button = StreamDeckButton(self._btn_uuid, self.hass, self._sd_entry_id)
        if option == SELECT_OPTION_UP:
            button.set_type(ButtonType.PLUS_BUTTON)
        elif option == SELECT_OPTION_DOWN:
            button.set_type(ButtonType.MINUS_BUTTON)
        else:
            button.set_type(ButtonType.ENTITY_BUTTON)
            button.set_entity(option)

        # Update config entry
        changed = self.hass.config_entries.async_update_entry(
            entry,
            data={
                **entry.data,
                **{
                    CONF_BUTTONS: {
                        **entry.data[CONF_BUTTONS],
                        **{self._btn_uuid: button.to_dict()},
                    }
                },
            },
        )
        if changed is False:
            _LOGGER.error(
                "Method async_select_option: Config entry %s has not been changed",
                self._sd_entry_id,
            )
        button.update_icon()

    async def async_set_options(self, options: list[str]) -> None:
        """Set options."""
        self._attr_options = options

        if self.current_option not in self.options:
            _LOGGER.warning(
                "Current option: %s no longer valid (possible options: %s)",
                self.current_option,
                ", ".join(self.options),
            )

        self.async_write_ha_state()


#
#   Button class
#


class ButtonType(Enum):
    """Stream Deck Button type."""

    UNDEFINED = 0
    ENTITY_BUTTON = 1
    PLUS_BUTTON = 2
    MINUS_BUTTON = 3


class StreamDeckButton:
    """Stream Deck Button class."""

    def __init__(self, uuid: str, hass: HomeAssistant, entry_id: str) -> None:
        """Init Stream Deck Button."""
        self.button_type = ButtonType.UNDEFINED
        self.entity = ""
        self.uuid = uuid
        self.hass = hass
        self.entry_id = entry_id
        self.api: StreamDeckApi = hass.data[DOMAIN][entry_id][DATA_API]

    def set_entity(self, entity: str):
        """Set entity."""
        self.entity = entity

    def get_entity(self):
        """Get entity."""
        return self.entity

    def set_type(self, button_type: ButtonType):
        """Set type."""
        self.button_type = button_type

    def get_type(self):
        """Get type."""
        return self.button_type

    @staticmethod
    def from_dict(obj: dict, hass: HomeAssistant, entry_id: str):
        """Create object from dict."""
        button = StreamDeckButton(obj["uuid"], hass, entry_id)
        button.set_type(ButtonType(obj["button_type"]))
        button.set_entity(obj["entity"])
        return button

    def to_dict(self):
        """Convert to dict."""
        return {
            "uuid": self.uuid,
            "button_type": self.button_type,
            "entity": self.entity,
        }

    @staticmethod
    def get_button(hass: HomeAssistant, entry_id: str, uuid: str):
        """Get button by entry_id and uuid."""
        # Get config entry
        loaded_entry = hass.config_entries.async_get_entry(entry_id)
        if loaded_entry is None:
            return None

        # Get buttons from entry
        buttons = loaded_entry.data.get(CONF_BUTTONS)
        if not isinstance(buttons, dict):
            _LOGGER.error(
                "Method StreamDeckButton.get_button: Config entry %s has no data for 'buttons'",
                entry_id,
            )
            return None

        # Get button
        button_config = buttons.get(uuid)
        if not isinstance(button_config, dict):
            _LOGGER.info(
                "Method StreamDeckButton.get_button: Config entry %s has no data for buttons.%s",
                entry_id,
                uuid,
            )
            return None
        return StreamDeckButton.from_dict(button_config, hass, entry_id)

    def toggle_climate(self, state: State):
        """Toggle climate entity."""
        if state.attributes.get(climate.ATTR_HVAC_ACTION) == HVACMode.OFF:
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    climate.SERVICE_TURN_ON,
                    target={CONF_ENTITY_ID: self.entity},
                ),
                self.hass.loop,
            )
        else:
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    climate.SERVICE_TURN_OFF,
                    target={CONF_ENTITY_ID: self.entity},
                ),
                self.hass.loop,
            )

    def toggle_media_player(self, state: State):
        """Toggle media_player entity."""
        if state.state != STATE_PLAYING:
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    SERVICE_MEDIA_PLAY,
                    target={CONF_ENTITY_ID: self.entity},
                ),
                self.hass.loop,
            )
        else:
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    SERVICE_MEDIA_PAUSE,
                    target={CONF_ENTITY_ID: self.entity},
                ),
                self.hass.loop,
            )

    def light_control(self, state: State):
        """Handle light controls."""

        # Get current brightness
        brightness = state.attributes.get(CONF_BRIGHTNESS)
        if not isinstance(brightness, int):
            # If light is not on, turn on with smallest brightness
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    SERVICE_TURN_ON,
                    target={CONF_ENTITY_ID: state.entity_id},
                    service_data={CONF_BRIGHTNESS: LIGHT_UP_DOWN_STEPS},
                ),
                self.hass.loop,
            )
            return

        # Update brightness
        if self.button_type == ButtonType.PLUS_BUTTON:
            brightness = min(brightness + LIGHT_UP_DOWN_STEPS, 255)
        elif self.button_type == ButtonType.MINUS_BUTTON:
            brightness = max(brightness - LIGHT_UP_DOWN_STEPS, 0)

        # Write new brightness
        asyncio.run_coroutine_threadsafe(
            self.hass.services.async_call(
                state.domain,
                SERVICE_TURN_ON,
                target={CONF_ENTITY_ID: state.entity_id},
                service_data={CONF_BRIGHTNESS: brightness},
            ),
            self.hass.loop,
        )

    def climate_control(self, state: State):
        """Handle climate controls."""

        # Get current temperature
        temperature = state.attributes.get(ATTR_TEMPERATURE)
        if not isinstance(temperature, int):
            # If climate device is not on, turn on
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    SERVICE_SET_TEMPERATURE,
                    target={CONF_ENTITY_ID: state.entity_id},
                ),
                self.hass.loop,
            )
            return

        # Update temperature
        if self.button_type == ButtonType.PLUS_BUTTON:
            temperature = temperature + CLIMATE_UP_DOWN_STEPS
        elif self.button_type == ButtonType.MINUS_BUTTON:
            temperature = temperature - CLIMATE_UP_DOWN_STEPS

        # Write new temperature
        asyncio.run_coroutine_threadsafe(
            self.hass.services.async_call(
                state.domain,
                SERVICE_SET_TEMPERATURE,
                target={CONF_ENTITY_ID: state.entity_id},
                service_data={ATTR_TEMPERATURE: temperature},
            ),
            self.hass.loop,
        )

    def media_player_control(self, state: State):
        """Handle media_player controls."""

        # Get current volume
        volume = state.attributes.get(ATTR_MEDIA_VOLUME_LEVEL)
        if not isinstance(volume, float):
            # If media_player device is not on, turn on with smallest volume
            asyncio.run_coroutine_threadsafe(
                self.hass.services.async_call(
                    state.domain,
                    SERVICE_VOLUME_SET,
                    target={CONF_ENTITY_ID: state.entity_id},
                    service_data={ATTR_MEDIA_VOLUME_LEVEL: VOLUME_UP_DOWN_STEPS},
                ),
                self.hass.loop,
            )
            return

        # Update volume
        if self.button_type == ButtonType.PLUS_BUTTON:
            volume = min(volume + VOLUME_UP_DOWN_STEPS, 1)
        elif self.button_type == ButtonType.MINUS_BUTTON:
            volume = max(volume - VOLUME_UP_DOWN_STEPS, 0)

        # Write new volume
        asyncio.run_coroutine_threadsafe(
            self.hass.services.async_call(
                state.domain,
                SERVICE_VOLUME_SET,
                target={CONF_ENTITY_ID: state.entity_id},
                service_data={ATTR_MEDIA_VOLUME_LEVEL: volume},
            ),
            self.hass.loop,
        )

    def button_pressed(self):
        """Handle button press."""

        if self.button_type == ButtonType.ENTITY_BUTTON and self.entity != "":
            # Get current state
            state = self.hass.states.get(self.entity)
            if state is None:
                _LOGGER.warning("Method StreamDeckButton.button_pressed: state is None")
                return

            # Check if domain can be toggled
            if state.domain not in TOGGLEABLE_PLATFORMS:
                return

            # Toggle entity
            if state.domain == climate.DOMAIN:
                self.toggle_climate(state)
            elif state.domain == Platform.MEDIA_PLAYER:
                self.toggle_media_player(state)
            else:
                asyncio.run_coroutine_threadsafe(
                    self.hass.services.async_call(
                        state.domain,
                        SERVICE_TOGGLE,
                        target={CONF_ENTITY_ID: self.entity},
                    ),
                    self.hass.loop,
                )

            # Save last pressed entity to use for UP and DOWN buttons
            self.hass.data[DOMAIN][self.entry_id][DATA_CURRENT_ENTITY] = self.entity

            # Update icons for UP and DOWN buttons (updates all buttons, in case there are multiple)
            StreamDeckButton.update_all_button_icons(self.hass, self.entry_id)

        if self.button_type in (ButtonType.PLUS_BUTTON, ButtonType.MINUS_BUTTON):
            # Get current entity
            base_entity = self.hass.data[DOMAIN][self.entry_id][DATA_CURRENT_ENTITY]
            if base_entity is None:
                return

            # Get state of current entity
            state = self.hass.states.get(base_entity)
            if state is None:
                _LOGGER.warning("Method StreamDeckButton.button_pressed: state is None")
                return

            # Check state if entity has up or down options
            if state.domain not in UP_DOWN_PLATFORMS:
                _LOGGER.debug(
                    "Method StreamDeckButton.button_pressed: %s has no service for UP or DOWN",
                    state.entity_id,
                )
                return

            # Handle Light Platform
            if state.domain == Platform.LIGHT:
                self.light_control(state)
            elif state.domain == climate.DOMAIN:
                self.climate_control(state)
            elif state.domain == Platform.MEDIA_PLAYER:
                self.media_player_control(state)

    @staticmethod
    def update_all_button_icons(hass: HomeAssistant, entry_id: str):
        """Initialize all buttons."""
        # Get config_entry
        loaded_entry = hass.config_entries.async_get_entry(entry_id)
        if loaded_entry is None:
            return None

        # Get buttons
        buttons = loaded_entry.data.get(CONF_BUTTONS)
        if not isinstance(buttons, dict):
            _LOGGER.error(
                "Method update_all_button_icons: Config entry %s has no data for 'buttons'",
                entry_id,
            )
            return

        _LOGGER.info(
            "Method update_all_button_icons: Found %s buttons. Updating icons",
            len(buttons),
        )

        for _, button_config in buttons.items():
            button = StreamDeckButton.from_dict(button_config, hass, entry_id)
            button.update_icon()

    def update_icon(self):
        """Update icon of button."""
        entity = self.entity

        _LOGGER.info(
            "Method StreamDeckButton.update_icon: Setting icon of %s, button type: %s",
            self.uuid,
            self.button_type,
        )

        svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                <rect width="72" height="72" fill="#a00" />
                <text text-anchor="middle" x="35" y="20" fill="#fff" font-size="13">{self.uuid.split("-")[0]}</text>
                <text text-anchor="middle" x="35" y="40" fill="#fff" font-size="13">{self.uuid.split("-")[1]}</text>
                <text text-anchor="middle" x="35" y="60" fill="#fff" font-size="13">{self.uuid.split("-")[2]}</text>
                </svg>"""

        if self.button_type == ButtonType.ENTITY_BUTTON and self.entity == "":
            _LOGGER.info(
                "Method StreamDeckButton.update_icon: No entity selected for %s. Using default icon",
                self.uuid,
            )
            asyncio.run_coroutine_threadsafe(
                self.api.update_icon(self.uuid, svg), self.hass.loop
            )
            return

        if self.button_type in (ButtonType.PLUS_BUTTON, ButtonType.MINUS_BUTTON):
            base_entity = self.hass.data[DOMAIN][self.entry_id][DATA_CURRENT_ENTITY]

            if isinstance(base_entity, str):
                entity = base_entity
            else:
                # Initial Plus and Minus Buttons
                if self.button_type == ButtonType.PLUS_BUTTON:
                    svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                        <rect width="72" height="72" fill="#000" />
                        <rect x="10" y="10" width="52" height="52" fill="{COLOR_INACTIVE}" rx="5" />
                        <rect x="15" y="31" width="42" height="10" fill="#000" />
                        <rect x="31" y="15" width="10" height="42" fill="#000" />
                        </svg>"""
                elif self.button_type == ButtonType.MINUS_BUTTON:
                    svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                        <rect width="72" height="72" fill="#000" />
                        <rect x="10" y="10" width="52" height="52" fill="{COLOR_INACTIVE}" rx="5" />
                        <rect x="15" y="31" width="42" height="10" fill="#000" />
                        </svg>"""
                asyncio.run_coroutine_threadsafe(
                    self.api.update_icon(self.uuid, svg), self.hass.loop
                )
                return

        # Get state
        state = self.hass.states.get(entity)
        if state is None:
            _LOGGER.info(
                "Method StreamDeckButton.update_icon: State for entity %s is None",
                entity,
            )
            return

        # Set icon color
        icon_color = COLOR_ACTIVE
        modifier_color = COLOR_MODIFIER
        if state.state == STATE_UNAVAILABLE:
            icon_color = COLOR_UNAVAILABLE
        elif (
            state.state == STATE_ON
            or (state.domain == Platform.MEDIA_PLAYER and state.state != STATE_OFF)
            or (
                state.domain == climate.DOMAIN
                and state.state in (HVACMode.HEAT, HVACMode.HEAT_COOL, HVACMode.COOL)
            )
        ):
            icon_color = COLOR_ON
        elif state.state == STATE_OFF:
            icon_color = COLOR_OFF

        # Set icon color for Plus and Minus buttons
        if self.button_type in (ButtonType.PLUS_BUTTON, ButtonType.MINUS_BUTTON):
            icon_color = COLOR_ACTIVE
            if (
                state.domain not in UP_DOWN_PLATFORMS
                or state.state == STATE_UNAVAILABLE
            ):
                icon_color = COLOR_INACTIVE
                modifier_color = COLOR_INACTIVE

        # Get MDI Icon
        mdi_string: str | None = state.attributes.get("icon")
        if mdi_string is None:
            _LOGGER.info(
                "Method StreamDeckButton.update_icon: Icon of entity %s is None", entity
            )

            # Set default icon for entity
            mdi_string = MDI_DEFAULT

            # Try to use platform default icon
            platform_mdi = DEFAULT_ICONS.get(state.domain)
            if platform_mdi is not None:
                mdi_string = platform_mdi
                _LOGGER.info(
                    "Method StreamDeckButton.update_icon: Using platform default icon for %s",
                    entity,
                )

        if mdi_string.startswith(MDI_PREFIX):
            mdi_string = mdi_string.split(":", 1)[1]
        mdi = MDI.get_icon(mdi_string, icon_color)

        if self.hass.data[DOMAIN][self.entry_id][CONF_SHOW_NAME] is True:
            if self.button_type == ButtonType.PLUS_BUTTON:
                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <rect x="40" y="12" width="25" height="25" fill="{modifier_color}" rx="5" />
                    <rect x="45" y="22" width="15" height="5" fill="#000" />
                    <rect x="50" y="17" width="5" height="15" fill="#000" />
                    <text text-anchor="middle" x="35" y="65" fill="#fff" font-size="12">{state.name}</text>
                    <g transform="translate(14, 14) scale(0.5)">{mdi}</g>
                    </svg>"""
            elif self.button_type == ButtonType.MINUS_BUTTON:
                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <rect x="40" y="12" width="25" height="25" fill="{modifier_color}" rx="5" />
                    <rect x="45" y="22" width="15" height="5" fill="#000" />
                    <text text-anchor="middle" x="35" y="65" fill="#fff" font-size="12">{state.name}</text>
                    <g transform="translate(14, 14) scale(0.5)">{mdi}</g>
                    </svg>"""
            elif self.button_type == ButtonType.ENTITY_BUTTON:
                state_text = (
                    f'{state.state}{state.attributes.get(ATTR_UNIT_OF_MEASUREMENT, "")}'
                )

                if (
                    state.domain == Platform.LIGHT
                    and state.attributes.get(CONF_BRIGHTNESS) is not None
                ):
                    brightness = state.attributes.get(CONF_BRIGHTNESS)
                    brightness_pct = int(math_map(brightness, 0, 255, 0, 100))
                    state_text = f"{brightness_pct}%"
                elif (
                    state.domain == climate.DOMAIN
                    and state.attributes.get(ATTR_TEMPERATURE) is not None
                ):
                    temperature = state.attributes.get(ATTR_TEMPERATURE)
                    state_text = f"{temperature}°C"
                elif (
                    state.domain == Platform.MEDIA_PLAYER
                    and state.attributes.get(ATTR_MEDIA_VOLUME_LEVEL) is not None
                ):
                    volume = state.attributes.get(ATTR_MEDIA_VOLUME_LEVEL)
                    volume_pct = int(math_map(volume, 0, 1, 0, 100))
                    state_text = f"{volume_pct}%"

                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <text text-anchor="middle" x="35" y="15" fill="#fff" font-size="12">{state_text}</text>
                    <text text-anchor="middle" x="35" y="65" fill="#fff" font-size="12">{state.name}</text>
                    <g transform="translate(16, 12) scale(0.5)">{mdi}</g>
                    </svg>"""
        else:
            # Show Entity Icon without name
            if self.button_type == ButtonType.PLUS_BUTTON:
                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <rect x="40" y="12" width="25" height="25" fill="{modifier_color}" rx="5" />
                    <rect x="45" y="22" width="15" height="5" fill="#000" />
                    <rect x="50" y="17" width="5" height="15" fill="#000" />
                    <g transform="translate(10, 10) scale(0.7)">{mdi}</g>
                    </svg>"""
            elif self.button_type == ButtonType.MINUS_BUTTON:
                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <rect x="40" y="12" width="25" height="25" fill="{modifier_color}" rx="5" />
                    <rect x="45" y="22" width="15" height="5" fill="#000" />
                    <g transform="translate(10, 10) scale(0.7)">{mdi}</g>
                    </svg>"""
            elif self.button_type == ButtonType.ENTITY_BUTTON:
                svg = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 72">
                    <rect width="72" height="72" fill="#000" />
                    <g transform="translate(5, 0) scale(0.8)">{mdi}</g>
                    </svg>"""

        asyncio.run_coroutine_threadsafe(
            self.api.update_icon(self.uuid, svg), self.hass.loop
        )


#
#   Tools
#


def get_unique_id(name: str, sensor_type: str | None = None):
    """Generate an unique id."""
    res = re.sub("[^A-Za-z0-9]+", "_", name).lower()
    if sensor_type is not None:
        return f"{sensor_type}.{res}"
    return res


def device_info(entry) -> DeviceInfo:
    """Device info."""
    return DeviceInfo(
        identifiers={(DOMAIN, entry.data.get(CONF_UNIQUE_ID))},
        name=entry.data.get(CONF_NAME, None),
        manufacturer=MANUFACTURER,
        model=entry.data.get(CONF_MODEL, None),
        sw_version=entry.data.get(CONF_VERSION, None),
    )


def get_button_entity(hass: HomeAssistant, entry_id: str, uuid: str) -> str | None:
    """Get the selected entity for a button."""
    button = StreamDeckButton.get_button(hass, entry_id, uuid)
    if button is None:
        return None
    entity = button.get_entity()
    if not isinstance(entity, str):
        _LOGGER.info(
            "Method get_button_entity: Config entry %s has no data for buttons.%s.entity",
            entry_id,
            uuid,
        )
        return None
    return entity


def on_entity_state_change(hass: HomeAssistant, entry_id: str, event: Event):
    """Handle entity state changes."""
    entity_id = event.data.get(ATTR_ENTITY_ID)
    if entity_id is None:
        _LOGGER.error("Method on_entity_state_change: Event entity_id is None")
        return

    _LOGGER.debug(
        "Method on_entity_state_change: Received event for entity %s", entity_id
    )

    # Get config_entry
    loaded_entry = hass.config_entries.async_get_entry(entry_id)
    if loaded_entry is None:
        return None

    # Update select options
    domain_data: dict = hass.data[DOMAIN]
    entry_data = domain_data.get(entry_id)
    if not isinstance(entry_data, dict):
        return
    selects: list[StreamDeckSelect] = entry_data[DATA_SELECT_ENTITIES]
    for select in selects:
        asyncio.run_coroutine_threadsafe(
            select.async_set_options(
                SELECT_DEFAULT_OPTIONS
                + hass.states.async_entity_ids(
                    domain_filter=loaded_entry.data.get(
                        CONF_ENABLED_PLATFORMS, DEFAULT_PLATFORMS
                    )
                )
            ),
            hass.loop,
        )

    buttons = loaded_entry.data.get(CONF_BUTTONS)
    if not isinstance(buttons, dict):
        _LOGGER.error(
            "Method on_entity_state_change: Config entry %s has no data for 'buttons'",
            entry_id,
        )
        return None

    state = hass.states.get(entity_id)
    if state is None:
        return
    for _, button_config in buttons.items():
        if not isinstance(button_config, dict):
            continue
        button = StreamDeckButton.from_dict(button_config, hass, entry_id)
        if button.get_entity() == entity_id:
            button.update_icon()


# Copy of the arduino map() function (https://www.arduino.cc/reference/en/language/functions/math/map/)
def math_map(
    input_x: float, in_min: float, in_max: float, out_min: float, out_max: float
) -> float:
    """Map values to range."""
    return (input_x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
