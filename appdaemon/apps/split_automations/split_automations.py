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

        # Check if the split directory is empty, and perform initial import if needed
        if not os.listdir(self.split_dir):
            self.log("Split directory is empty. Performing initial import...")
            self.initial_import()

        self.listen_event(self.new_automation_created, event="automation_reloaded")
        self.listen_event(self.automation_deleted, event="automation_removed")

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

    def new_automation_created(self, event_name, data, kwargs):
        self.log("New automation created. Splitting and updating automations...")
        self.split_and_update_automations()

    def automation_deleted(self, event_name, data, kwargs):
        automation_id = data.get("automation_id", None)
        if automation_id:
            automation_name = self._get_normalized_name(self.get_state(automation_id, attribute="friendly_name"))
            split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

            if os.path.exists(split_filename):
                os.remove(split_filename)
                self.log(f"Deleted split file: {split_filename}")

    def split_and_update_automations(self):
        automations = self._read_yaml_file(self.automations_file)
        split_automation_names = []

        for automation in automations:
            automation_alias = automation.get("alias", None)
            automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
            split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

            existing_automation = self._read_yaml_file(split_filename) if os.path.exists(split_filename) else None

            if existing_automation != automation:
                self._write_yaml_file(split_filename, automation)
                split_automation_names.append(automation_name)

        # Delete split files corresponding to deleted automations
        for split_file in os.listdir(self.split_dir):
            if split_file[:-5] not in split_automation_names:  # Remove ".yaml" extension
                os.remove(os.path.join(self.split_dir, split_file))
                self.log(f"Deleted split file: {split_file}")

        self.log("Automations split and updated successfully.")

    def _read_yaml_file(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            return yaml.safe_load(file)

    def _write_yaml_file(self, file_path, data):
        with open(file_path, 'w', encoding='utf-8') as file:
            yaml.dump(data, file, default_flow_style=False, allow_unicode=True)

    def _get_normalized_name(self, text):
        normalized_text = unicodedata.normalize("NFKD", text)
        return re.sub(r'[^a-zA-Z0-9_]', '_', normalized_text).lower()
