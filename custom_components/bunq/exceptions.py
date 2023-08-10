"""Exceptions for the Bunq API."""

class BunqApiError(Exception):
    """Generic BunqApi exception."""


class BunqApiConnectionError(BunqApiError):
    """BunqApi connection exception."""


class BunqApiConnectionTimeoutError(BunqApiConnectionError):
    """BunqApi connection timeout exception."""


class BunqApiRateLimitError(BunqApiConnectionError):
    """BunqApi Rate Limit exception."""