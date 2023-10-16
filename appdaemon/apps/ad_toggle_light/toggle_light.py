import appdaemon.plugins.hass.hassapi as hass
import voluptuous as vol


MODULE = 'toggle_light'
CLASS = 'ToggleLight'

CONF_MODULE = 'module'
CONF_CLASS = 'class'
CONF_ENTITIES = 'entities'
CONF_ENTITY = 'entity'
CONF_SERVICE_DATA = 'service_data'
CONF_SUNDOWN = 'sundown'
CONF_LOG_LEVEL = 'log_level'
CONF_TURN_ON = 'turn_on'
CONF_TURN_OFF = 'turn_off'

LOG_ERROR = 'ERROR'
LOG_DEBUG = 'DEBUG'
LOG_INFO = 'INFO'

STATE_ON = 'on'
STATE_OFF = 'off'

ENTITIES_SCHEMA = vol.Any(
        str,
        { 
            vol.Required(CONF_ENTITY): str,
            vol.Optional(CONF_SERVICE_DATA): dict,
        })

APP_SCHEMA = vol.Schema({
    vol.Required(CONF_MODULE): str,
    vol.Required(CONF_CLASS): str,
    vol.Required(CONF_ENTITY): str,
    vol.Optional(CONF_ENTITIES): [ ENTITIES_SCHEMA ],
    vol.Optional(CONF_SUNDOWN, default=False): bool,
    vol.Optional(CONF_TURN_ON, default=True): bool,
    vol.Optional(CONF_TURN_OFF, default=True): bool,
    vol.Optional(CONF_LOG_LEVEL, default=LOG_DEBUG): vol.Any(LOG_INFO, LOG_DEBUG),
})

class ToggleLight(hass.Hass):
    def initialize(self):
        args = APP_SCHEMA(self.args)

        # Set Lazy Logging (to not have to restart appdaemon)
        self._level = args.get(CONF_LOG_LEVEL)
        self.log(args, level=self._level)

        self.entity = args.get(CONF_ENTITY)

        self._entities = [ AppEntity(e) for e in args.get(CONF_ENTITIES) ]
        
        self.use_sun = args.get(CONF_SUNDOWN)

        self._enable_on = args.get(CONF_TURN_ON)
        self._enable_off = args.get(CONF_TURN_OFF)

        self.handle = self.listen_state(self.toggle_entity, entity = self.entity)
        self.log(f"Created handle '{self.handle}'", level=self._level)

    def toggle_entity(self, entity, attribute, old, new, kwargs):
        self.log(f"'toggle_entity' callback states.{entity}.{attribute} {old} {new}", level=self._level)
        # leave the lists for future expansion
        sun = not self.use_sun or (self.use_sun and self.sun_down())

        if new in [STATE_ON] and self._enable_on and sun:
            for ae in self._entities:
                entity_id, attributes = ae.entity_id, ae.attributes
                log_attributes = f' - {attributes}' if attributes else ''
                self.log(f"{STATE_ON} - {entity_id}{log_attributes}", level = self._level)
                if attributes:
                    self.turn_on(entity_id, **attributes)
                else:
                    self.turn_on(entity_id)

        elif new in [STATE_OFF] and self._enable_off and sun:
            for ae in self._entities:
                self.log(f"{STATE_OFF} - {ae.entity_id}", level = self._level)
                if self.get_state(ae.entity_id) not in [STATE_OFF]:
                    self.turn_off(ae.entity_id)

    def terminate(self):
        self.log(f"Canceling handle '{self.handle}'", level=self._level)
        self.cancel_listen_event(self.handle)

class AppEntity(object):
    def __init__(self, conf):
        self.attributes = {}
        if isinstance(conf, dict):
            self.entity_id = conf.get(CONF_ENTITY)
            self.attributes = conf.get(CONF_SERVICE_DATA, {})
        elif isinstance(conf, str):
            self.entity_id = conf
