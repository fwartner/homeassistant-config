# Home Assistant Configuration Documentation

This document provides instructions for enhancing automations, scripts, and scenes in this Home Assistant configuration.

## Overview

This Home Assistant setup uses a split configuration approach. Core configuration files are in the root directory, with detailed customizations in the `custom_configs` directory. Automations, scripts, and scenes are defined in `automations.yaml`, `scripts.yaml`, and `scenes.yaml` respectively. These are then split into individual files in the `splitted` directory for better readability and management.

- **Automations**: `automations.yaml` -> `splitted/automations/`
- **Scripts**: `scripts.yaml` -> `splitted/scripts/`
- **Scenes**: `scenes.yaml` -> `splitted/scenes/`

The splitting is handled by Python scripts in the `bin` directory:

- `bin/split_automations.py`
- `bin/split_scripts.py`
- `bin/split_scenes.py`

These scripts are run to update the `splitted` directory after any changes to the main `.yaml` files.

## Enhancing Automations

To add or modify automations:

1.  **Edit `automations.yaml`**: Add your new automation or modify an existing one in this file.
2.  **Run the split script**: Execute `python3 bin/split_automations.py` to update the individual automation files in `splitted/automations`.
3.  **Reload Automations**: In Home Assistant, go to **Developer Tools > YAML** and click **Reload Automations**.

**Example: Adding a new automation**

Add the following to `automations.yaml`:

```yaml
- alias: 'New Automation Example'
  trigger:
    - platform: state
      entity_id: light.living_room
      to: 'on'
  action:
    - service: notify.persistent_notification
      data:
        message: "The living room light was turned on."
```

Then run `python3 bin/split_automations.py`.

## Enhancing Scripts

To add or modify scripts:

1.  **Edit `scripts.yaml`**: Add your new script or modify an existing one. Scripts are defined as a dictionary.
2.  **Run the split script**: Execute `python3 bin/split_scripts.py` to create or update the corresponding YAML file in `splitted/scripts`.
3.  **Reload Scripts**: In Home Assistant, go to **Developer Tools > YAML** and click **Reload Scripts**.

**Example: Adding a new script**

Add the following to `scripts.yaml`:

```yaml
new_script_example:
  alias: 'New Script Example'
  sequence:
    - service: light.toggle
      entity_id: light.kitchen
```

Then run `python3 bin/split_scripts.py`.

## Enhancing Scenes

To add or modify scenes:

1.  **Edit `scenes.yaml`**: Add your new scene or modify an existing one.
2.  **Run the split script**: Execute `python3 bin/split_scenes.py` to update the `splitted/scenes` directory.
3.  **Reload Scenes**: In Home Assistant, go to **Developer Tools > YAML** and click **Reload Scenes**.

**Example: Adding a new scene**

Add the following to `scenes.yaml`:

```yaml
- name: 'New Scene Example'
  entities:
    light.bedroom:
      state: 'on'
      brightness: 255
```

Then run `python3 bin/split_scenes.py`.

## Development Workflow

1.  Make changes to `automations.yaml`, `scripts.yaml`, or `scenes.yaml`.
2.  Run the corresponding `split_*.py` script from the `bin` directory.
3.  Review the changes in the `splitted` directory.
4.  Reload the relevant configuration in Home Assistant.
5.  Commit the changes to both the main `.yaml` file and the `splitted` directory.
