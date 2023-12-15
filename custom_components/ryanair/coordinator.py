"""Ryanair Coordinator."""
from datetime import timedelta
import logging
from homeassistant.const import CONF_EMAIL, CONF_PASSWORD, CONTENT_TYPE_JSON
from homeassistant.core import HomeAssistant
from homeassistant.helpers.update_coordinator import (
    DataUpdateCoordinator,
    UpdateFailed,
)
import re
from aztec_code_generator import AztecCode
from .const import (
    HOST,
    USER_PROFILE,
    ORDERS,
    V,
    CUSTOMERS,
    ACCOUNTS,
    ACCOUNT_LOGIN,
    CONF_DEVICE_FINGERPRINT,
    CONF_POLICY_AGREED,
    MFA_CODE,
    ACCOUNT_VERIFICATION,
    DEVICE_VERIFICATION,
    MFA_TOKEN,
    CONF_AUTH_TOKEN,
    PROFILE,
    CUSTOMER_ID,
    TOKEN,
    REMEMBER_ME_TOKEN,
    DETAILS,
    PERSISTENCE,
    REMEMBER_ME,
    X_REMEMBER_ME_TOKEN,
    ACCESS_DENIED,
    CAUSE,
    NOT_AUTHENTICATED,
    CLIENT_ERROR,
    TYPE,
    BOARDING_PASS_URL,
    BOARDING_PASSES_URI,
    BOOKING_REFERENCE,
    BOARDING_PASS_HEADERS,
    EMAIL,
    RECORD_LOCATOR,
    BOOKING_DETAILS_URL,
    AUTH_TOKEN,
    BOOKING_INFO,
    BOOKING_ID,
    SURROGATE_ID,
    CLIENT_VERSION,
    CLIENT
)
from .errors import RyanairError, InvalidAuth, APIRatelimitExceeded, UnknownError
from homeassistant.exceptions import ConfigEntryAuthFailed
from homeassistant.util.json import load_json_object
from homeassistant.helpers.json import save_json
from pathlib import Path
_LOGGER = logging.getLogger(__name__)

USER_PROFILE_URL = HOST + USER_PROFILE + V
ORDERS_URL = HOST + ORDERS + V
BOARDING_PASS_PERSISTENCE = Path(__file__).parent / BOARDING_PASS_HEADERS
CREDENTIALS = Path(__file__).parent / PERSISTENCE


async def rememberMeToken(self, userData):

    rememberMeTokenResp = await self.session.request(
        method="GET",
        url=USER_PROFILE_URL
        + ACCOUNTS
        + "/"
        + userData[CUSTOMER_ID]
        + "/"
        + REMEMBER_ME_TOKEN,
        headers={
            CONF_DEVICE_FINGERPRINT: userData[CONF_DEVICE_FINGERPRINT],
            CONF_AUTH_TOKEN: userData[TOKEN],
        },
    )
    rememberMeTokenResponse = await rememberMeTokenResp.json()

    users = load_json_object(CREDENTIALS)

    if rememberMeTokenResponse is not None and ((ACCESS_DENIED in rememberMeTokenResponse and rememberMeTokenResponse[CAUSE] == NOT_AUTHENTICATED) or (
        TYPE in rememberMeTokenResponse and rememberMeTokenResponse[TYPE] == CLIENT_ERROR
    )):
        authResponse = await authenticateUser(self, userData)

        users[userData[CONF_DEVICE_FINGERPRINT]
              ][TOKEN] = authResponse[TOKEN]
        users[userData[CONF_DEVICE_FINGERPRINT]
              ][CUSTOMER_ID] = authResponse[CUSTOMER_ID]
    else:
        users[userData[CONF_DEVICE_FINGERPRINT]
              ][X_REMEMBER_ME_TOKEN] = rememberMeTokenResponse[TOKEN]

    save_json(CREDENTIALS, users)

    return load_json_object(CREDENTIALS)


async def refreshToken(self, userData):
    rememberMeResp = await self.session.request(
        method="GET",
        url=USER_PROFILE_URL + ACCOUNTS + "/" + REMEMBER_ME,
        headers={
            CONF_DEVICE_FINGERPRINT: userData[CONF_DEVICE_FINGERPRINT],
            X_REMEMBER_ME_TOKEN: userData[X_REMEMBER_ME_TOKEN],
        },
    )
    rememberMeResponse = await rememberMeResp.json()

    users = await rememberMeToken(self, userData)

    users[userData[CONF_DEVICE_FINGERPRINT]][TOKEN] = rememberMeResponse[TOKEN]

    save_json(CREDENTIALS, users)

    return load_json_object(CREDENTIALS)


async def getFlights(self, data):
    resp = await self.session.request(
        method="GET",
        url=ORDERS_URL + ORDERS + data[CUSTOMER_ID] + "/" + DETAILS,
        headers={
            "Content-Type": CONTENT_TYPE_JSON,
            CONF_DEVICE_FINGERPRINT: data[CONF_DEVICE_FINGERPRINT],
            CONF_AUTH_TOKEN: data[TOKEN],
        },
    )
    body = await resp.json()
    return body


async def getUserProfile(self, data):
    resp = await self.session.request(
        method="GET",
        url=USER_PROFILE_URL + CUSTOMERS + "/" +
        data[CUSTOMER_ID] + "/" + PROFILE,
        headers={
            "Content-Type": CONTENT_TYPE_JSON,
            CONF_DEVICE_FINGERPRINT: data[CONF_DEVICE_FINGERPRINT],
            CONF_AUTH_TOKEN: data[TOKEN],
        },
    )
    body = await resp.json()
    return body


async def getBoardingPasses(self, data, headers):
    resp = await self.session.request(
        method="POST",
        url=BOARDING_PASS_URL,
        headers={
            "Content-Type": CONTENT_TYPE_JSON,
            CONF_DEVICE_FINGERPRINT: data[CONF_DEVICE_FINGERPRINT],
            CONF_AUTH_TOKEN: data[TOKEN],
        },
        json={
            EMAIL: headers[EMAIL],
            RECORD_LOCATOR: headers[RECORD_LOCATOR]
        }
    )
    body = await resp.json()
    return body


async def getBookingDetails(self, data, bookingInfo):
    resp = await self.session.request(
        method="POST",
        url=BOOKING_DETAILS_URL,
        headers={
            CLIENT_VERSION: "9.9.9",
            "Content-Type": CONTENT_TYPE_JSON,
            CONF_DEVICE_FINGERPRINT: data[CONF_DEVICE_FINGERPRINT],
            CONF_AUTH_TOKEN: data[TOKEN],
        },
        json={
            AUTH_TOKEN: data[TOKEN],
            BOOKING_INFO: bookingInfo
        }
    )
    body = await resp.json()
    return body


async def authenticateUser(self, userData):
    resp = await self.session.request(
        method="POST",
        url=USER_PROFILE_URL + ACCOUNT_LOGIN,
        headers={
            "Content-Type": CONTENT_TYPE_JSON,
            CONF_DEVICE_FINGERPRINT: userData[CONF_DEVICE_FINGERPRINT],
        },
        json={
            CONF_EMAIL: userData[CONF_EMAIL],
            CONF_PASSWORD: userData[CONF_PASSWORD],
            CONF_POLICY_AGREED: "true",
        },
    )
    body = await resp.json()
    return body


class RyanairBookingDetailsCoordinator(DataUpdateCoordinator):
    """Booking Details Coordinator"""

    def __init__(self, hass: HomeAssistant, session, deviceFingerprint, bookingInfo) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(minutes=5),
        )
        self.hass = hass
        self.session = session
        self.bookingInfo = bookingInfo
        self.fingerprint = deviceFingerprint

    async def _async_update_data(self):
        """Fetch data from API endpoint."""
        try:
            data = load_json_object(CREDENTIALS)
            userData = data[self.fingerprint]
            if X_REMEMBER_ME_TOKEN not in userData:
                userData = await rememberMeToken(self, userData)
                userData = userData[self.fingerprint]

            body = await getBookingDetails(self, userData, self.bookingInfo)

            if (ACCESS_DENIED in body and body[CAUSE] == NOT_AUTHENTICATED) or (
                TYPE in body and body[TYPE] == CLIENT_ERROR
            ):
                userData = await refreshToken(self, userData)

                body = await getBookingDetails(self, userData[self.fingerprint], self.bookingInfo)

        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body


class RyanairBoardingPassCoordinator(DataUpdateCoordinator):
    """Boarding Pass Coordinator"""

    def __init__(self, hass: HomeAssistant, session, data) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(5),
        )
        self.session = session
        self.email = data[EMAIL]
        self.fingerprint = data[CONF_DEVICE_FINGERPRINT]

    async def _async_update_data(self):
        """Fetch data from API endpoint."""
        try:
            boardingPassData = load_json_object(BOARDING_PASS_PERSISTENCE)
            data = load_json_object(CREDENTIALS)

            if self.fingerprint in boardingPassData:
                bookingReferences = boardingPassData[self.fingerprint]

            if len(bookingReferences) > 0:
                for bookingRef in bookingReferences:
                    headers = {
                        EMAIL: self.email,
                        RECORD_LOCATOR: bookingRef[BOOKING_REFERENCE]
                    }

                    data = load_json_object(CREDENTIALS)
                    userData = data[self.fingerprint]
                    if X_REMEMBER_ME_TOKEN not in userData:
                        userData = await rememberMeToken(self, userData)
                        userData = userData[self.fingerprint]

                    body = await getBoardingPasses(self, userData, headers)

                    if body is not None and ((ACCESS_DENIED in body and body[CAUSE] == NOT_AUTHENTICATED) or (
                        TYPE in body and body[TYPE] == CLIENT_ERROR
                    )):
                        userData = await refreshToken(self, userData)

                        body = await getBoardingPasses(self, userData[self.fingerprint], headers)

                    if body is not None:
                        for boardingPass in body:
                            try: 
                                aztec_code = AztecCode(boardingPass['barcode'])

                                flightName = "(" + boardingPass["flight"]["label"] + ") " + \
                                    boardingPass["departure"]["name"] + \
                                    " - " + boardingPass["arrival"]["name"]

                                seat = boardingPass["seat"]["designator"]

                                passenger = boardingPass["name"]["first"] + \
                                    " " + boardingPass["name"]["last"]

                                name = passenger + ": " + \
                                    flightName + "(" + seat + ")"

                                fileName = re.sub(
                                    "[\W_]", "", name + boardingPass["departure"]["dateUTC"]) + ".png"

                                aztec_code.save(
                                    Path(__file__).parent / BOARDING_PASSES_URI / fileName, module_size=16)
                            except:
                                print("Unable to parse barcode")
            else:
                body = None

        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body


class RyanairFlightsCoordinator(DataUpdateCoordinator):
    """Flights Coordinator"""

    def __init__(self, hass: HomeAssistant, session, fingerprint) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(minutes=5),
        )
        self.hass = hass
        self.session = session
        self.fingerprint = fingerprint

    async def _async_update_data(self):
        """Fetch data from API endpoint."""
        try:
            data = load_json_object(CREDENTIALS)
            userData = data[self.fingerprint]
            if X_REMEMBER_ME_TOKEN not in userData:
                userData = await rememberMeToken(self, userData)
                userData = userData[self.fingerprint]

            body = await getFlights(self, userData)

            if (ACCESS_DENIED in body and body[CAUSE] == NOT_AUTHENTICATED) or (
                TYPE in body and body[TYPE] == CLIENT_ERROR
            ):
                userData = await refreshToken(self, userData)

                body = await getFlights(self, userData[self.fingerprint])

        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body


class RyanairProfileCoordinator(DataUpdateCoordinator):
    """User Profile Coordinator"""

    def __init__(self, hass: HomeAssistant, session, fingerprint) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(minutes=5),
        )

        self.session = session
        self.fingerprint = fingerprint

    async def _async_update_data(self):
        """Fetch data from API endpoint."""
        try:
            data = load_json_object(CREDENTIALS)
            userData = data[self.fingerprint]
            if X_REMEMBER_ME_TOKEN not in userData:
                userData = await rememberMeToken(self, userData)
                userData = userData[self.fingerprint]

            body = await getUserProfile(self, userData)

            if (ACCESS_DENIED in body and body[CAUSE] == NOT_AUTHENTICATED) or (
                TYPE in body and body[TYPE] == CLIENT_ERROR
            ):
                userData = await refreshToken(self, userData)

                body = await getUserProfile(self, userData[self.fingerprint])

        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body


class RyanairMfaCoordinator(DataUpdateCoordinator):
    """MFA coordinator."""

    def __init__(self, hass: HomeAssistant, session, data) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(5),
        )

        self.session = session
        self.mfaCode = data[MFA_CODE]
        self.mfaToken = data[MFA_TOKEN]
        self.fingerprint = data[CONF_DEVICE_FINGERPRINT]

    async def _async_update_data(self):
        """Fetch data from API endpoint."""
        try:
            resp = await self.session.request(
                method="PUT",
                url=USER_PROFILE_URL + ACCOUNT_VERIFICATION + "/" + DEVICE_VERIFICATION,
                headers={
                    "Content-Type": CONTENT_TYPE_JSON,
                    CONF_DEVICE_FINGERPRINT: self.fingerprint,
                },
                json={MFA_CODE: self.mfaCode, MFA_TOKEN: self.mfaToken},
            )
            body = await resp.json()
            # session expired
            # {'access-denied': True, 'message': 'Full authentication is required to access this resource.', 'cause': 'NOT AUTHENTICATED'}

        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body


class RyanairCoordinator(DataUpdateCoordinator):
    """Data coordinator."""

    def __init__(self, hass: HomeAssistant, session, userData) -> None:
        """Initialize coordinator."""

        super().__init__(
            hass,
            _LOGGER,
            # Name of the data. For logging purposes.
            name="Ryanair",
            # Polling interval. Will only be polled if there are subscribers.
            update_interval=timedelta(5),
        )

        self.session = session
        self.userData = userData

    async def _async_update_data(self):
        """Fetch data from API endpoint.

        This is the place to pre-process the data to lookup tables
        so entities can quickly look up their data.
        """
        try:
            body = await authenticateUser(self, self.userData)
        except InvalidAuth as err:
            raise ConfigEntryAuthFailed from err
        except RyanairError as err:
            raise UpdateFailed(str(err)) from err
        except ValueError as err:
            err_str = str(err)

            if "Invalid authentication credentials" in err_str:
                raise InvalidAuth from err
            if "API rate limit exceeded." in err_str:
                raise APIRatelimitExceeded from err

            _LOGGER.exception("Unexpected exception")
            raise UnknownError from err

        return body
