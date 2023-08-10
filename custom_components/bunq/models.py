""" bunq models """
from typing import TypedDict
from enum import Enum


class BunqApiUrls(TypedDict):
    """oAuth2 urls for a single environment."""
    authorize_url: str
    token_url: str
    api_url: str


class BunqApiEnvironment(Enum):
    """Enum to represent API environment"""
    Sandbox = 1,
    Production = 2,


class BunqStatus:
    """Class to hold all bunq information"""
    user_id: str = None
    session_token: str = None
    accounts: list = []
    account_transactions: dict = {}

    def update_user(self, user_id, session_token):
        """ store user info """
        self.user_id = user_id
        self.session_token = session_token

    def update_accounts(self, accounts):
        """ update accounts """
        self.accounts = accounts

    def update_account_transactions(self, account_id, transactions):
        """ update transactions """
        self.account_transactions[str(account_id)] = transactions
