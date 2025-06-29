# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive Home Assistant configuration repository with a modular, split-file architecture. The configuration supports a German smart home setup with extensive automation, 3000+ entities, and integration with external services running on Proxmox.

## Configuration Architecture

### Core Structure
- `configuration.yaml` - Main configuration file that includes all other components
- `integrations/` - Home Assistant platform configurations (packages pattern)
- `custom_configs/` - Split configuration files organized by entity type
- `splitted/` - Individual automation, script, and scene files for better maintainability
- `esphome/` - ESPHome device configurations with common templates
- `themes/` - Custom UI themes (Catppuccin, Mushroom, Noctis, Rounded)
- `templates/` - Jinja2 templates for dashboard generation

### Key Patterns
- Uses `!include_dir_merge_named` and `!include_dir_merge_list` extensively
- Package architecture for integrations in `integrations/` directory
- Entity split pattern: sensors, binary_sensors, groups, etc. in separate files
- Common ESPHome templates in `esphome/common/` for device consistency

### External Dependencies
- PostgreSQL database (Proxmox)
- InfluxDB for metrics (Proxmox) 
- Nginx Proxy Manager (Proxmox)
- NodeRED automation platform (Proxmox)
- Mosquitto MQTT broker
- Room Assistant for presence detection

## Development Commands

### Validation and Testing
```bash
# YAML linting (install yamllint first)
./bin/yamllint.sh

# Home Assistant configuration check (requires HA CLI)
hass --config . --script check_config

# Manual YAML validation
yamllint .
```

### Git Workflow
```bash
# Automated commit with HA version timestamp
./bin/ha_gitpush.sh

# Creates fake secrets for testing
./bin/make_fake_secrets.sh
```

### CI/CD Pipeline
- GitHub Actions automatically runs on push/PR
- Tests against current HA version, stable, beta, and dev
- Validates YAML syntax and Home Assistant configuration
- Uses `fake_secrets.yaml` for CI testing

## File Organization Rules

### When Adding New Entities
- **Sensors**: Add to `custom_configs/sensors/[descriptive_name].yaml`
- **Binary Sensors**: Add to `custom_configs/binary_sensors/[descriptive_name].yaml`
- **Automations**: Add to `splitted/automations/[descriptive_name].yaml`
- **Scripts**: Add to `splitted/scripts/[descriptive_name].yaml`
- **Scenes**: Add to `splitted/scenes/[descriptive_name].yaml`

### When Adding New Integrations
- Create new file in `integrations/[integration_name].yaml`
- Follow existing package pattern with configuration sections

### ESPHome Devices
- Device configs in `esphome/[device-name].yaml`
- Use common templates from `esphome/common/` for consistency
- Icons stored in `esphome/icons/` directory

## Important Files

### Configuration Files
- `.HA_VERSION` - Tracks current Home Assistant version for CI
- `fake_secrets.yaml` - Template secrets file for testing
- `.yamllint` - YAML linting configuration

### Automation Logic
- Presence detection using iCloud3 and room-assistant
- Energy monitoring with BKW power sensors
- Climate control with Better Thermostat
- Security automation with Nuki smart locks
- Voice assistant integration with Alexa and Music Assistant

## Common Development Tasks

### Adding New Automation
1. Create file in `splitted/automations/[descriptive_name].yaml`
2. Follow existing naming convention (German descriptions for personal use)
3. Test with Home Assistant configuration check
4. Commit using `./bin/ha_gitpush.sh`

### Adding New Integration
1. Create `integrations/[integration_name].yaml`
2. Add any required custom_configs in appropriate subdirectories
3. Update any related groups in `custom_configs/groups/`
4. Test configuration and commit

### ESPHome Device Development
1. Use existing common templates from `esphome/common/`
2. Follow device naming convention: `[location]-[device-type].yaml`
3. Test with ESPHome validate command before deployment

## Notes
- Configuration uses German language settings and German entity names
- Timezone set to Europe/Berlin
- Uses metric units and EUR currency
- Extensive use of HACS custom components and Lovelace cards
- Dashboard templates generated using Jinja2 in `templates/` directory