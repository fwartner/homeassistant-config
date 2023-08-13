"""Splits automation.yaml into seperate automation files.

# Example `apps.yaml` config:
```
split_automations:
  module: split_automations
  class: SplitAutomations
  split_directory: /config/custom_configs/automations  # Optional. Defaults to "/config/custom_configs/automations"
  automations_file: /config/automations.yaml  # Optional. Defaults to "/config/automations.yaml"
```
"""
import appdaemon.plugins.hass.hassapi as hass
import os
import yaml
import unicodedata
import re

class SplitAutomations(hass.Hass):

    def initialize(self):
        self._load_config()

        self.listen_event(self.automation_created, event="automation_created")
        self.listen_event(self.automation_updated, event="automation_updated")
        self.listen_event(self.automation_deleted, event="automation_deleted")

        # Perform initial import if needed
        self.initial_import()

    def _load_config(self):
        # Get configuration parameters
        self.split_dir = self.args.get("split_directory", "/config/custom_configs/automations")
        self.automations_file = self.args.get("automations_file", "/config/automations.yaml")

    def initial_import(self):
        self.log("Performing initial import of automations...")
        automations = self._read_yaml_file(self.automations_file)

        for automation in automations:
            automation_alias = automation.get("alias", None)
            automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
            split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

            if not os.path.exists(split_filename):
                self._write_yaml_file(split_filename, automation)

        self.log("Initial import completed.")

    def automation_created(self, event_name, data, kwargs):
        self.log("New automation created. Creating split file...")
        automation = data.get("automation")
        if automation:
            self.create_split_file(automation)

    def automation_updated(self, event_name, data, kwargs):
        self.log("Automation updated. Updating split file...")
        automation = data.get("automation")
        if automation:
            self.update_split_file(automation)

    def automation_deleted(self, event_name, data, kwargs):
        self.log("Automation deleted. Deleting split file...")
        automation = data.get("automation")
        if automation:
            self.delete_split_file(automation)

    def create_split_file(self, automation):
        automation_alias = automation.get("alias", None)
        automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
        split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

        if not os.path.exists(split_filename):
            self._write_yaml_file(split_filename, automation)
            self.log(f"Created split file: {split_filename}")

    def update_split_file(self, automation):
        automation_alias = automation.get("alias", None)
        automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
        split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

        existing_automation = self._read_yaml_file(split_filename) if os.path.exists(split_filename) else None

        if existing_automation != automation:
            self._write_yaml_file(split_filename, automation)
            self.log(f"Updated split file: {split_filename}")

    def delete_split_file(self, automation):
        automation_alias = automation.get("alias", None)
        automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
        split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

        if os.path.exists(split_filename):
            os.remove(split_filename)
            self.log(f"Deleted split file: {split_filename}")

    def _read_yaml_file(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            return yaml.safe_load(file)

    def _write_yaml_file(self, file_path, data):
        with open(file_path, 'w', encoding='utf-8') as file:
            yaml.dump(data, file, default_flow_style=False, allow_unicode=True)

    def _get_normalized_name(self, text):
        normalized_text = unicodedata.normalize("NFKD", text)
        return re.sub(r'[^a-zA-Z0-9_]', '_', normalized_text).lower()
