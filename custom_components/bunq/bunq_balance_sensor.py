""" bunq sensor"""
import dataclasses
from homeassistant.components.sensor import (
    SensorEntity,SensorEntityDescription,SensorDeviceClass
)
from homeassistant.helpers.update_coordinator import CoordinatorEntity
from homeassistant.core import  callback
from .const import LOGGER

class BunqBalanceSensor(CoordinatorEntity, SensorEntity):
    """Setup bunq balance sensor."""

    def __init__(self, coordinator, account) -> None:
        """Initialize the sensor."""
        super().__init__(coordinator)
        self._attr_unique_id = account["id"]
        self.entity_description = SensorEntityDescription(
            key=account["id"],
            device_class=SensorDeviceClass.MONETARY,
            icon="mdi:cash-multiple",
        )
        self._attr_extra_state_attributes = {}

        self._async_update_attrs()

    @callback
    def _handle_coordinator_update(self) -> None:
        """Handle updated data from the coordinator."""
        self._async_update_attrs()
        self.async_write_ha_state()

    @callback
    def _async_update_attrs(self) -> None:
        """Update sensor attributes."""
        LOGGER.debug("updte attributes for %s", str(self._attr_unique_id))

        transactions = self.coordinator.bunq.status.account_transactions[str(self._attr_unique_id)]

        account = None
        for value in self.coordinator.bunq.status.accounts:
            if str(value["id"]) == str(self._attr_unique_id):
                account = value

        if account is None:
            LOGGER.debug("no account for id %s", str(self._attr_unique_id))
        else:
            self._attr_native_value = float(account["balance"]["value"])
            self.entity_description = dataclasses.replace(
                self.entity_description,
                name =  "bunq_" + account["description"].lower().replace(" ", "_"),
                unit_of_measurement = account["currency"]
            )
            self.load_transactions(transactions)
            self._attr_extra_state_attributes['account_id'] = self._attr_unique_id

    def load_transactions(self, transactions):
        """ load transactions"""
        trx = []
        for transaction in transactions:
            LOGGER.debug("transaction: %s", transaction)
            item = {
                "amount": float(transaction["amount"]["value"]),
                "currency": transaction["amount"]["currency"],
                "description": transaction["description"],
                "id": transaction["id"],
                "created": transaction["created"],
                "type": transaction["type"],
            }
            trx.append(item)
        self._attr_extra_state_attributes['transactions'] = trx
