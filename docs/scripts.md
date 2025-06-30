# 🎬 Scripts Documentation

This document provides comprehensive documentation for all scripts in the Home Assistant configuration, organized by functionality and use case.

## 📋 Table of Contents

- [Bedtime & Sleep](#bedtime--sleep)
- [Personal Care](#personal-care)
- [Information & Briefing](#information--briefing)
- [Device Control](#device-control)
- [Entertainment](#entertainment)
- [Utility Scripts](#utility-scripts)

## 🛏️ Bedtime & Sleep

### 3 Minuten Bettzeit
**Script ID**: `3_minuten_bettzeit`  
**Purpose**: Comprehensive bedtime routine with intelligent timing and error handling

**Sequence**:
1. **Parallel Shutdown Phase**:
   - Close bedroom blinds (if open)
   - Turn off dashboard screens (with error handling)
   - Lock front door (if unlocked)
   - Turn off all lights with 3-second transition
   - Turn off all outlets (with error handling)

2. **Preparation Phase**:
   - 3-second delay for system stabilization
   - Activate air purifier in low mode
   - Turn on bed light at 30% with warm color (2700K)
   - Start white noise via media player
   - Start 3-minute timer

3. **Completion Phase**:
   - Wait for timer completion (4-minute timeout)
   - Gradually turn off bed light (10-second transition)

**Features**:
- Error handling with `continue_on_error`
- State validation before actions
- Smooth transitions for comfort
- Timeout protection against hanging

**Enhancements**:
- Uses actual climate entities for air purifier
- Media player integration for white noise
- Intelligent conditional logic

---

### Schlafenszeit
**Script ID**: `schlafenszeit`  
**Purpose**: Extended bedtime routine with bathroom preparation

**Sequence**:
1. **Voice Announcement**: Random personalized message
2. **Lighting Preparation**: 
   - Flash and dim all 2nd floor lights
   - Turn on bathroom lights at 30%
3. **Security**: Lock front door after 5 minutes
4. **Final Shutdown**: 
   - Turn off bathroom lights
   - Close bedroom blinds
   - Optimize bedroom environment
   - Start white noise

**Features**:
- Randomized voice messages for variety
- Staged lighting transitions
- Security integration
- Environmental optimization

## 🧼 Personal Care

### Zähneputzen
**Script ID**: `zahneputzen`  
**Purpose**: Enhanced teeth brushing routine with audio feedback and lighting

**Sequence**:
1. **Start Timer**: Activate 2-minute teeth brushing timer
2. **Voice Feedback**: Announce start via bathroom Alexa
3. **Lighting**: Optimize bathroom lighting (100%, 4000K)
4. **Completion**: 
   - Wait for timer completion (3-minute timeout)
   - Congratulatory voice message
   - Automatic light adjustment

**Features**:
- Audio guidance and encouragement
- Optimal lighting for oral care
- Timeout protection
- Positive reinforcement

**Enhancements**:
- Real-time progress announcements
- Automatic lighting optimization
- Multi-language support ready

---

### Duschen Vorbereiten
**Script ID**: `duschen_vorbereiten`  
**Purpose**: Intelligent shower preparation with climate and lighting optimization

**Sequence**:
1. **Announcement**: Multi-room voice notification of preparation
2. **Parallel Optimization**:
   - Set heating to 24°C
   - Optimize bathroom lighting (80%, 3500K)
   - Activate ventilation system
3. **Status Tracking**: Set preparation and occupancy flags
4. **Completion**: 
   - 8-minute preparation time
   - Temperature validation
   - Ready notification with actual temperature

**Features**:
- Multi-room announcements
- Parallel task execution for speed
- Temperature monitoring and feedback
- Environmental optimization

**Enhancements**:
- Real climate entity integration
- Actual temperature feedback
- Improved ventilation management

## 📰 Information & Briefing

### Briefing
**Script ID**: `briefing`  
**Purpose**: Comprehensive morning briefing with weather, news, calendar, and home status

**Data Sources**:
- **Weather**: Indoor/outdoor temperatures, conditions, forecast
- **Home Status**: Door lock, presence, power consumption
- **Calendar**: Today's appointments and events
- **News**: Current headlines from reliable sources

**AI Processing**:
- Uses ChatGPT conversation agent
- German language processing
- Personalized summary format
- 15-sentence limit for conciseness

**Output**:
- Voice delivery via Alexa Show
- MQTT storage for history tracking
- Structured data for analysis

**Features**:
- Real-time data integration
- Intelligent summarization
- Multi-source information
- Historical tracking

**Enhancements**:
- Expanded home automation status
- Better weather integration
- Calendar event filtering
- News source diversification

## 🎛️ Device Control

### AWTRIX Control Scripts
**Purpose**: Manage AWTRIX LED matrix displays

**Scripts**:
- `awtrix_speedtest`: Display internet speed test results
- `awtrix_doorbell`: Show doorbell notifications
- `awtrix_restart`: Reboot all AWTRIX devices
- `awtrix_dismiss_notification`: Clear all notifications
- `awtrix_placeholder`: Show ambient effects

**Features**:
- Dual-display support (Wohnzimmer + Büro)
- Parallel execution for sync
- Rich notification content
- Visual feedback integration

---

### Deckenventilator Control
**Purpose**: Comprehensive ceiling fan control

**Scripts Available**:
- `deckenventilator_power`: Toggle fan power
- `deckenventilator_level_1` through `deckenventilator_level_6`: Speed control
- `deckenventilator_breeze`: Natural breeze mode
- `deckenventilator_timer_1h` through `deckenventilator_timer_8h`: Auto-off timers

**Features**:
- IR remote control integration
- Multiple speed settings
- Timer functionality
- Natural breeze simulation

---

### ESPHome Management
**Script ID**: `esphome_update_all_devices`  
**Purpose**: Automated ESPHome device updates

**Sequence**:
1. **Discovery**: Find all ESPHome devices with pending updates
2. **Sequential Updates**: Update each device individually
3. **Verification**: Wait for update completion
4. **Delay**: 3-minute intervals between updates

**Features**:
- Automatic device discovery
- Safe sequential updating
- Update verification
- System stability protection

## 🎵 Entertainment

### Apple TV Scripts
**Purpose**: Quick access to favorite shows

**Scripts**:
- `appletv_family_guy`: Launch Family Guy on Disney+
- `appletv_american_dad`: Launch American Dad on Disney+
- `appletv_simpsons`: Launch Simpsons on Disney+

**Features**:
- Direct URL launching
- Platform integration
- Quick access automation

---

### Power Management
**Script ID**: `power_wohnzimmer`  
**Purpose**: Apple TV power control with Sonos integration

**Features**:
- Remote command sequences
- Media player coordination
- State synchronization

## 🔧 Utility Scripts

### Store MQTT Sensor
**Script ID**: `store_mqtt_sensor`  
**Purpose**: Dynamic MQTT sensor creation for data storage

**Parameters**:
- `name`: Sensor identifier
- `state`: Current value
- `attributes`: Additional metadata

**Features**:
- Dynamic sensor creation
- MQTT persistence
- Attribute support
- Data retention

**Use Cases**:
- Historical data tracking
- Custom sensor creation
- Integration bridging
- Analytics support

---

### Run Chores
**Script ID**: `run_chores`  
**Purpose**: Execute maintenance shell commands

**Features**:
- System maintenance automation
- Shell command integration
- Scheduled execution support

---

### Alexa Integration Scripts

#### Alexa Room-Aware Temperature
**Script ID**: `alexa_room_aware_temperature_2`  
**Purpose**: Context-aware temperature reporting

**Features**:
- Room-specific temperature sensors
- Multi-room mapping
- Intelligent fallback to average
- Natural language responses

**Room Mapping**:
- Büro: `sensor.aqara_thermo_kinderzimmer_temperature`
- Flur: `sensor.aqara_thermo_flur_temperature`
- Badezimmer: `sensor.aqara_thermo_badezimmer_temperature`
- Schlafzimmer: `sensor.aqara_thermo_schlafzimmer_temperature`
- Wohnzimmer: `sensor.aqara_thermo_wohnzimmer_temperature`

#### Activate Alexa Actionable Notification
**Script ID**: `activate_alexa_actionable_notification`  
**Purpose**: Create interactive Alexa notifications

**Parameters**:
- `text`: Notification message
- `event_id`: Response correlation ID
- `alexa_device`: Target device
- `suppress_confirmation`: Optional confirmation suppression

**Features**:
- Interactive notifications
- Event correlation
- Device targeting
- Response handling

## 🏠 Water Management

### Log Water
**Script ID**: `log_water`  
**Purpose**: Track daily water intake

**Features**:
- Cumulative tracking
- Daily reset capability
- Health monitoring integration
- Simple parameter input

### Wassertank Aufgefüllt
**Script ID**: `wassertank_aufgefullt_2`  
**Purpose**: Track water tank refill dates

**Features**:
- Date stamp recording
- Maintenance tracking
- Schedule optimization

## ⚙️ Script Best Practices

### Design Principles:
1. **Error Resilience**: Use `continue_on_error` for non-critical steps
2. **State Validation**: Check entity states before actions
3. **Timeout Protection**: Prevent infinite waiting
4. **User Feedback**: Provide voice/visual confirmation
5. **Resource Efficiency**: Parallel execution where appropriate

### Performance Optimization:
- **Parallel Tasks**: Execute independent actions simultaneously
- **Conditional Logic**: Skip unnecessary steps
- **Timeout Management**: Prevent hanging scripts
- **State Caching**: Minimize entity state queries

### Debugging Features:
- **Detailed Logging**: Comprehensive execution traces
- **Mode Checking**: Respect maintenance and testing modes
- **Error Handling**: Graceful failure management
- **Status Reporting**: Progress and completion feedback

## 🔧 Maintenance & Updates

### Regular Maintenance:
1. **Review Timeouts**: Ensure appropriate timeout values
2. **Update Entity References**: Verify entity availability
3. **Test Error Paths**: Validate error handling
4. **Performance Monitoring**: Check execution times

### Update Procedures:
1. **Backup Scripts**: Before major changes
2. **Test in Staging**: Validate functionality
3. **Gradual Rollout**: Deploy incrementally
4. **Monitor Performance**: Watch for regressions

---

**Note**: All scripts are designed for reliability and user experience. They include comprehensive error handling, appropriate timeouts, and user feedback mechanisms. Regular testing and maintenance ensure optimal performance and reliability.