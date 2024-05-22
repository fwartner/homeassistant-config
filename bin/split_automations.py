#!/usr/bin/env python3

import yaml
import os
import re

def normalize_name(name):
    name = name.replace('ä', 'a').replace('ö', 'o').replace('ü', 'u')
    return re.sub(r'[\W]+', '_', name).lower()

def clear_directory(directory):
    for file in os.listdir(directory):
        file_path = os.path.join(directory, file)
        if os.path.isfile(file_path):
            os.remove(file_path)

def split_automations(input_file, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    
    clear_directory(output_dir)

    with open(input_file, 'r') as file:
        automations = yaml.safe_load(file)
    
    if not isinstance(automations, list):
        print("No automations found or the YAML is not correctly formatted as a list.")
        return

    for index, automation in enumerate(automations):
        name = automation.get('alias') or automation.get('id') or f'automation_{index + 1}'
        filename = normalize_name(name) + '.yaml'
        output_filename = os.path.join(output_dir, filename)
        with open(output_filename, 'w') as outfile:
            yaml.safe_dump(automation, outfile, default_flow_style=False)

        print(f"Automation saved to {output_filename}")

split_automations('automations.yaml', 'splitted/automations')
