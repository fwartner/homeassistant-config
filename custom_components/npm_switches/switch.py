"""Switch platform for integration_blueprint."""
import logging
from homeassistant.components.switch import SwitchEntity

# from homeassistant.core import HomeAssistant
from homeassistant.config_entries import ConfigEntry

from .const import DOMAIN
from .entity import NpmSwitchesEntity
from . import NpmSwitchesUpdateCoordinator

_LOGGER = logging.getLogger(__name__)


async def async_setup_entry(hass, entry, async_add_entities):
    """Setup sensor platform."""
    coordinator = hass.data[DOMAIN][entry.entry_id]
    api = hass.data[DOMAIN][entry.entry_id].api
    proxy_hosts = await api.get_proxy_hosts()
    print(proxy_hosts)
    entities = []

    for proxy in proxy_hosts.values():
        # print(vars(proxy))
        entities.append(NpmSwitchesBinarySwitch(coordinator, entry, proxy))

    async_add_entities(entities, True)
    # async_add_devices([NpmSwitchesBinarySwitch(coordinator, entry, "20")])


class NpmSwitchesBinarySwitch(NpmSwitchesEntity, SwitchEntity):
    """integration_blueprint switch class."""

    def __init__(
        self,
        coordinator: NpmSwitchesUpdateCoordinator,
        entry: ConfigEntry,
        proxy: dict,
    ) -> None:
        """Initialize proxy switch entity."""
        super().__init__(coordinator, entry)
        self.proxy = proxy
        self.proxy_id = str(proxy["id"])
        self._attr_icon = "mdi:steering"
        self.friendly_name = (
            "NPM " + self.proxy["domain_names"][0].replace(".", " ").capitalize()
        )
        # print(self.friendly_name)

    async def async_turn_on(self, **kwargs):  # pylint: disable=unused-argument
        """Turn on the switch."""
        await self.coordinator.api.enable_proxy(self.proxy_id)
        self.async_write_ha_state()
        self.proxy = await self.coordinator.api.get_proxy(self.proxy_id)

    async def async_turn_off(self, **kwargs):  # pylint: disable=unused-argument
        """Turn off the switch."""
        await self.coordinator.api.disable_proxy(self.proxy_id)
        self.async_write_ha_state()
        self.proxy = await self.coordinator.api.get_proxy(self.proxy_id)

    # @property
    # def name(self):
    #     """Return the name of the switch."""
    #     return "NPM " + self.proxy["domain_names"][0].replace(".", " ").capitalize()

    @property
    def icon(self):
        """Return the icon of this switch."""
        if self.coordinator.api.is_proxy_enabled(self.proxy_id):
            return "mdi:check-network"
        return "mdi:close-network"
        # return self._attr_icon

    @property
    def is_on(self):
        """Return true if the switch is on."""
        return self.coordinator.api.is_proxy_enabled(self.proxy_id)

    @property
    def extra_state_attributes(self):
        """Return device state attributes."""
        return {
            "id": self.proxy["id"],
            "domain_names": self.proxy["domain_names"],
        }
