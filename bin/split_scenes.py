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

def split_scenes(input_file, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    
    clear_directory(output_dir)

    with open(input_file, 'r') as file:
        scenes = yaml.safe_load(file)
    
    if not isinstance(scenes, list):
        print("No scenes found or the YAML is not correctly formatted as a list.")
        return

    for index, scene in enumerate(scenes):
        name = scene.get('name') or f'scene_{index + 1}'
        filename = normalize_name(name) + '.yaml'
        output_filename = os.path.join(output_dir, filename)
        with open(output_filename, 'w') as outfile:
            yaml.safe_dump([scene], outfile, default_flow_style=False)

split_scenes('scenes.yaml', 'splitted/scenes')

