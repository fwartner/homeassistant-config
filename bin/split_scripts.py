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

def split_scripts(input_file, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    
    clear_directory(output_dir)

    with open(input_file, 'r') as file:
        scripts = yaml.safe_load(file)
    
    if not isinstance(scripts, dict):
        print("No scripts found or the YAML is not correctly formatted as a dictionary.")
        return

    for key, script in scripts.items():
        filename = normalize_name(key) + '.yaml'
        output_filename = os.path.join(output_dir, filename)
        with open(output_filename, 'w') as outfile:
            yaml.safe_dump({key: script}, outfile, default_flow_style=False)

split_scripts('scripts.yaml', 'splitted/scripts')
