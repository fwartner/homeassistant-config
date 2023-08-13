"""Splits automation.yaml into seperate files.

# Example `apps.yaml` config:
```
split_automation:
  module: split_automation
  class: SplitAutomation
```
"""

import hassapi as hass
import os
import yaml

SPLIT_DIR = "/config/custom_configs/automations"
AUTOMATION_FILE = "/config/automation.yaml"

class SplitAutomation(hass.Hass):

    def initialize(self):
        # Specify the directory where the split automation files should be saved
        split_dir = "/config/custom_configs/automations"
        
        # Read the automation.yaml file
        automation_path = "/config/automation.yaml"
        automations = self.read_yaml_file(AUTOMATION_FILE)

        if not os.path.exists(SPLIT_DIR):
            os.makedirs(SPLIT_DIR)

        self.run_daily(self.start_cb)

        # Iterate through each automation and save it as a separate file
    def start_cb:
        for automation in automations:
            automation_name = self.get_automation_name(automation)
            automation_filename = os.path.join(SPLIT_DIR, f"{automation_name}.yaml")
            self.write_yaml_file(automation_filename, automation)

        self.log("Automations split and saved successfully.")

    def read_yaml_file(self, file_path):
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)

    def write_yaml_file(self, file_path, data):
        with open(file_path, 'w') as file:
            yaml.dump(data, file, default_flow_style=False)

    def get_automation_name(self, automation):
        return automation.get("alias", "Unnamed_Automation").replace(" ", "_").lower()





