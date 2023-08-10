import logging
import voluptuous as vol
from twitchAPI.twitch import Twitch, AuthScope
from twitchAPI.helper import first
from datetime import timedelta

from homeassistant.components.sensor import PLATFORM_SCHEMA, SensorEntity, ENTITY_ID_FORMAT
import homeassistant.helpers.config_validation as cv

_LOGGER = logging.getLogger(__name__)

ATTR_GAME = "game"
ATTR_TITLE = "title"
ATTR_SUBSCRIPTION = "subscribed"
ATTR_SUBSCRIPTION_GIFTED = "subscription_is_gifted"
ATTR_SUBSCRIPTION_TIER = "subscription_tier"
ATTR_VIEWS = "viewers"
ATTR_THUMBNAIL = "thumbnail_url"
ATTR_STARTED_AT = "started_at"

CONF_CLIENT_ID = "client_id"
CONF_CLIENT_SECRET = "client_secret"
CONF_OWN_CHANNEL = "own_channel"
CONF_CHANNELS = "channels"
CONF_THUMBNAIL_DIMENSIONS = "thumbnail_dimensions"
CONF_API_OPT_OUTS = "api_opt_outs"
CONF_ENTITY_PREFIX = "entity_prefix"

ICON = "mdi:twitch"

STATE_OFFLINE = "offline"
STATE_STREAMING = "streaming"

OPT_OUT_SUBSCRIPTION_USER = "subscription_user"
OPT_OUT_STREAM = "stream"

SCAN_INTERVAL = timedelta(seconds=120)

PLATFORM_SCHEMA = PLATFORM_SCHEMA.extend(
    {
        vol.Required(CONF_CLIENT_ID): cv.string,
        vol.Required(CONF_CLIENT_SECRET): cv.string,
        vol.Required(CONF_OWN_CHANNEL): cv.string,
        vol.Required(CONF_CHANNELS): vol.All(cv.ensure_list, [cv.string]),
        vol.Optional(CONF_THUMBNAIL_DIMENSIONS) : cv.string,
        vol.Optional(CONF_API_OPT_OUTS) : vol.All(cv.ensure_list, [cv.string]),
        vol.Optional(CONF_ENTITY_PREFIX) : cv.string
    }
)

async def async_setup_platform(hass, config, async_add_entities, discovery_info=None):
    client_id = config[CONF_CLIENT_ID]
    client_secret = config[CONF_CLIENT_SECRET]
    own_channel = config[CONF_OWN_CHANNEL]
    channels = config[CONF_CHANNELS]
    thumbnail_dimensions = config.get(CONF_THUMBNAIL_DIMENSIONS, None)
    api_opt_outs = config.get(CONF_API_OPT_OUTS, [])
    entity_prefix = config.get(CONF_ENTITY_PREFIX, "")
        
    scopes = [
        AuthScope.USER_READ_EMAIL,
        AuthScope.USER_READ_SUBSCRIPTIONS,
    ]

    try:
        client = await Twitch(client_id, client_secret, target_app_auth_scope=scopes)
        user = await first(client.get_users(logins=[own_channel]))
    except Exception as ex:
        _LOGGER.error("Error during initial setup of Twitch API client: {}".format(ex))
        return

    twitch_sensors = [TwitchSensor(user.id, channel, client, thumbnail_dimensions, api_opt_outs, entity_prefix) for channel in channels]
    async_add_entities(twitch_sensors, True)

class TwitchSensor(SensorEntity):
    def __init__(self, user_id, channel, client, thumbnail_dimensions, api_opt_outs, entity_prefix):
        self.entity_id = ENTITY_ID_FORMAT.format(entity_prefix + channel)
        self._client = client
        self._user_id = user_id
        self._channel = channel
        self._channel_id = None
        self._state = None
        self._preview = None
        self._game = None
        self._title = None
        self._subscription = None
        self._name = None
        self._viewers = None
        self._started_at = None
        self._thumbnail_url = None
        self._thumbnail_dimensions = thumbnail_dimensions
        self._api_opt_outs = api_opt_outs

    @property
    def name(self):
        """Return the name of the sensor."""
        return self._name

    @property
    def native_value(self):
        """Return the state of the sensor."""
        return self._state

    @property
    def entity_picture(self):
        """Return preview of current game."""
        return self._preview

    @property
    def extra_state_attributes(self):
        """Return the state attributes."""
        attr = dict()
        
        if (self._subscription):
            attr.update(self._subscription)

        if self._state == STATE_STREAMING:
            attr.update({
                ATTR_GAME: self._game,
                ATTR_TITLE: self._title,
                ATTR_VIEWS: self._viewers,
                ATTR_THUMBNAIL: self._thumbnail_url,
                ATTR_STARTED_AT: self._started_at
            })

        return attr

    @property
    def unique_id(self):
        """Return unique ID for this sensor."""
        return self._channel

    @property
    def icon(self):
        """Icon to use in the frontend, if any."""
        return ICON

    async def async_update(self):
        """Update device state."""
        
        # Broadcast user
        try:
            broadcast_user = await first(self._client.get_users(logins=[self._channel]))
            
            self._channel_id = broadcast_user.id
            self._preview = broadcast_user.profile_image_url
            self._name = broadcast_user.display_name
        except:
            _LOGGER.warning("Failed to retrieve broadcast user from Twitch API: " + self._channel)
            return

        # Stream
        if (OPT_OUT_STREAM not in self._api_opt_outs):
            try:
                stream = await first(self._client.get_streams(user_id=[self._channel_id]))

                if not stream:
                    self._state = STATE_OFFLINE
                else:
                    self._game = stream.game_name
                    self._title = stream.title
                    self._viewers = stream.viewer_count
                    self._started_at = stream.started_at
                    self._state = STATE_STREAMING
                    self._thumbnail_url = stream.thumbnail_url

                    if (self._thumbnail_dimensions is not None):
                        self._thumbnail_url = self._thumbnail_url.replace("{width}x{height}", self._thumbnail_dimensions)
            except:
                self._state = STATE_OFFLINE

        # Subscription
        if (OPT_OUT_SUBSCRIPTION_USER not in self._api_opt_outs):
            try:
                subscription = await self._client.check_user_subscription(broadcaster_id=self._channel_id, user_id=self._user_id)
                
                if subscription:
                    self._subscription = {
                        ATTR_SUBSCRIPTION: True,
                        ATTR_SUBSCRIPTION_GIFTED: subscription.is_gift,
                        ATTR_SUBSCRIPTION_TIER: subscription.tier
                    }
            except:
                self._subscription = {
                    ATTR_SUBSCRIPTION: False, 
                    ATTR_SUBSCRIPTION_GIFTED: False
                }
