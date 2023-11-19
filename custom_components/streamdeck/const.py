"""Constants for the Stream Deck integration."""

from homeassistant.components import climate, input_boolean
from homeassistant.const import Platform

DOMAIN = "streamdeck"
MANUFACTURER = "Elgato"

# Data const
DATA_API = "api"
DATA_CURRENT_ENTITY = "current"
DATA_SELECT_ENTITIES = "select"

# Config entry const
CONF_BUTTONS = "buttons"
CONF_ENABLED_PLATFORMS = "enabled_platforms"
CONF_VERSION = "version"
CONF_SHOW_NAME = "show_name"

TOGGLEABLE_PLATFORMS = [
    climate.DOMAIN,
    Platform.COVER,
    Platform.FAN,
    Platform.HUMIDIFIER,
    input_boolean.DOMAIN,
    Platform.LIGHT,
    Platform.MEDIA_PLAYER,
    Platform.REMOTE,
    Platform.SIREN,
    Platform.SWITCH,
    Platform.VACUUM,
]
DEFAULT_ICONS = {
    climate.DOMAIN: "mdi:home-thermometer-outline",
    Platform.COVER: "mdi:window-closed",
    Platform.FAN: "mdi:fan",
    Platform.HUMIDIFIER: "mdi:air-humidifier",
    input_boolean.DOMAIN: "mdi:toggle-switch-off-outline",
    Platform.LIGHT: "mdi:lightbulb",
    Platform.MEDIA_PLAYER: "mdi:cast",
    Platform.REMOTE: "mdi:remote",
    Platform.SIREN: "mdi:bullhorn",
    Platform.SWITCH: "mdi:toggle-switch-variant",
    Platform.VACUUM: "mdi:vacuum",
}
UP_DOWN_PLATFORMS = [climate.DOMAIN, Platform.LIGHT, Platform.MEDIA_PLAYER]
LIGHT_UP_DOWN_STEPS = 15
CLIMATE_UP_DOWN_STEPS = 5
VOLUME_UP_DOWN_STEPS = 0.1

AVAILABLE_PLATFORMS: list[str] = TOGGLEABLE_PLATFORMS
DEFAULT_PLATFORMS: list[str] = [climate.DOMAIN, Platform.LIGHT]

SELECT_OPTION_UP = ">>PLUS<<"
SELECT_OPTION_DOWN = ">>MINUS<<"
SELECT_DEFAULT_OPTIONS = [
    "",
    SELECT_OPTION_UP,
    SELECT_OPTION_DOWN,
]

EVENT_SHORT_PRESS = "singleTap"
EVENT_LONG_PRESS = "longPress"

MDI_PREFIX = "mdi:"
MDI_DEFAULT = "mdi:help"

ATTR_POSITION = "position"
ATTR_UUID = "uuid"

COLOR_ON = "#ffc107"
COLOR_OFF = "#44739e"
COLOR_ACTIVE = "#fff"
COLOR_INACTIVE = "#6f6f6f"
COLOR_UNAVAILABLE = "#6f6f6f"
COLOR_MODIFIER = "#ffc107"
