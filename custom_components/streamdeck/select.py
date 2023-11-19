"""Select Sensors for Stream Deck Integration."""


from streamdeckapi import StreamDeckApi

from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback

from . import ButtonType, StreamDeckButton, StreamDeckSelect, device_info
from .const import (
    CONF_BUTTONS,
    CONF_ENABLED_PLATFORMS,
    DATA_API,
    DATA_SELECT_ENTITIES,
    DEFAULT_PLATFORMS,
    DOMAIN,
    SELECT_OPTION_DOWN,
    SELECT_OPTION_UP,
)


# requests, aiohttp, pillow
async def async_setup_entry(
    hass: HomeAssistant, entry: ConfigEntry, async_add_entities: AddEntitiesCallback
) -> None:
    """Set up Stream Deck select sensors."""
    api: StreamDeckApi = hass.data[DOMAIN][entry.entry_id][DATA_API]
    info = await api.get_info()
    if isinstance(info, bool):
        return

    sensors_to_add = []
    for _, button_info in info.buttons.items():
        initial = ""
        buttons = entry.data.get(CONF_BUTTONS)
        if isinstance(buttons, dict):
            button_config = buttons.get(button_info.uuid)
            if isinstance(button_config, dict):
                button = StreamDeckButton.from_dict(button_config, hass, entry.entry_id)

                # Set initial value for select entity
                if button.get_type() == ButtonType.PLUS_BUTTON:
                    initial = SELECT_OPTION_UP
                elif button.get_type() == ButtonType.MINUS_BUTTON:
                    initial = SELECT_OPTION_DOWN
                else:
                    entity = button.get_entity()
                    if isinstance(entity, str):
                        initial = entity

                # Initialize button icon on load
                button.update_icon()

        sensors_to_add.append(
            StreamDeckSelect(
                device_info(entry),
                button_info.uuid,
                entry.entry_id,
                entry.data.get(CONF_ENABLED_PLATFORMS, DEFAULT_PLATFORMS),
                f"{button_info.position.x_pos}|{button_info.position.y_pos}",
                button_info.device,
                initial,
            )
        )

    hass.data[DOMAIN][entry.entry_id][DATA_SELECT_ENTITIES] = sensors_to_add

    async_add_entities(sensors_to_add)
