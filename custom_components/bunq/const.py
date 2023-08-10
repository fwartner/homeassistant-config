"""Constants for bunq integration."""
from __future__ import annotations

from datetime import timedelta
import logging
from typing import Final
from .models import BunqApiUrls, BunqApiEnvironment

DOMAIN: Final = "bunq"

UPDATE_INTERVAL = timedelta(seconds=55)

ENVIRONMENT_URLS = {
    BunqApiEnvironment.Sandbox: BunqApiUrls(
        authorize_url="https://oauth.sandbox.bunq.com/auth",
        token_url="https://api-oauth.sandbox.bunq.com/v1/token",
        api_url="https://public-api.sandbox.bunq.com",
    ),
    BunqApiEnvironment.Production: BunqApiUrls(
        authorize_url="https://oauth.bunq.com/auth",
        token_url="https://api.oauth.bunq.com/v1/token",
        api_url="https://api.bunq.com",
    ),
}

LOGGER = logging.getLogger(__package__)

ENVIRONMENT =  BunqApiEnvironment.Production
