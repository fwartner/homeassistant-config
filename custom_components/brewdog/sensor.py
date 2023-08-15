"""
A platform which allows you to get information about a random BreDog beer.
For more details about this component, please refer to the documentation at
https://github.com/custom-components/brewdog
"""
# pylint: disable=missing-docstring, unused-argument

from datetime import timedelta
from aiohttp import ClientSession

from homeassistant.components.sensor import SensorEntity
from homeassistant.helpers.aiohttp_client import async_get_clientsession


SCAN_INTERVAL = timedelta(seconds=120)


async def async_setup_platform(hass, config, async_add_entities, discovery_info=None):
    async_add_entities([BrewDogSensor(async_get_clientsession(hass))], True)


class BrewDogSensor(SensorEntity):
    _attr_icon = "mdi:beer"
    _attr_name = "Random Brewdog"

    def __init__(self, clientsession: ClientSession):
        self._clientsession = clientsession

    async def async_update(self):
        resp = await self._clientsession.get(
            "https://api.punkapi.com/v2/beers/random",
            headers={"Accept": "application/json"},
        )

        rbd = (await resp.json())[0]

        self._attr_native_value = rbd["tagline"]
        self._attr_entity_picture = rbd["image_url"]
        self._attr_extra_state_attributes = {
            "first brewed": rbd["first_brewed"],
            "description": rbd["description"],
        }
