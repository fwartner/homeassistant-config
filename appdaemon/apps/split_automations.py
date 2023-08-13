"""Splits automation.yaml into seperate automation files.

# Example `apps.yaml` config:
```
split_automation:
  module: split_automations
  class: SplitAutomation
```
"""

import hassapi as hass
import os
import yaml
import datetime
import unicodedata

class SplitAutomation(hass.Hass):

    def initialize(self):
        # Specify the directory where the split automation files should be saved
        split_dir = "/config/custom_configs/automations"
        
        # Read the automations.yaml file
        automations = self._read_yaml_file("/config/automations.yaml")

        if not os.path.exists(split_dir):
            os.makedirs(split_dir)

        # Get the configured hour and minute or use default values
        hour = self.args.get("hour", 13)
        minute = self.args.get("minute", 3)

        # Schedule the start_cb method to run daily at the specified time
        self.run_daily(self.start_cb, datetime.time(hour, minute, 30))

    def start_cb(self, kwargs):
        # Read the automations.yaml file again inside the callback
        automations = self._read_yaml_file("/config/automations.yaml")

        # Iterate through each automation and save it as a separate file
        for automation in automations:
            automation_name = self._get_automation_name(automation)
            automation_filename = os.path.join("/config/custom_configs/automations", f"{automation_name}.yaml")
            self._write_yaml_file(automation_filename, automation)

        self.log("Automations split and saved successfully.")

    def _read_yaml_file(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            return yaml.safe_load(file)

    def _write_yaml_file(self, file_path, data):
        with open(file_path, 'w', encoding='utf-8') as file:
            yaml.dump(data, file, default_flow_style=False, allow_unicode=True)

    def _get_automation_name(self, automation):
        automation_alias = automation.get("alias", "Unnamed_Automation")
        normalized_alias = self._normalize_string(automation_alias)
        return normalized_alias.replace(" ", "_").lower()

    def _normalize_string(self, text):
        normalized_text = unicodedata.normalize("NFKD", text)
        return normalized_text.encode("ascii", "ignore").decode("utf-8")
