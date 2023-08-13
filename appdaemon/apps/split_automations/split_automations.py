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
import datetime

class SplitAutomations(hass.Hass):

    def initialize(self):
        self._load_config()

        # Check if the split directory is empty, and perform initial import if needed
        if not os.listdir(self.split_dir):
            self.log("Split directory is empty. Performing initial import...")
            self.initial_import()

        self.initialize_schedule()

        self.listen_event(self.new_automation_created, event="automation_reloaded")

    def _load_config(self):
        # Get configuration parameters
        self.split_dir = self.args.get("split_directory", "/config/custom_configs/automations")
        self.automations_file = self.args.get("automations_file", "/config/automations.yaml")
        self.schedule_type = self.args.get("schedule_type", "time")  # "time" or "cron"
        self.schedule_value = self.args.get("schedule_value", "16:41")  # Time or cron expression

    def initialize_schedule(self):
        if self.schedule_type == "time":
            schedule_time = datetime.datetime.strptime(self.schedule_value, "%H:%M").time()
            self.run_daily(self.split_and_update_automations, schedule_time)
        elif self.schedule_type == "cron":
            self.run_daily(self.split_and_update_automations, time=None, constrain_app_enabled=True, cron=self.schedule_value)

    def initial_import(self):
        self.log("Performing initial import of automations...")
        automations = self._read_yaml_file(self.automations_file)
        split_automation_names = []

        for automation in automations:
            automation_alias = automation.get("alias", None)
            automation_name = self._get_normalized_name(automation_alias) if automation_alias else self._get_normalized_name(automation.get("name", "Unnamed_Automation"))
            split_filename = os.path.join(self.split_dir, f"{automation_name}.yaml")

            if not os.path.exists(split_filename):
                self._write_yaml_file(split_filename, automation)
                split_automation_names.append(automation_name)

        updated_automations = [automation for automation in automations if self._get_normalized_name(automation.get("alias", automation.get("name", "Unnamed_Automation"))) not in split_automation_names]
        self._write_yaml_file(self.automations_file, updated_automations)
        self.log("Initial import completed.")

    def new_automation_created(self, event_name, data, kwargs):
        self.log("New automation created. Splitting and updating automations...")

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

        updated_automations = [automation for automation in automations if self._get_normalized_name(automation.get("alias", automation.get("name", "Unnamed_Automation"))) not in split_automation_names]
        self._write_yaml_file(self.automations_file, updated_automations)
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
