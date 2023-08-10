"""oAuth2 functions and classes for Bunq API integration."""
from __future__ import annotations

from typing import Any
import sys
from homeassistant.components.application_credentials import (
    AuthImplementation,
    AuthorizationServer,
    ClientCredential,
)
from homeassistant.core import HomeAssistant

from .const import ENVIRONMENT, ENVIRONMENT_URLS


class BunqOAuth2Implementation(AuthImplementation):
    """Local OAuth2 implementation for Bunq."""

    def __init__(
        self,
        hass: HomeAssistant,
        auth_domain: str,
        credential: ClientCredential,
    ) -> None:
        """Local Bunq Oauth Implementation."""
        super().__init__(
            hass=hass,
            auth_domain=auth_domain,
            credential=credential,
            authorization_server=AuthorizationServer(
                authorize_url=ENVIRONMENT_URLS[ENVIRONMENT]["authorize_url"],
                token_url=ENVIRONMENT_URLS[ENVIRONMENT]["token_url"],
            ),
        )

    @property
    def extra_authorize_data(self) -> dict:
        """Extra data that needs to be appended to the authorize url."""
        return {"response_type": "code"}

    async def async_resolve_external_data(self, external_data: Any) -> dict:
        """Initialize local Bunq API auth implementation."""
        redirect_uri = external_data["state"]["redirect_uri"]
        self.token_url = f"{ENVIRONMENT_URLS[ENVIRONMENT]['token_url']}?grant_type=authorization_code&client_id={self.client_id}&client_secret={self.client_secret}&code={external_data['code']}&redirect_uri={redirect_uri}"
        token = await self._token_request({})
        # Store the redirect_uri (Needed for refreshing token, but not according to oAuth2 spec!)
        token["redirect_uri"] = redirect_uri
        token["expires_in"] = sys.maxsize
        return token

    async def _async_refresh_token(self, token: dict) -> dict:
        """ Bunq does not provide a way to refresh the token."""
        return {**token, **token}
