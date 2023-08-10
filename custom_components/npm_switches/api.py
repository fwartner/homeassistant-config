"""Sample API Client."""
import logging
import asyncio
import socket

# from typing import Optional
# from datetime import datetime
import aiohttp
import async_timeout

from homeassistant.util import dt

TIMEOUT = 10


_LOGGER: logging.Logger = logging.getLogger(__package__)

HEADERS = {"Content-type": "application/json; charset=UTF-8"}


class NpmSwitchesApiClient:
    """Handle api calls to NPM instance."""

    def __init__(
        self, username: str, password: str, npm_url: str, session: aiohttp.ClientSession
    ) -> None:
        """NPM API Client."""
        self._username = username
        self._password = password
        self._session = session
        self._npm_url = npm_url
        self._token = None
        self._token_expires = dt.utcnow()
        self._headers = None
        self.proxy_hosts_data = None
        self.num_enabled = 0
        self.num_disabled = 0

    async def async_get_data(self) -> dict:
        """Get data from the API."""
        url = "http://test:81"
        return await self.api_wrapper("get", url)

    # async def async_set_title(self, value: str) -> None:
    #     """Get data from the API."""
    #     url = "https://jsonplaceholder.typicode.com/posts/1"
    #     await self.api_wrapper("patch", url, data={"title": value}, headers=HEADERS)

    async def get_proxy_hosts(self) -> list():
        """Get a list of proxy-hosts."""
        self.num_enabled = 0
        self.num_disabled = 0

        if self._token is None:
            await self.async_get_new_token()
        url = self._npm_url + "/api/nginx/proxy-hosts"
        proxy_hosts_list = await self.api_wrapper("get", url, headers=self._headers)
        self.proxy_hosts_data = {}
        for proxy in proxy_hosts_list:
            self.proxy_hosts_data[str(proxy["id"])] = proxy
            if proxy["enabled"] == 1:
                self.num_enabled += 1
            else:
                self.num_disabled += 1

        return self.proxy_hosts_data

    async def get_proxy(self, proxy_id: int) -> dict:
        """Get a proxy by id."""
        return self.proxy_hosts_data[proxy_id]

    async def async_get_new_token(self) -> None:
        """Get a new token."""
        url = self._npm_url + "/api/tokens"
        response = await self.api_wrapper(
            "token",
            url,
            data={
                "identity": self._username,
                "secret": self._password,
            },
        )

        self._token = response["token"]
        self._token_expires = dt.parse_datetime(response["expires"])
        self._headers = {
            "Authorization": "Bearer " + self._token,
        }

    async def async_check_token_expiration(self) -> None:
        """Check if token expired."""
        utcnow = dt.utcnow()

        if utcnow > self._token_expires:
            await self.async_get_new_token()

    async def enable_proxy(self, proxy_id: str) -> None:
        """Enable the passed proxy"""
        url = self._npm_url + "/api/nginx/proxy-hosts/" + proxy_id + "/enable"
        response = await self.api_wrapper("post", url, headers=self._headers)

        if response is True:
            self.proxy_hosts_data[proxy_id]["enabled"] = 1
        elif "error" in response.keys():
            _LOGGER.error(
                "Error enabling proxy id %s. Error message: '%s'",
                proxy_id,
                response["error"]["message"],
            )

    async def disable_proxy(self, proxy_id: str) -> None:
        """Disable the passed proxy"""
        url = self._npm_url + "/api/nginx/proxy-hosts/" + proxy_id + "/disable"

        response = await self.api_wrapper("post", url, headers=self._headers)
        if response is True:
            self.proxy_hosts_data[proxy_id]["enabled"] = 0
        elif "error" in response.keys():
            _LOGGER.error(
                "Error enabling proxy id %s. Error message: '%s'",
                proxy_id,
                response["error"]["message"],
            )

    def is_proxy_enabled(self, proxy_id: str) -> bool:
        """Return True if the proxy is enabled"""
        if self.proxy_hosts_data[proxy_id]["enabled"] == 1:
            return True
        return False

    @property
    def get_num_enabled(self) -> int:
        """Return the num enabled proxy hosts."""
        return self.num_enabled

    @property
    def get_num_disabled(self) -> int:
        """Return the num disabled proxy hosts."""
        return self.num_disabled

    @property
    def get_npm_url(self) -> str:
        """Return the npm url."""
        return self._npm_url

    async def api_wrapper(
        self, method: str, url: str, data: dict = None, headers: dict = None
    ) -> dict:
        """Get information from the API."""
        if method != "token":
            await self.async_check_token_expiration()

        try:
            async with async_timeout.timeout(TIMEOUT):
                if method == "get":
                    response = await self._session.get(url, headers=headers)
                    return await response.json()

                elif method == "put":
                    await self._session.put(url, headers=headers, json=data)

                elif method == "patch":
                    await self._session.patch(url, headers=headers, json=data)

                elif method == "post" or method == "token":
                    response = await self._session.post(url, headers=headers, json=data)
                    return await response.json()

        except asyncio.TimeoutError as exception:
            _LOGGER.error(
                "Timeout error fetching information from %s - %s",
                url,
                exception,
            )

        except (KeyError, TypeError) as exception:
            _LOGGER.error(
                "Error parsing information from %s - %s",
                url,
                exception,
            )
        except (aiohttp.ClientError, socket.gaierror) as exception:
            _LOGGER.error(
                "Error fetching information from %s - %s",
                url,
                exception,
            )
        except Exception as exception:  # pylint: disable=broad-except
            _LOGGER.error("Something really wrong happened! - %s", exception)
