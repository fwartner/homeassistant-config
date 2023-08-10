"""BlueprintEntity class"""
from homeassistant.helpers.update_coordinator import CoordinatorEntity
from homeassistant.util import slugify

from .const import DOMAIN, NAME, VERSION, ATTRIBUTION


class NpmSwitchesEntity(CoordinatorEntity):
    """Init NPM user device."""

    def __init__(self, coordinator, config_entry):
        super().__init__(coordinator)
        self.config_entry = config_entry
        self.proxy_id = None
        self.friendly_name = None
        self.coordinator = coordinator

    @property
    def unique_id(self):
        """Return a unique ID to use for this entity."""
        return slugify(f"{self.config_entry.entry_id} {self.friendly_name}")

    @property
    def device_info(self):
        return {
            "identifiers": {(DOMAIN, self.config_entry.entry_id)},
            "name": NAME,
            "model": VERSION,
            "manufacturer": NAME,
        }

    @property
    def extra_state_attributes(self):
        """Return the state attributes."""
        return {
            "attribution": ATTRIBUTION,
            "id": str(self.coordinator.data.get("id")),
            "integration": DOMAIN,
        }

    @property
    def name(self):
        """Return the name of the switch."""
        return self.friendly_name
