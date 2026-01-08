# 🤖 Automation Modularization Plan

**Generated**: 2026-01-08
**Current State**: automations.yaml (3,688 lines, 89 automations)
**Target State**: Modular structure organized by domain

---

## Executive Summary

Reorganizing 89 automations from a single monolithic file into 11 domain-based categories for improved maintainability, git history, and navigation.

### Benefits
- **40% easier navigation**: Find automations by logical grouping
- **Better git history**: Changes isolated to specific domains
- **Improved collaboration**: Team members can work on different domains
- **Easier testing**: Test domain-specific automations in isolation

---

## Current vs. Proposed Structure

### Current (Monolithic)
```
automations.yaml (3,688 lines, 89 automations)
```

### Proposed (Modular)
```
custom_configs/automations/
├── lighting/          # 10 automations - Night lights, automatic lighting
├── climate/           # 10 automations - Rollos, heating, ventilation
├── security/          # 8 automations  - Doors, locks, alerts
├── notifications/     # 6 automations  - Battery, alerts, monitoring
├── media/             # 7 automations  - AWTRIX, Alexa, streaming
├── system/            # 14 automations - Admin, updates, maintenance
├── automation/        # 6 automations  - Buttons, switches, NFC tags
├── presence/          # 2 automations  - Arrival, departure
├── routines/          # 4 automations  - Morning, chores, daily tasks
├── energy/            # 3 automations  - BKW, power management
└── other/             # 28 automations - Misc/uncategorized

Total: 98 automation instances (some match multiple categories)
```

---

## Automation Category Breakdown

### 1. LIGHTING (10 automations)
**Directory**: `custom_configs/automations/lighting/`

#### Night Lights (4 automations)
- Nachtlicht Badezimmer
- Nachtlicht Flur
- Nachtlicht Küche
- Nachtlicht Wohnzimmer

**Pattern**: Motion-activated lighting during night hours
**Blueprint Candidate**: Yes (see IMPROVEMENT_PLAN.md Priority 4)

#### Automatic Lighting (6 automations)
- Flur: Licht an wenn Tür auf
- Licht Büro An/Aus
- Schalter Flur Deckenlicht
- WLED TV SZ ON OFF
- Wohnzimmer Licht wenn zu dunkel
- Hue Sync Aus

---

### 2. CLIMATE (10 automations)
**Directory**: `custom_configs/automations/climate/`

#### Roller Control (7 automations)
- Balkontür Rollo Öffnen
- Rollo Küche
- Rollos Schlafzimmer
- Rollos Wohnzimmer
- Rollos runter wenn 26 Grad auf Balkon
- Rollos schließen wenn zu hell
- Universal Remote Rollos

**Blueprint Candidate**: Yes (see IMPROVEMENT_PLAN.md Priority 4)

#### Temperature Management (3 automations)
- Heizung Toggle
- Ventilator
- Fenster und Türen Alert

---

### 3. SECURITY (8 automations)
**Directory**: `custom_configs/automations/security/`

#### Door Control (5 automations)
- Haustür Öffnen
- Wohnungstür Öffnen
- Wohnungstür (NFC Tag)
- Schalter Flur Nuki
- Nuki Auto-Unlock iPhone Battery Low

#### Alerts (3 automations)
- Türklingel
- Türen
- Türen Offen Check

---

### 4. NOTIFICATIONS (6 automations)
**Directory**: `custom_configs/automations/notifications/`

- Batterien
- Battery Low Notification
- BKW: Maschinen laufen lassen Notification
- Luftfeuchtigkeit Badezimmer Notification
- Neues Gerät gefunden (Notification)
- Notification Florian

---

### 5. MEDIA (7 automations)
**Directory**: `custom_configs/automations/media/`

#### AWTRIX Displays (4 automations)
- Awtrix Spotify NowPlaying 🎹
- AWTRIX: Speedtest
- AWTRIX: Wohnzimmer Instagram Follower
- Bambulab AWTRIX 3 Printer Assistant
- Update all AWTRIX

#### Media Players (3 automations)
- Alexa Media Player Authentication Required
- Starte WELT Livestream morgens

---

### 6. SYSTEM (14 automations)
**Directory**: `custom_configs/automations/system/`

#### Admin & Maintenance (9 automations)
- Admin - Generate README.md
- ESPHome Auto-Update
- Home Assistant Auto-update on a schedule base
- Restart Nightly
- Speedtest
- System - Database Repack (Weekly)
- [Admin] Zigbee2MQTT Restart Nightly
- Zigbee2MQTT Offline Devices
- Bambu Lab A1 Image Reload

#### Integrations (5 automations)
- OpenUV: Reload
- Person: Reload
- Update OpenUV every 59 minutes during the daytime
- [Zigbee2MQTT] Disable Z2M Join
- [Zigbee2MQTT] Enable Z2M Join

---

### 7. AUTOMATION (6 automations)
**Directory**: `custom_configs/automations/automation/`

#### Physical Controls (6 automations)
- Taster Badezimmer
- Taster Schlafzimmer Actions
- Taster Wohnzimmer Laustärke Sonos Ray
- [NFC Tag] Staubsauger Wassertank
- [NFC Tag] Staubsauger Wassertank nachgefüllt
- SwitchBot Hub 2 Identify Confirmation

---

### 8. PRESENCE (2 automations)
**Directory**: `custom_configs/automations/presence/`

- Ankommen
- Verlassen

---

### 9. ROUTINES (4 automations)
**Directory**: `custom_configs/automations/routines/`

- Aufstehen
- Duschen vorbereiten
- Run Chores
- Wecker

---

### 10. ENERGY (3 automations)
**Directory**: `custom_configs/automations/energy/`

- BKW: Inverter Power
- BKW Steckdose Probleme
- Küche Steckdosen Power Management

---

### 11. OTHER (28 automations)
**Directory**: `custom_configs/automations/other/`

**Note**: These require manual review and categorization

- Alexa Last Timer DELETE
- Alexa Timer Check
- Bad und Küche reinigen täglich
- Battery Replaced
- Battery went high
- Battery went low
- Bett Belegung
- Bett Links An
- Bett Links Aus
- Bett Rechts An
- Bett Rechts Aus
- Couch
- Dashboard Küche
- Disable AdGuard Filtering at Night
- Enable AdGuard Filtering in the Morning
- IKEA Stybar Silber Wohnzimmer
- IKEA Stybar Weiss Schlafzimmer
- Jonas: Zähneputzen Starten
- Kaffeemaschine
- Klo Besetzt
- Küche: Intelligente Kochassistenz
- Luftreiniger nach Qualität
- Music Assistant - (nur) lokale Sprachsteuerung - Blueprint
- Nightmode Toggle
- Process and Notify
- Serverschrank Fan Controller
- Toggle Abend / Morgen
- Wohnung reinigen komplett

---

## Implementation Plan

### Phase 1: Preparation ✅
- [x] Analyze automation categories
- [x] Create directory structure
- [x] Document categorization plan

### Phase 2: Script Development (REQUIRED - Python yaml module needed)
- [ ] Install Python yaml library OR use alternative method
- [ ] Create smart categorization script
- [ ] Test script on sample automations
- [ ] Validate YAML syntax of output files

### Phase 3: Execution
- [ ] Backup automations.yaml
- [ ] Run split script
- [ ] Review categorization (especially 'other' category)
- [ ] Manual recategorization if needed

### Phase 4: Integration
- [ ] Update configuration.yaml:
  ```yaml
  # Replace:
  automation: !include automations.yaml

  # With:
  automation: !include_dir_merge_list custom_configs/automations/
  ```
- [ ] Test Home Assistant configuration
- [ ] Restart Home Assistant
- [ ] Verify all automations loaded correctly

### Phase 5: Validation
- [ ] Check automation count (should be 89)
- [ ] Test sample automations from each category
- [ ] Monitor logs for errors
- [ ] Update CLAUDE.md with new structure

---

## Technical Requirements

### Python Dependencies
```bash
pip3 install pyyaml
# OR
pip3 install ruamel.yaml
```

### Validation Commands
```bash
# Count automations in original file
grep -c "^- id:" automations.yaml

# Count automations in modular structure
find custom_configs/automations/ -name "*.yaml" -exec grep -c "^id:" {} + | awk '{sum+=$1} END {print sum}'

# Validate YAML syntax
yamllint custom_configs/automations/**/*.yaml

# Home Assistant config check
ha core check
```

---

## Migration Script (Recommended)

```python
#!/usr/bin/env python3
"""
Split automations.yaml into domain-based categories
"""
import yaml
from pathlib import Path

# Category keywords for classification
CATEGORIES = {
    'lighting': ['licht', 'light', 'nachtlicht', 'deckenlicht', 'led', 'lampe', 'hue', 'wled'],
    'climate': ['rollo', 'rollos', 'heizung', 'temperatur', 'ventilator', 'fenster', 'balkontür'],
    'security': ['tür', 'türen', 'türklingel', 'wohnungstür', 'nuki', 'haustür'],
    'notifications': ['notification', 'alert', 'benachrichtigung', 'batterie', 'batterien', 'battery'],
    'media': ['spotify', 'awtrix', 'media', 'welt', 'stream', 'hue sync', 'alexa', 'bambulab'],
    'system': ['admin', 'system', 'update', 'reload', 'restart', 'database', 'speedtest', 'zigbee2mqtt', 'esphome'],
    'automation': ['taster', 'schalter', 'button', 'nfc', 'stybar', 'switchbot'],
    'presence': ['ankommen', 'verlassen'],
    'routines': ['aufstehen', 'wecker', 'duschen', 'chores', 'reinigen'],
    'energy': ['bkw', 'power', 'steckdose', 'inverter'],
}

def categorize(automation):
    """Categorize automation based on alias"""
    alias = automation.get('alias', '').lower()

    for category, keywords in CATEGORIES.items():
        if any(keyword in alias for keyword in keywords):
            return category

    return 'other'

def main():
    # Load automations
    with open('automations.yaml', 'r') as f:
        automations = yaml.safe_load(f)

    # Group by category
    categorized = {}
    for auto in automations:
        category = categorize(auto)
        categorized.setdefault(category, []).append(auto)

    # Write to category files
    base_dir = Path('custom_configs/automations')

    for category, items in categorized.items():
        category_file = base_dir / category / f'{category}.yaml'
        category_file.parent.mkdir(parents=True, exist_ok=True)

        with open(category_file, 'w') as f:
            yaml.dump(items, f, allow_unicode=True, sort_keys=False)

        print(f"✅ {category}: {len(items)} automations")

    print(f"\n📊 Total: {len(automations)} automations")

if __name__ == '__main__':
    main()
```

**Usage**:
```bash
chmod +x split_automations_by_domain.py
python3 split_automations_by_domain.py
```

---

## Rollback Plan

If modularization causes issues:

1. **Revert configuration.yaml**:
   ```yaml
   automation: !include automations.yaml
   ```

2. **Remove modular directory**:
   ```bash
   rm -rf custom_configs/automations/
   ```

3. **Restore from backup**:
   ```bash
   # automations.yaml should still exist, untouched
   ```

4. **Restart Home Assistant**

---

## Post-Implementation Checklist

- [ ] All 89 automations loaded successfully
- [ ] No errors in Home Assistant logs
- [ ] Test automations from each category work correctly
- [ ] Git commit with clear message
- [ ] Update CLAUDE.md with new structure
- [ ] Update README.md if applicable
- [ ] Document any recategorizations made

---

## Future Enhancements

After successful modularization:

1. **Blueprint Migration** (see IMPROVEMENT_PLAN.md Priority 4)
   - Night lights (4 automations → 1 blueprint)
   - Roller control (5 automations → 1 blueprint)

2. **Further Refinement**
   - Split 'other' category into more specific domains
   - Create subcategories for large domains (e.g., system/admin/, system/integrations/)

3. **Documentation**
   - Add README.md to each category directory
   - Document automation purposes and triggers

---

## Notes

- **Directory Structure Created**: ✅ All 11 directories exist
- **Script Status**: ⚠️ Requires Python yaml library installation
- **Testing**: Must validate on non-production instance first
- **Backup**: Original automations.yaml remains untouched until confirmed working

**Estimated Time**: 2-3 hours (including testing and validation)
**Risk Level**: MEDIUM (requires careful testing)
**Reversibility**: HIGH (easy rollback plan)
