"""Errors for the Plex component."""
from homeassistant.exceptions import HomeAssistantError


class RyanairError(HomeAssistantError):
    """Base error."""


class InvalidAuth(RyanairError):
    """Raised when invalid authentication credentials are provided."""


class APIRatelimitExceeded(RyanairError):
    """Raised when the API rate limit is exceeded."""


class UnknownError(RyanairError):
    """Raised when an unknown error occurs."""


class CannotConnect(HomeAssistantError):
    """Error to indicate we cannot connect."""


class InvalidAuth(HomeAssistantError):
    """Error to indicate there is invalid auth."""
