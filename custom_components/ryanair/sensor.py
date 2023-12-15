"""Ryanair sensor platform."""
from datetime import timedelta
import logging
from aiohttp import ClientError
from homeassistant.core import HomeAssistant, callback
from typing import Any
from homeassistant.helpers.typing import ConfigType, DiscoveryInfoType
from .const import (
    DOMAIN,
    CUSTOMER_ID,
    ACCESS_DENIED,
    CAUSE,
    BOARDING_PASS_HEADERS,
    BOOKING_REFERENCES,
    BOOKING_REFERENCE,
    BOOKING_ID,
    EMAIL,
    TYPE,
    PRODUCT_ID,
    CONF_DEVICE_FINGERPRINT,
    PERSISTENCE
)
from homeassistant.helpers.entity_platform import AddEntitiesCallback
from homeassistant.helpers.entity import DeviceInfo
from homeassistant.helpers.aiohttp_client import async_get_clientsession
from homeassistant.util.json import load_json_object
from homeassistant.helpers.json import save_json
from homeassistant.config_entries import ConfigEntry

from homeassistant.components.sensor import (
    SensorEntity,
    SensorEntityDescription,
)
from homeassistant.helpers.update_coordinator import (
    CoordinatorEntity,
)
from pathlib import Path
from homeassistant.util import dt as dt_util
from datetime import datetime
from .coordinator import RyanairProfileCoordinator, RyanairFlightsCoordinator
from homeassistant.util.json import JsonObjectType
_LOGGER = logging.getLogger(__name__)
# Time between updating data from GitHub
SCAN_INTERVAL = timedelta(minutes=5)
BOARDING_PASS_PERSISTENCE = Path(__file__).parent / BOARDING_PASS_HEADERS
CREDENTIALS = Path(__file__).parent / PERSISTENCE


def deviceInfo(name) -> DeviceInfo:
    return DeviceInfo(
        identifiers={(DOMAIN, f"Ryanair_{name}")},
        manufacturer="Jamie Nandhra-Pezone",
        model="Ryanair",
        name=name,
        configuration_url="https://github.com/jampez77/Ryanair/",
    )


def getProfileName(coordinator) -> str:
    name = coordinator.data["email"]

    if "firstName" in coordinator.data:
        name = coordinator.data["firstName"]
        if "lastName" in coordinator.data:
            name = name + " " + coordinator.data["lastName"]
    return name


async def async_setup_entry(
    hass: HomeAssistant,
    entry: ConfigEntry,
    async_add_entities: AddEntitiesCallback,
) -> None:
    """Setup sensors from a config entry created in the integrations UI."""

    config = hass.data[DOMAIN][entry.entry_id]
    # Update our config to include new repos and remove those that have been removed.
    await async_setup_platform(hass, config, async_add_entities)


async def async_setup_platform(
    hass: HomeAssistant,
    config: ConfigType,
    async_add_entities: AddEntitiesCallback,
    _: DiscoveryInfoType | None = None,
) -> None:
    """Set up the sensor platform."""
    session = async_get_clientsession(hass)

    data = load_json_object(CREDENTIALS)

    profileCoordinator = RyanairProfileCoordinator(
        hass, session, config[CONF_DEVICE_FINGERPRINT])

    await profileCoordinator.async_config_entry_first_refresh()

    name = config[CUSTOMER_ID]

    profileDescription = SensorEntityDescription(
        key=f"Ryanair_{name}",
        name="User Profile",
    )

    flightsCoordinator = RyanairFlightsCoordinator(
        hass, session, config[CONF_DEVICE_FINGERPRINT])

    await flightsCoordinator.async_config_entry_first_refresh()

    name = config[CUSTOMER_ID]

    sensors = []

    if (ACCESS_DENIED not in profileCoordinator.data and CAUSE not in profileCoordinator.data and TYPE not in profileCoordinator.data):
        sensors.append(RyanairProfileSensor(
            profileCoordinator, name, profileDescription))

    upcomingFlights = 0
    if "items" in flightsCoordinator.data and len(flightsCoordinator.data["items"]) > 0:

        bookingReferences = load_json_object(BOARDING_PASS_PERSISTENCE)
        userBookings = []
        for item in flightsCoordinator.data["items"]:

            flights = item["rawBooking"]["flights"]
            bookingRef = item["rawBooking"]["recordLocator"]
            seats = item["rawBooking"]["seats"]
            passengers = item["rawBooking"]["passengers"]

            userBookings.append({
                BOOKING_ID: item[PRODUCT_ID],
                BOOKING_REFERENCE: bookingRef,
            })

            itinerary = {
                "status": item["rawBooking"]["status"],
                "bookingRef": bookingRef,
                "journeys": []
            }
            for flight in flights:

                journey = {
                    "checkInOpen": flight["checkInOpenUTC"],
                    "checkInClose": flight["checkInCloseUTC"],
                    "checkInComplete": False,
                    "flights": []
                }

                segments = flight["segments"]

                for segment in segments:
                    segmentInfo = {
                        "destination": segment["destination"],
                        "origin": segment["origin"],
                        "flightNumber": segment["flightNumber"],
                        "isCancelled": segment["isCancelled"],
                        "arrive": segment["times"]["arriveUTC"],
                        "depart": segment["times"]["departUTC"],
                        "checkInComplete": False,
                        "passengers": []
                    }
                    segmentPassengers = []
                    checkedInPassengers = []
                    for seat in seats:
                        if seat["journeyNum"] == flight["journeyNum"] and seat["segmentNum"] == segment["segmentNum"]:
                            for passenger in passengers:
                                if seat["paxNum"] == passenger["paxNum"]:
                                    passengerInfo = {
                                        "seat": seat["code"],
                                        "title": passenger["title"],
                                        "firstName": passenger["firstName"],
                                        "middleName": passenger["middleName"],
                                        "lastName": passenger["lastName"],
                                        "checkedIn": False
                                    }
                                    if "checkins" in item["rawBooking"] and len(item["rawBooking"]["checkins"]) > 0:
                                        for checkin in item["rawBooking"]["checkins"]:
                                            if checkin["journeyNum"] == flight["journeyNum"] and checkin["paxNum"] == passenger["paxNum"] and checkin["status"] == "checkin":
                                                checkedInPassengers.append(
                                                    checkin)
                                                passengerInfo["checkedIn"] = True
                                    segmentPassengers.append(passengerInfo)

                                if len(checkedInPassengers) == len(segmentPassengers):
                                    segmentInfo["checkInComplete"] = True

                            if len(checkedInPassengers) == len(passengers):
                                journey["checkInComplete"] = True

                    segmentInfo["passengers"] = segmentPassengers
                    journey["flights"].insert(
                        segment["segmentNum"], segmentInfo)

                itinerary["journeys"].insert(flight["journeyNum"], journey)

                for journey in itinerary["journeys"]:

                    checkInInfo = {
                        "checkInOpen": journey["checkInOpen"],
                        "checkInClose": journey["checkInClose"],
                    }

                    for flight in journey["flights"]:

                        now_utc = dt_util.utcnow().timestamp()

                        departUTC = datetime.strptime(
                            flight["depart"], "%Y-%m-%dT%H:%M:%SZ").timestamp()

                        if now_utc < departUTC:
                            upcomingFlights = upcomingFlights + 1

                        flightDescription = SensorEntityDescription(
                            key=f"Ryanair_flight{name}",
                            name=name,
                        )

                        sensors.append(RyanairFlightSensor(
                            flightsCoordinator, bookingRef, checkInInfo, flight, flightDescription))

        bookingReferences[config[CONF_DEVICE_FINGERPRINT]] = userBookings
        save_json(BOARDING_PASS_PERSISTENCE, bookingReferences)

    flightCountDescription = SensorEntityDescription(
        key=f"Ryanair_flight-count{name}",
        name="Upcoming Flights",
    )

    name = getProfileName(profileCoordinator)
    sensors.append(RyanairFlightCountSensor(
        upcomingFlights, name, flightCountDescription))

    async_add_entities(sensors, update_before_add=True)


class RyanairFlightCountSensor(SensorEntity):
    """Ryanair Check In Sensor"""

    def __init__(
        self,
        upcomingFlights: int,
        name: str,
        description: SensorEntityDescription,
    ) -> None:
        """Initialize."""
        self._name = "Upcoming Flights"
        self._attr_device_info = self._attr_device_info = deviceInfo(name)
        self._attr_unique_id = f"Ryanair_flight-count-{name}-{description.key}".lower(
        )
        self._attrs: dict[str, Any] = {}
        self.entity_description = description
        self._state = upcomingFlights
        self._available = True

    @property
    def name(self) -> str:
        """Return the name of the entity."""
        return self._name

    @property
    def unique_id(self) -> str:
        """Return the unique ID of the sensor."""
        return self._attr_unique_id

    @property
    def available(self) -> bool:
        """Return True if entity is available."""
        return self._available

    @property
    def native_value(self) -> str:
        return self._state

    @property
    def icon(self) -> str:
        """Return a representative icon."""
        return "mdi:airplane-clock"

    async def async_update(self) -> None:
        """Update the entity.

        Only used by the generic entity update service.
        """

        try:
            self._available = True
        except ClientError:
            self._available = False
            _LOGGER.exception(
                "Error retrieving data from Ryanair for sensor %s", self.name
            )


class RyanairFlightSensor(CoordinatorEntity[RyanairFlightsCoordinator], SensorEntity):
    """Ryanair Check In Sensor"""

    def __init__(
        self,
        coordinator: RyanairFlightsCoordinator,
        bookingRef: str,
        checkInInfo: JsonObjectType,
        flight: JsonObjectType,
        description: SensorEntityDescription,
    ) -> None:
        """Initialize."""
        super().__init__(coordinator)
        self.flight = flight

        name = self.flight["flightNumber"] + \
            " (" + self.flight["origin"] + " - " + \
            self.flight["destination"] + ")"
        self.bookingRef = bookingRef
        self.checkInInfo = checkInInfo
        self.checkInComplete = self.flight["checkInComplete"]
        self._attr_device_info = deviceInfo(
            self.bookingRef + " " + self.flight["flightNumber"])
        self._attr_unique_id = f"Ryanair_flight-{self.flight['flightNumber']}-{self.bookingRef}-{name}-{description.key}".lower(
        )
        self._attrs: dict[str, Any] = {}
        self.entity_description = description
        self._state = None
        self._name = name
        self._available = True
        self.passengers = self.flight["passengers"]

    @property
    def name(self) -> str:
        """Return the name of the entity."""
        return self._name

    @property
    def unique_id(self) -> str:
        """Return the unique ID of the sensor."""
        return self._attr_unique_id

    @property
    def available(self) -> bool:
        """Return True if entity is available."""
        return self._available

    @property
    def native_value(self) -> str:
        return self._state

    @property
    def icon(self) -> str:
        """Return a representative icon."""
        return "mdi:airplane-takeoff"

    @property
    def extra_state_attributes(self) -> dict[str, Any]:

        attrs = {
            "flightNumber": self.flight["flightNumber"],
            "origin": self.flight["origin"],
            "destination": self.flight["destination"],
            "arrive": self.flight["arrive"],
            "depart": self.flight["depart"],
            "checkInOpen": self.checkInInfo["checkInOpen"],
            "checkInClose": self.checkInInfo["checkInClose"],
            "isCancelled": self.flight["isCancelled"],
            "passengers": self.passengers
        }

        self._attrs = attrs
        return self._attrs

    async def async_update(self) -> None:
        """Update the entity.

        Only used by the generic entity update service.
        """
        try:

            if self.checkInComplete == True:
                state = "Checked-in"
            else:

                now_utc = dt_util.utcnow().timestamp()

                checkInOpenUTC = 0

                if "checkInOpen" in self.flight:
                    checkInOpenUTC = datetime.strptime(
                    self.flight["checkInOpen"], "%Y-%m-%dT%H:%M:%SZ").timestamp()

                if "checkInOpen" in self.checkInInfo:
                    checkInOpenUTC = datetime.strptime(
                    self.checkInInfo["checkInOpen"], "%Y-%m-%dT%H:%M:%SZ").timestamp()

                checkInCloseUTC = 0

                if "checkInClose" in self.flight:
                    checkInCloseUTC = datetime.strptime(
                    self.flight["checkInClose"], "%Y-%m-%dT%H:%M:%SZ").timestamp()

                if "checkInClose" in self.checkInInfo:
                    checkInCloseUTC = datetime.strptime(
                    self.checkInInfo["checkInClose"], "%Y-%m-%dT%H:%M:%SZ").timestamp()


                if now_utc < checkInOpenUTC:
                    state = "Check-in not open"
                elif now_utc >= checkInOpenUTC and now_utc <= checkInCloseUTC:
                    state = "Check-in open"
                else:
                    state = "Check-in closed"

            self._state = state
            self._available = True
        except ClientError:
            self._available = False
            _LOGGER.exception(
                "Error retrieving data from Ryanair for sensor %s", self.name
            )


class RyanairProfileSensor(CoordinatorEntity[RyanairProfileCoordinator], SensorEntity):
    """Define an Ryanair sensor."""

    def __init__(
        self,
        coordinator: RyanairProfileCoordinator,
        name: str,
        description: SensorEntityDescription,
    ) -> None:
        """Initialize."""
        super().__init__(coordinator)

        name = getProfileName(coordinator)

        self._attr_device_info = deviceInfo(name)
        self._attr_unique_id = f"Ryanair_{name}-{description.key}".lower()
        self._attrs: dict[str, Any] = {}
        self.entity_description = description
        self._state = None
        self._name = name
        self._available = True

    @property
    def name(self) -> str:
        """Return the name of the entity."""
        return self._name

    @property
    def unique_id(self) -> str:
        """Return the unique ID of the sensor."""
        return self._attr_unique_id

    @property
    def available(self) -> bool:
        """Return True if entity is available."""
        return self._available

    @property
    def native_value(self) -> str:
        return self._state

    @property
    def icon(self) -> str:
        """Return a representative icon."""
        return "mdi:account"

    @property
    def entity_picture(self) -> str:
        """Return a representative icon."""
        if "googlePictureUrl" in self.coordinator.data:
            return self.coordinator.data["googlePictureUrl"]
        else:
            return self._attr_entity_picture

    @property
    def extra_state_attributes(self) -> dict[str, Any]:
        for key in self.coordinator.data:
            self._attrs[key] = self.coordinator.data[key]
        return self._attrs

    async def async_update(self) -> None:
        """Update the entity.

        Only used by the generic entity update service.
        """
        try:
            self._state = str(self.coordinator.data["email"])
            self._available = True
        except ClientError:
            self._available = False
            _LOGGER.exception(
                "Error retrieving data from Ryanair for sensor %s", self.name
            )
