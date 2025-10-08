; HEADER_BLOCK_START
; BambuStudio 02.02.02.56
; model printing time: 16m 17s; total estimated time: 22m 34s
; total layer number: 83
; total filament length [mm] : 1465.03
; total filament volume [cm^3] : 3523.81
; total filament weight [g] : 4.37
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 10.04
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 5
; bottom_shell_layers = 5
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20250206 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = #000000
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = enable_prime_tower;prime_tower_infill_gap;prime_tower_rib_wall;sparse_infill_density;top_surface_pattern;wall_loops;default_filament_colour;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_max_speed = 80
; fan_min_speed = 60
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 10
; filament_colour = #FFFFFF
; filament_colour_type = 1
; filament_cost = 20
; filament_density = 1.24
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_support = 0
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_minimal_purge_on_wipe_tower = 15
; filament_multi_colour = #FFFFFF
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 0
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 350
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 350
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 350
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.12
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20240620 =====================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{nozzle_temperature_range_high[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.12mm Fine @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 25%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 430
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.12
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 20
; support_top_z_distance = 0.12
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 0.6
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = concentric
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 230.286
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R22
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20240620 =====================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F299.339 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S240 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R22
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R21
G1 X-48.2 F3000
M73 P4 R21
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
M73 P5 R21
    G1 X-48.2 F3000
M73 P6 R21
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
M73 P7 R20
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P26 R16
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
M73 P27 R16
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X108 Y115 I40 J26
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/83
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 82
G1 X109.456 Y117.346 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X109.456 Y117.098 E.00924
G1 X109.497 Y116.837 E.00984
G3 X109.837 Y116.497 I.55 J.21 E.01841
G1 X110.098 Y116.456 E.00984
G1 X145.914 Y116.458 E1.33402
G1 X146.163 Y116.497 E.00941
G3 X146.503 Y116.837 I-.21 J.55 E.01841
G1 X146.544 Y117.098 E.00984
G1 X146.544 Y130.959 E.51629
G1 X146.468 Y132.115 E.04314
G1 X146.25 Y133.211 E.04161
G1 X145.891 Y134.269 E.04162
G1 X145.397 Y135.271 E.04161
G1 X144.776 Y136.2 E.04161
G1 X144.04 Y137.04 E.04161
G1 X143.2 Y137.776 E.04161
G1 X142.271 Y138.397 E.04161
G1 X141.269 Y138.891 E.04161
G1 X140.211 Y139.25 E.04162
G1 X139.115 Y139.468 E.04161
G1 X137.959 Y139.544 E.04313
G1 X118.041 Y139.544 E.74189
G1 X116.885 Y139.468 E.04314
G1 X115.789 Y139.25 E.04161
G1 X114.731 Y138.891 E.04162
G1 X113.729 Y138.397 E.04161
G1 X112.8 Y137.776 E.04161
G1 X111.96 Y137.04 E.04161
G1 X111.224 Y136.2 E.04161
G1 X110.603 Y135.271 E.04161
G1 X110.109 Y134.269 E.04161
G1 X109.75 Y133.211 E.04162
G1 X109.532 Y132.115 E.04161
G1 X109.456 Y130.959 E.04314
G1 X109.456 Y117.406 E.50482
M204 S6000
G1 X108.999 Y117.346 F42000
G1 F3000
M204 S500
G1 X108.999 Y117.062 E.01058
G1 X109.057 Y116.694 E.01387
G1 X109.198 Y116.417 E.01155
G1 X109.417 Y116.198 E.01155
G1 X109.694 Y116.057 E.01155
G1 X110.062 Y115.999 E.01387
G1 X145.985 Y116.006 E1.33803
G1 X146.306 Y116.057 E.0121
G1 X146.583 Y116.198 E.01155
G1 X146.802 Y116.417 E.01155
G1 X146.943 Y116.694 E.01155
G1 X147.001 Y117.062 E.01387
G1 X147.001 Y130.974 E.51819
G1 X146.922 Y132.175 E.04481
G1 X146.693 Y133.329 E.04384
G1 X146.314 Y134.444 E.04385
G1 X145.794 Y135.5 E.04384
G1 X145.14 Y136.478 E.04384
G1 X144.363 Y137.363 E.04385
G1 X143.478 Y138.14 E.04385
G1 X142.5 Y138.794 E.04384
G1 X141.444 Y139.314 E.04384
G1 X140.329 Y139.693 E.04385
M73 P28 R16
G1 X139.175 Y139.922 E.04384
G1 X137.974 Y140.001 E.0448
G1 X118.026 Y140.001 E.74301
G1 X116.825 Y139.922 E.04481
G1 X115.671 Y139.693 E.04384
G1 X114.556 Y139.314 E.04385
G1 X113.5 Y138.794 E.04384
G1 X112.522 Y138.14 E.04384
G1 X111.637 Y137.363 E.04385
G1 X110.86 Y136.478 E.04385
G1 X110.206 Y135.5 E.04384
G1 X109.686 Y134.444 E.04384
G1 X109.307 Y133.329 E.04385
G1 X109.078 Y132.175 E.04384
G1 X108.999 Y130.974 E.04481
G1 X108.999 Y117.406 E.50537
M204 S6000
G1 X108.542 Y117.346 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X108.542 Y117.026 E.01192
G1 X108.617 Y116.551 E.01791
G1 X108.824 Y116.145 E.01694
G1 X109.145 Y115.824 E.01694
G1 X109.551 Y115.617 E.01694
G1 X110.026 Y115.542 E.01791
G1 X145.974 Y115.542 E1.33895
G1 X146.057 Y115.555 E.00311
G1 X146.449 Y115.617 E.0148
G1 X146.855 Y115.824 E.01694
G1 X147.176 Y116.145 E.01694
G1 X147.383 Y116.551 E.01694
G1 X147.458 Y117.026 E.01791
G1 X147.458 Y130.989 E.52009
G1 X147.376 Y132.234 E.04648
G1 X147.135 Y133.448 E.04607
G1 X146.737 Y134.619 E.04608
G1 X146.19 Y135.729 E.04608
G1 X145.503 Y136.757 E.04607
G1 X144.687 Y137.687 E.04608
G1 X143.757 Y138.503 E.04608
G1 X142.729 Y139.19 E.04607
G1 X141.619 Y139.737 E.04607
G1 X140.448 Y140.135 E.04608
G1 X139.234 Y140.376 E.04608
G1 X137.989 Y140.458 E.04647
G1 X118.011 Y140.458 E.74412
G1 X116.766 Y140.376 E.04648
G1 X115.552 Y140.135 E.04607
G1 X114.381 Y139.737 E.04608
G1 X113.271 Y139.19 E.04608
G1 X112.243 Y138.503 E.04607
G1 X111.313 Y137.687 E.04608
G1 X110.497 Y136.757 E.04608
G1 X109.81 Y135.729 E.04607
G1 X109.263 Y134.619 E.04607
G1 X108.865 Y133.448 E.04608
G1 X108.624 Y132.234 E.04607
G1 X108.542 Y130.989 E.04648
G1 X108.542 Y117.406 E.50593
; WIPE_START
G1 X108.542 Y117.026 E-.14442
G1 X108.617 Y116.551 E-.18274
G1 X108.824 Y116.145 E-.17287
G1 X109.145 Y115.824 E-.17284
G1 X109.35 Y115.72 E-.08713
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X145.829 Y116.641 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50055
G1 F6300
M204 S500
G1 X146.11 Y116.921 E.01481
G3 X146.155 Y117.128 I-.295 J.174 E.00802
G1 X146.155 Y117.614 E.01813
G1 X145.387 Y116.846 E.0405
G1 X144.74 Y116.846 E.02414
G1 X146.155 Y118.262 E.07463
G1 X146.155 Y118.909 E.02413
G1 X144.093 Y116.846 E.10876
G1 X143.446 Y116.846 E.02414
G1 X146.155 Y119.556 E.1429
G1 X146.155 Y120.203 E.02413
G1 X142.799 Y116.846 E.17703
G1 X142.151 Y116.846 E.02414
G1 X146.155 Y120.85 E.21116
G1 X146.155 Y121.497 E.02413
G1 X141.504 Y116.846 E.24529
G1 X140.857 Y116.846 E.02414
G1 X146.155 Y122.145 E.27943
G1 X146.155 Y122.792 E.02413
G1 X140.21 Y116.846 E.31356
G1 X139.562 Y116.846 E.02414
G1 X146.155 Y123.439 E.34769
G1 X146.155 Y124.086 E.02413
G1 X138.915 Y116.846 E.38182
G1 X138.268 Y116.846 E.02414
G1 X146.155 Y124.733 E.41596
G1 X146.155 Y125.381 E.02413
G1 X137.621 Y116.846 E.45009
G1 X136.974 Y116.846 E.02414
G1 X146.155 Y126.028 E.48422
G1 X146.155 Y126.675 E.02413
G1 X136.326 Y116.846 E.51836
G1 X135.679 Y116.846 E.02414
G1 X146.155 Y127.322 E.55249
G1 X146.155 Y127.969 E.02413
G1 X135.032 Y116.846 E.58662
G1 X134.385 Y116.846 E.02414
G1 X146.155 Y128.616 E.62075
G1 X146.155 Y129.264 E.02413
G1 X133.738 Y116.846 E.65489
G1 X133.09 Y116.846 E.02414
G1 X146.155 Y129.911 E.68902
G1 X146.155 Y130.558 E.02413
G1 X132.443 Y116.846 E.72315
G1 X131.796 Y116.846 E.02414
G1 X146.139 Y131.189 E.75645
G1 X146.1 Y131.797 E.0227
G1 X131.149 Y116.846 E.78848
G1 X130.501 Y116.846 E.02414
G1 X146.022 Y132.366 E.81852
G1 X145.915 Y132.906 E.02052
G1 X129.854 Y116.846 E.84699
G1 X129.207 Y116.846 E.02414
G1 X145.772 Y133.411 E.8736
G1 X145.608 Y133.894 E.01903
G1 X128.56 Y116.846 E.89908
G1 X127.913 Y116.846 E.02414
G1 X145.417 Y134.35 E.92317
G1 X145.204 Y134.784 E.01802
G1 X127.265 Y116.846 E.94603
G1 X126.618 Y116.845 E.02414
G1 X144.975 Y135.203 E.9681
G1 X144.716 Y135.59 E.0174
G1 X125.971 Y116.845 E.98857
G1 X125.324 Y116.845 E.02414
G1 X144.455 Y135.977 E1.00894
G1 X144.153 Y136.321 E.0171
G1 X124.676 Y116.845 E1.02712
G1 X124.029 Y116.845 E.02414
G1 X143.85 Y136.666 E1.04531
G3 X143.517 Y136.981 I-1.361 J-1.107 E.01712
M73 P29 R16
G1 X123.382 Y116.845 E1.06189
G1 X122.735 Y116.845 E.02414
G1 X143.173 Y137.283 E1.07784
G3 X142.811 Y137.569 I-1.265 J-1.231 E.01723
G1 X122.088 Y116.845 E1.0929
G1 X121.44 Y116.845 E.02414
G1 X142.423 Y137.828 E1.10657
G1 X142.03 Y138.082 E.01745
G1 X120.793 Y116.845 E1.11999
G1 X120.146 Y116.845 E.02414
M73 P29 R15
G1 X141.597 Y138.296 E1.13127
G1 X141.163 Y138.51 E.01802
G1 X119.499 Y116.845 E1.14254
G1 X118.851 Y116.845 E.02414
G1 X140.685 Y138.679 E1.15146
G1 X140.202 Y138.843 E.01903
G1 X118.204 Y116.845 E1.16011
G1 X117.557 Y116.845 E.02414
G1 X139.673 Y138.961 E1.16634
G1 X139.133 Y139.068 E.02052
G1 X116.91 Y116.845 E1.17201
G1 X116.263 Y116.845 E.02414
G1 X138.534 Y139.117 E1.17456
G3 X137.926 Y139.155 I-.598 J-4.623 E.02276
G1 X115.615 Y116.845 E1.1766
G1 X114.968 Y116.845 E.02414
G1 X137.279 Y139.155 E1.1766
G1 X136.631 Y139.155 E.02413
G1 X114.321 Y116.845 E1.1766
G1 X113.674 Y116.845 E.02414
G1 X135.984 Y139.155 E1.1766
G1 X135.337 Y139.155 E.02413
G1 X113.026 Y116.845 E1.1766
G1 X112.379 Y116.845 E.02414
G1 X134.69 Y139.155 E1.17661
G1 X134.043 Y139.155 E.02413
G1 X111.732 Y116.845 E1.17661
G1 X111.085 Y116.845 E.02414
G1 X133.396 Y139.155 E1.17661
G1 X132.748 Y139.155 E.02413
G1 X110.438 Y116.845 E1.17661
G2 X109.921 Y116.891 I-.158 J1.147 E.01952
G2 X109.883 Y116.937 I.052 J.082 E.00226
G1 X132.101 Y139.155 E1.17176
G1 X131.454 Y139.155 E.02413
G1 X109.845 Y117.546 E1.13962
G1 X109.845 Y118.193 E.02413
G1 X130.807 Y139.155 E1.10549
G1 X130.16 Y139.155 E.02413
G1 X109.845 Y118.84 E1.07136
G1 X109.845 Y119.488 E.02413
G1 X129.512 Y139.155 E1.03723
G1 X128.865 Y139.155 E.02413
G1 X109.845 Y120.135 E1.0031
G1 X109.845 Y120.782 E.02413
G1 X128.218 Y139.155 E.96897
M73 P30 R15
G1 X127.571 Y139.155 E.02413
G1 X109.845 Y121.429 E.93484
G1 X109.845 Y122.076 E.02413
G1 X126.924 Y139.155 E.9007
G1 X126.276 Y139.155 E.02413
G1 X109.845 Y122.724 E.86657
G1 X109.845 Y123.371 E.02413
G1 X125.629 Y139.155 E.83244
G1 X124.982 Y139.155 E.02413
G1 X109.845 Y124.018 E.79831
G1 X109.845 Y124.665 E.02413
G1 X124.335 Y139.155 E.76418
G1 X123.688 Y139.155 E.02413
G1 X109.845 Y125.312 E.73005
G1 X109.845 Y125.959 E.02413
G1 X123.041 Y139.155 E.69592
G1 X122.393 Y139.155 E.02413
G1 X109.845 Y126.607 E.66179
G1 X109.845 Y127.254 E.02413
G1 X121.746 Y139.155 E.62766
G1 X121.099 Y139.155 E.02413
G1 X109.845 Y127.901 E.59353
G1 X109.845 Y128.548 E.02413
G1 X120.452 Y139.155 E.55939
G1 X119.805 Y139.155 E.02413
G1 X109.845 Y129.195 E.52526
G1 X109.845 Y129.843 E.02413
G1 X119.157 Y139.155 E.49113
G1 X118.51 Y139.155 E.02413
G1 X109.845 Y130.49 E.457
G2 X109.858 Y131.15 I5.047 J.228 E.02466
G1 X117.85 Y139.142 E.42146
G1 X117.157 Y139.097 E.02588
G1 X109.903 Y131.843 E.38254
G1 X109.918 Y132.064 E.00827
G1 X110.027 Y132.614 E.0209
G1 X116.386 Y138.973 E.33535
G3 X115.512 Y138.746 I.426 J-3.436 E.03378
G1 X110.254 Y133.488 E.27726
G1 X110.469 Y134.12 E.02487
G1 X110.693 Y134.574 E.01888
G1 X114.426 Y138.307 E.19691
G1 X113.924 Y138.06 E.02089
G1 X113.037 Y137.467 E.03976
G1 X112.238 Y136.766 E.03967
G1 X110.985 Y135.514 E.06605
; CHANGE_LAYER
; Z_HEIGHT: 0.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F6300
G1 X112.238 Y136.766 E-.67303
G1 X112.41 Y136.917 E-.08697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/83
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S196.35
; open powerlost recovery
M1003 S1
; OBJECT_ID: 82
M204 S10000
G17
G3 Z.6 I1.2 J-.203 P1  F42000
G1 X109.108 Y117.365 Z.6
G1 Z.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.108 Y117.082 E.00588
G1 X109.163 Y116.73 E.00738
G3 X109.73 Y116.163 I.907 J.34 E.01716
G1 X110.082 Y116.108 E.00738
G1 X145.921 Y116.108 E.7434
G1 X146.269 Y116.163 E.0073
G3 X146.837 Y116.73 I-.34 J.908 E.01717
G1 X146.892 Y117.082 E.00738
G1 X146.892 Y130.966 E.28799
G1 X146.814 Y132.16 E.02484
M73 P31 R15
G1 X146.587 Y133.301 E.02412
G1 X146.213 Y134.402 E.02412
G1 X145.699 Y135.445 E.02412
G1 X145.053 Y136.412 E.02412
G1 X144.286 Y137.286 E.02412
G1 X143.412 Y138.053 E.02412
G1 X142.445 Y138.699 E.02412
G1 X141.402 Y139.213 E.02412
G1 X140.301 Y139.587 E.02412
G1 X139.16 Y139.814 E.02412
G1 X137.966 Y139.892 E.02484
G1 X118.034 Y139.892 E.41342
G1 X116.84 Y139.814 E.02484
G1 X115.699 Y139.587 E.02412
G1 X114.598 Y139.213 E.02412
G1 X113.555 Y138.699 E.02412
G1 X112.588 Y138.053 E.02413
G1 X111.714 Y137.286 E.02412
G1 X110.947 Y136.412 E.02412
G1 X110.301 Y135.445 E.02412
G1 X109.787 Y134.402 E.02412
G1 X109.413 Y133.301 E.02412
G1 X109.186 Y132.16 E.02412
G1 X109.108 Y130.966 E.02484
G1 X109.108 Y117.425 E.28086
M204 S10000
G1 X108.684 Y117.365 F42000
G1 F14142.679
M204 S6000
G1 X108.684 Y117.048 E.00657
G1 X108.754 Y116.598 E.00945
G1 X108.941 Y116.229 E.00858
G1 X109.229 Y115.941 E.00845
G1 X109.598 Y115.754 E.00858
G1 X110.048 Y115.684 E.00945
G1 X145.955 Y115.684 E.74479
G1 X146.401 Y115.754 E.00938
G1 X146.771 Y115.941 E.00859
G1 X147.059 Y116.229 E.00845
G1 X147.246 Y116.598 E.00858
G1 X147.316 Y117.048 E.00945
G1 X147.316 Y130.98 E.28896
G1 X147.235 Y132.216 E.0257
G1 X146.998 Y133.411 E.02527
G1 X146.606 Y134.565 E.02527
G1 X146.067 Y135.658 E.02527
G1 X145.39 Y136.671 E.02528
G1 X144.587 Y137.587 E.02527
G1 X143.671 Y138.39 E.02527
G1 X142.658 Y139.067 E.02527
G1 X141.565 Y139.606 E.02528
G1 X140.411 Y139.998 E.02527
G1 X139.216 Y140.235 E.02527
G1 X137.98 Y140.316 E.0257
G1 X118.02 Y140.316 E.414
G1 X116.784 Y140.235 E.0257
G1 X115.589 Y139.998 E.02527
G1 X114.435 Y139.606 E.02527
G1 X113.342 Y139.067 E.02527
G1 X112.329 Y138.39 E.02528
G1 X111.413 Y137.587 E.02527
G1 X110.61 Y136.671 E.02527
G1 X109.933 Y135.658 E.02527
G1 X109.394 Y134.565 E.02528
G1 X109.002 Y133.411 E.02527
G1 X108.765 Y132.216 E.02527
G1 X108.684 Y130.98 E.0257
G1 X108.684 Y117.425 E.28115
M204 S10000
G1 X108.274 Y117.365 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1440
M204 S5000
G1 X108.274 Y117.016 E.00672
G1 X108.36 Y116.471 E.01064
G1 X108.606 Y115.986 E.01048
G1 X108.986 Y115.606 E.01038
G1 X109.471 Y115.36 E.01048
G1 X110.016 Y115.274 E.01064
G1 X145.99 Y115.275 E.69342
G1 X146.529 Y115.36 E.01051
G1 X147.014 Y115.606 E.01048
G1 X147.394 Y115.986 E.01038
G1 X147.64 Y116.471 E.01048
G1 X147.726 Y117.016 E.01064
G1 X147.726 Y130.993 E.26941
G1 X147.642 Y132.269 E.02466
G1 X147.394 Y133.517 E.02452
G1 X146.985 Y134.722 E.02452
G1 X146.422 Y135.863 E.02452
G1 X145.716 Y136.92 E.02452
G1 X144.877 Y137.877 E.02452
G1 X143.92 Y138.716 E.02452
G1 X142.863 Y139.422 E.02452
G1 X141.722 Y139.985 E.02452
G1 X140.517 Y140.394 E.02452
G1 X139.269 Y140.642 E.02452
G1 X137.993 Y140.726 E.02466
G1 X118.007 Y140.726 E.38524
G1 X116.731 Y140.642 E.02466
G1 X115.483 Y140.394 E.02452
G1 X114.278 Y139.985 E.02452
G1 X113.137 Y139.422 E.02452
G1 X112.08 Y138.716 E.02452
G1 X111.123 Y137.877 E.02452
G1 X110.284 Y136.92 E.02452
G1 X109.578 Y135.863 E.02452
G1 X109.015 Y134.722 E.02452
G1 X108.606 Y133.517 E.02452
G1 X108.358 Y132.269 E.02452
G1 X108.274 Y130.993 E.02466
G1 X108.274 Y117.425 E.26153
; WIPE_START
M204 S6000
G1 X108.274 Y117.016 E-.15531
G1 X108.36 Y116.471 E-.20977
G1 X108.606 Y115.986 E-.20653
G1 X108.956 Y115.636 E-.18839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.72
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.965 Y116.299 F42000
G1 Z.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421262
G1 F15170.287
M204 S6000
G1 X109.573 Y116.691 E.01074
G1 X109.498 Y116.839 E.00319
G2 X109.456 Y117.368 I1.658 J.4 E.01031
G1 X110.368 Y116.456 E.02494
G1 X110.927 Y116.456 E.01082
G1 X109.456 Y117.927 E.04024
G1 X109.456 Y118.486 E.01082
G1 X111.486 Y116.456 E.05554
G1 X112.046 Y116.456 E.01082
G1 X109.456 Y119.046 E.07083
G1 X109.456 Y119.605 E.01082
G1 X112.605 Y116.456 E.08613
G1 X113.164 Y116.456 E.01082
G1 X109.456 Y120.164 E.10142
G1 X109.456 Y120.724 E.01082
G1 X113.724 Y116.456 E.11672
G1 X114.283 Y116.456 E.01082
G1 X109.456 Y121.283 E.13202
G1 X109.456 Y121.842 E.01082
G1 X114.842 Y116.456 E.14731
G1 X115.402 Y116.456 E.01082
G1 X109.456 Y122.402 E.16261
G1 X109.456 Y122.961 E.01082
G1 X115.961 Y116.456 E.17791
G1 X116.52 Y116.456 E.01082
G1 X109.456 Y123.52 E.1932
G1 X109.456 Y124.08 E.01082
G1 X117.08 Y116.456 E.2085
G1 X117.639 Y116.456 E.01082
G1 X109.456 Y124.639 E.22379
G1 X109.456 Y125.198 E.01082
G1 X118.198 Y116.456 E.23909
G1 X118.758 Y116.456 E.01082
G1 X109.456 Y125.758 E.25439
G1 X109.456 Y126.317 E.01082
G1 X119.317 Y116.456 E.26968
G1 X119.876 Y116.456 E.01082
G1 X109.456 Y126.876 E.28498
G1 X109.456 Y127.436 E.01082
G1 X120.436 Y116.456 E.30028
G1 X120.995 Y116.456 E.01082
G1 X109.456 Y127.995 E.31557
G1 X109.456 Y128.554 E.01082
G1 X121.554 Y116.456 E.33087
G1 X122.114 Y116.456 E.01082
G1 X109.456 Y129.114 E.34617
G1 X109.456 Y129.673 E.01082
G1 X122.673 Y116.456 E.36146
G1 X123.232 Y116.456 E.01082
G1 X109.456 Y130.232 E.37676
G1 X109.456 Y130.792 E.01082
G1 X123.792 Y116.456 E.39205
G1 X124.351 Y116.456 E.01082
G1 X109.48 Y131.327 E.40668
G1 X109.514 Y131.852 E.01017
G1 X124.91 Y116.456 E.42104
G1 X125.47 Y116.456 E.01082
G1 X109.578 Y132.347 E.4346
G1 X109.671 Y132.814 E.0092
G1 X126.029 Y116.456 E.44736
G1 X126.588 Y116.456 E.01082
G1 X109.771 Y133.273 E.45991
G1 X109.913 Y133.691 E.00853
G1 X127.148 Y116.456 E.47133
G1 X127.707 Y116.456 E.01082
G1 X110.054 Y134.108 E.48275
G2 X110.223 Y134.499 I1.568 J-.443 E.00826
G1 X128.266 Y116.456 E.49345
G1 X128.826 Y116.456 E.01082
G1 X110.407 Y134.874 E.50369
G1 X110.592 Y135.249 E.00808
G1 X129.385 Y116.456 E.51394
G1 X129.944 Y116.456 E.01082
G1 X110.814 Y135.586 E.52317
G1 X111.038 Y135.922 E.0078
G1 X130.504 Y116.456 E.53234
G1 X131.063 Y116.456 E.01082
G1 X111.268 Y136.251 E.54134
G1 X111.53 Y136.549 E.00766
G1 X131.622 Y116.456 E.54949
G1 X132.182 Y116.456 E.01082
G1 X111.791 Y136.847 E.55763
G2 X112.065 Y137.132 I1.22 J-.899 E.00767
G1 X132.741 Y116.456 E.56543
G1 X133.3 Y116.456 E.01082
G1 X112.363 Y137.393 E.57258
G1 X112.661 Y137.654 E.00766
G1 X133.86 Y116.456 E.57973
G1 X134.419 Y116.456 E.01082
G1 X112.979 Y137.896 E.58633
G1 X113.314 Y138.12 E.0078
G1 X134.979 Y116.456 E.59245
G1 X135.538 Y116.456 E.01082
G1 X113.65 Y138.344 E.59858
G2 X114.015 Y138.538 I.919 J-1.289 E.00802
G1 X136.097 Y116.456 E.60389
G1 X136.657 Y116.456 E.01082
G1 X114.39 Y138.723 E.60894
G2 X114.768 Y138.904 I.876 J-1.346 E.00813
M73 P32 R15
G1 X137.216 Y116.456 E.61389
G1 X137.775 Y116.456 E.01082
G1 X115.185 Y139.045 E.61777
G1 X115.603 Y139.187 E.00853
G1 X138.335 Y116.456 E.62164
G1 X138.894 Y116.456 E.01082
G1 X116.048 Y139.302 E.62478
G1 X116.514 Y139.395 E.0092
G1 X139.453 Y116.456 E.62732
G1 X140.013 Y116.456 E.01082
G1 X116.993 Y139.475 E.62953
G1 X117.518 Y139.51 E.01017
G1 X140.572 Y116.456 E.63047
G1 X141.131 Y116.456 E.01082
G1 X118.043 Y139.544 E.63141
G2 X118.602 Y139.544 I.281 J-4.427 E.01082
G1 X141.691 Y116.456 E.63141
G1 X142.25 Y116.456 E.01082
G1 X119.161 Y139.544 E.63141
G1 X119.72 Y139.544 E.01082
G1 X142.809 Y116.456 E.63141
G1 X143.369 Y116.456 E.01082
G1 X120.28 Y139.544 E.63141
G1 X120.839 Y139.544 E.01082
G1 X143.928 Y116.456 E.63141
G1 X144.487 Y116.456 E.01082
G1 X121.399 Y139.544 E.63141
G1 X121.958 Y139.544 E.01082
G1 X145.047 Y116.456 E.63141
G1 X145.606 Y116.456 E.01082
G1 X122.517 Y139.544 E.63141
G1 X123.077 Y139.544 E.01082
G1 X146.128 Y116.493 E.6304
G1 X146.161 Y116.498 E.00064
G3 X146.448 Y116.732 I-.192 J.529 E.0073
G1 X123.636 Y139.544 E.62385
G1 X124.195 Y139.544 E.01082
G1 X146.544 Y117.195 E.61119
G1 X146.544 Y117.755 E.01082
G1 X124.755 Y139.544 E.59589
G1 X125.314 Y139.544 E.01082
G1 X146.544 Y118.314 E.5806
G1 X146.544 Y118.873 E.01082
G1 X125.873 Y139.544 E.5653
G1 X126.433 Y139.544 E.01082
G1 X146.544 Y119.433 E.55
G1 X146.544 Y119.992 E.01082
G1 X126.992 Y139.544 E.53471
G1 X127.551 Y139.544 E.01082
G1 X146.544 Y120.551 E.51941
G1 X146.544 Y121.111 E.01082
G1 X128.111 Y139.544 E.50411
G1 X128.67 Y139.544 E.01082
G1 X146.544 Y121.67 E.48882
G1 X146.544 Y122.229 E.01082
G1 X129.229 Y139.544 E.47352
G1 X129.789 Y139.544 E.01082
G1 X146.544 Y122.789 E.45823
G1 X146.544 Y123.348 E.01082
G1 X130.348 Y139.544 E.44293
G1 X130.907 Y139.544 E.01082
G1 X146.544 Y123.907 E.42763
G1 X146.544 Y124.467 E.01082
G1 X131.467 Y139.544 E.41234
G1 X132.026 Y139.544 E.01082
G1 X146.544 Y125.026 E.39704
G1 X146.544 Y125.585 E.01082
G1 X132.585 Y139.544 E.38174
G1 X133.145 Y139.544 E.01082
G1 X146.544 Y126.145 E.36645
G1 X146.544 Y126.704 E.01082
G1 X133.704 Y139.544 E.35115
G1 X134.263 Y139.544 E.01082
G1 X146.544 Y127.263 E.33586
G1 X146.544 Y127.823 E.01082
G1 X134.823 Y139.544 E.32056
G1 X135.382 Y139.544 E.01082
G1 X146.544 Y128.382 E.30526
G1 X146.544 Y128.941 E.01082
G1 X135.941 Y139.544 E.28997
G1 X136.501 Y139.544 E.01082
G1 X146.544 Y129.501 E.27467
G1 X146.544 Y130.06 E.01082
G1 X137.06 Y139.544 E.25937
G1 X137.619 Y139.544 E.01082
G1 X146.544 Y130.619 E.24408
G3 X146.529 Y131.194 I-4.394 J.168 E.01113
G1 X138.194 Y139.529 E.22792
G1 X138.793 Y139.489 E.0116
G1 X146.489 Y131.793 E.21048
G3 X146.404 Y132.437 I-2.491 J-.002 E.01261
G1 X139.437 Y139.404 E.19052
G1 X140.136 Y139.265 E.01377
G1 X146.265 Y133.136 E.16763
G1 X145.994 Y133.966 E.0169
G1 X140.966 Y138.994 E.13748
G1 X141.269 Y138.891 E.00617
G1 X141.978 Y138.541 E.01531
G1 X145.541 Y134.978 E.09743
G1 X145.397 Y135.271 E.0063
G1 X144.776 Y136.2 E.0216
G1 X144.042 Y137.037 E.02153
G1 X142.867 Y138.212 E.03214
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15170.287
G1 X144.042 Y137.037 E-.63165
G1 X144.265 Y136.783 E-.12835
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/83
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S198.9
; OBJECT_ID: 82
M204 S10000
G17
G3 Z.72 I.588 J-1.066 P1  F42000
G1 X109.076 Y117.381 Z.72
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.076 Y117.068 E.00648
G3 X109.409 Y116.3 I1.049 J-.002 E.01787
G3 X110.068 Y116.076 I.643 J.808 E.01475
G1 X145.932 Y116.076 E.74389
G1 X146.119 Y116.1 E.00393
G3 X146.9 Y116.881 I-.101 J.882 E.0247
G1 X146.924 Y117.068 E.00393
G1 X146.924 Y130.966 E.28826
G1 X146.846 Y132.165 E.02492
G1 X146.618 Y133.309 E.02421
G1 X146.243 Y134.414 E.02421
G1 X145.727 Y135.461 E.02421
G1 X145.078 Y136.431 E.02421
G1 X144.309 Y137.309 E.02421
G1 X143.431 Y138.078 E.02421
G1 X142.461 Y138.727 E.02421
G1 X141.414 Y139.243 E.02421
G1 X140.309 Y139.618 E.02421
G1 X139.165 Y139.846 E.02421
G1 X137.966 Y139.924 E.02492
G1 X118.034 Y139.924 E.41342
G1 X116.835 Y139.846 E.02492
G1 X115.691 Y139.618 E.02421
G1 X114.586 Y139.243 E.02421
G1 X113.539 Y138.727 E.02421
G1 X112.569 Y138.078 E.02421
G1 X111.691 Y137.309 E.02421
G1 X110.922 Y136.431 E.02421
G1 X110.273 Y135.461 E.02421
G1 X109.757 Y134.414 E.02421
G1 X109.382 Y133.309 E.02421
G1 X109.154 Y132.165 E.02421
G1 X109.076 Y130.966 E.02492
G1 X109.076 Y117.441 E.28054
M204 S10000
G1 X108.651 Y117.381 F42000
G1 F14142.679
M204 S6000
G1 X108.651 Y117.041 E.00706
G3 X108.981 Y116.128 I1.457 J.01 E.02051
G3 X109.82 Y115.68 I1.009 J.881 E.02017
G1 X110.041 Y115.651 E.00462
G1 X145.959 Y115.651 E.74504
G1 X146.18 Y115.68 E.00462
G3 X147.32 Y116.82 I-.162 J1.301 E.036
G1 X147.349 Y117.041 E.00462
G1 X147.349 Y130.98 E.28913
G1 X147.267 Y132.22 E.02579
G1 X147.029 Y133.419 E.02536
G1 X146.636 Y134.577 E.02536
G1 X146.095 Y135.674 E.02536
G1 X145.416 Y136.69 E.02536
G1 X144.61 Y137.61 E.02536
G1 X143.69 Y138.416 E.02536
G1 X142.674 Y139.095 E.02536
G1 X141.577 Y139.636 E.02536
G1 X140.419 Y140.029 E.02536
G1 X139.22 Y140.267 E.02536
G1 X137.98 Y140.349 E.02579
G1 X118.02 Y140.349 E.414
G1 X116.78 Y140.267 E.02579
G1 X115.581 Y140.029 E.02536
G1 X114.423 Y139.636 E.02536
G1 X113.326 Y139.095 E.02536
G1 X112.31 Y138.416 E.02536
G1 X111.39 Y137.61 E.02536
G1 X110.584 Y136.69 E.02536
G1 X109.905 Y135.674 E.02536
G1 X109.364 Y134.577 E.02536
G1 X108.971 Y133.419 E.02536
G1 X108.733 Y132.22 E.02536
G1 X108.651 Y130.98 E.02579
G1 X108.651 Y117.441 E.28083
M204 S10000
G1 X108.242 Y117.381 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.242 Y117.014 E.00707
G3 X108.317 Y116.501 I9.833 J1.166 E.00998
G1 X108.396 Y116.309 E.00401
G1 F11160
G3 X108.532 Y116.04 I5.26 J2.493 E.00581
G1 F12000
G1 X108.66 Y115.874 E.00405
G1 F11160
G3 X108.874 Y115.66 I3.222 J3.008 E.00582
G1 F12000
G1 X109.04 Y115.532 E.00405
G1 F11160
G3 X109.309 Y115.396 I2.766 J5.131 E.00581
G1 F12000
G1 X109.501 Y115.317 E.00401
G3 X109.761 Y115.275 I.285 J.96 E.00508
G1 X110.014 Y115.242 E.00491
G1 X145.986 Y115.242 E.69339
G1 X146.239 Y115.275 E.00491
G3 X146.691 Y115.396 I-.025 J1.001 E.0091
G1 F11160
G3 X146.96 Y115.532 I-2.494 J5.262 E.00581
G1 F12000
G1 X147.126 Y115.66 E.00405
G1 F11160
G3 X147.34 Y115.874 I-3.008 J3.222 E.00582
G1 F12000
G1 X147.468 Y116.04 E.00405
G1 F11160
G3 X147.604 Y116.309 I-5.124 J2.762 E.00581
G1 F12000
G1 X147.683 Y116.501 E.00401
G3 X147.725 Y116.761 I-.96 J.285 E.00508
G1 X147.758 Y117.014 E.00491
G1 X147.758 Y130.993 E.26946
G1 X147.674 Y132.274 E.02474
G1 X147.425 Y133.525 E.0246
G1 X147.015 Y134.734 E.0246
G1 X146.45 Y135.879 E.0246
G1 X145.741 Y136.94 E.0246
G1 X144.9 Y137.9 E.0246
G1 X143.94 Y138.741 E.0246
G1 X142.879 Y139.45 E.0246
G1 X141.734 Y140.015 E.0246
G1 X140.525 Y140.425 E.0246
G1 X139.274 Y140.674 E.0246
G1 X137.993 Y140.758 E.02474
G1 X118.007 Y140.758 E.38524
G1 X116.726 Y140.674 E.02474
G1 X115.475 Y140.425 E.0246
G1 X114.266 Y140.015 E.0246
G1 X113.121 Y139.45 E.0246
G1 X112.06 Y138.741 E.0246
G1 X111.1 Y137.9 E.0246
G1 X110.259 Y136.94 E.0246
G1 X109.55 Y135.879 E.0246
G1 X108.985 Y134.734 E.0246
G1 X108.575 Y133.525 E.0246
G1 X108.326 Y132.274 E.0246
G1 X108.242 Y130.993 E.02474
G1 X108.242 Y117.441 E.26123
; WIPE_START
M204 S6000
G1 X108.242 Y117.014 E-.16227
G1 X108.317 Y116.501 E-.19672
G1 X108.396 Y116.309 E-.07909
G1 X108.532 Y116.04 E-.1145
G1 X108.66 Y115.874 E-.07982
G1 X108.874 Y115.66 E-.11478
G1 X108.9 Y115.64 E-.01282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.84
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.761 Y135.884 F42000
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422022
G1 F15141.192
M204 S6000
G1 X111.949 Y137.073 E.03256
G1 X112.781 Y137.802 E.02143
G1 X113.713 Y138.425 E.02172
G1 X114.007 Y138.57 E.00634
G1 X110.43 Y134.993 E.09799
G1 X110.079 Y134.281 E.01539
G1 X109.977 Y133.979 E.00617
G1 X115.021 Y139.023 E.13821
G1 X115.854 Y139.296 E.01698
G1 X109.704 Y133.146 E.1685
G1 X109.565 Y132.447 E.01382
G1 X116.553 Y139.435 E.19148
G2 X117.2 Y139.521 I.65 J-2.412 E.01267
G1 X109.479 Y131.8 E.21155
G1 X109.44 Y131.2 E.01164
G1 X117.8 Y139.56 E.22906
G2 X118.376 Y139.577 I.411 J-4.391 E.01118
G1 X109.423 Y130.624 E.2453
G1 X109.423 Y130.064 E.01086
G1 X118.936 Y139.577 E.26065
M73 P33 R15
G1 X119.497 Y139.577 E.01086
G1 X109.423 Y129.503 E.27601
G1 X109.423 Y128.943 E.01086
G1 X120.057 Y139.577 E.29136
G1 X120.618 Y139.577 E.01086
G1 X109.423 Y128.382 E.30672
G1 X109.423 Y127.822 E.01086
G1 X121.178 Y139.577 E.32207
G1 X121.739 Y139.577 E.01086
G1 X109.423 Y127.261 E.33743
G1 X109.423 Y126.701 E.01086
G1 X122.299 Y139.577 E.35278
G1 X122.859 Y139.577 E.01086
G1 X109.423 Y126.141 E.36814
G1 X109.423 Y125.58 E.01086
G1 X123.42 Y139.577 E.38349
G1 X123.98 Y139.577 E.01086
G1 X109.423 Y125.02 E.39885
G1 X109.423 Y124.459 E.01086
G1 X124.541 Y139.577 E.4142
G1 X125.101 Y139.577 E.01086
G1 X109.423 Y123.899 E.42956
G1 X109.423 Y123.339 E.01086
G1 X125.661 Y139.577 E.44492
G1 X126.222 Y139.577 E.01086
G1 X109.423 Y122.778 E.46027
G1 X109.423 Y122.218 E.01086
G1 X126.782 Y139.577 E.47563
G1 X127.343 Y139.577 E.01086
G1 X109.423 Y121.657 E.49098
G1 X109.423 Y121.097 E.01086
G1 X127.903 Y139.577 E.50634
G1 X128.463 Y139.577 E.01086
G1 X109.423 Y120.537 E.52169
G1 X109.423 Y119.976 E.01086
G1 X129.024 Y139.577 E.53705
G1 X129.584 Y139.577 E.01086
G1 X109.423 Y119.416 E.5524
G1 X109.423 Y118.855 E.01086
G1 X130.145 Y139.577 E.56776
G1 X130.705 Y139.577 E.01086
G1 X109.423 Y118.295 E.58311
G1 X109.423 Y117.735 E.01086
G1 X131.265 Y139.577 E.59847
G1 X131.826 Y139.577 E.01086
G1 X109.423 Y117.174 E.61382
G3 X109.462 Y116.822 I1.245 J-.04 E.00689
G3 X109.522 Y116.713 I.382 J.139 E.00243
G1 X132.386 Y139.577 E.62647
G1 X132.947 Y139.577 E.01086
G1 X109.831 Y116.461 E.63336
G3 X110.354 Y116.423 I.392 J1.802 E.01019
G1 X133.507 Y139.577 E.63439
G1 X134.068 Y139.577 E.01086
G1 X110.915 Y116.423 E.63439
G1 X111.475 Y116.423 E.01086
G1 X134.628 Y139.577 E.63439
G1 X135.188 Y139.577 E.01086
G1 X112.035 Y116.423 E.63439
G1 X112.596 Y116.423 E.01086
G1 X135.749 Y139.577 E.63439
G1 X136.309 Y139.577 E.01086
G1 X113.156 Y116.423 E.63439
G1 X113.717 Y116.423 E.01086
G1 X136.87 Y139.577 E.63439
G1 X137.43 Y139.577 E.01086
G1 X114.277 Y116.423 E.63439
G1 X114.837 Y116.423 E.01086
G1 X137.988 Y139.574 E.63433
G1 X138.514 Y139.54 E.01021
G1 X115.398 Y116.423 E.63338
G1 X115.958 Y116.423 E.01086
G1 X139.04 Y139.505 E.63244
G2 X139.516 Y139.421 I-.081 J-1.85 E.0094
G1 X116.519 Y116.423 E.63013
G1 X117.079 Y116.423 E.01086
G1 X139.984 Y139.328 E.62758
G2 X140.427 Y139.211 I-.224 J-1.742 E.00891
G1 X117.639 Y116.423 E.62437
G1 X118.2 Y116.423 E.01086
G1 X140.845 Y139.069 E.62048
G1 X141.264 Y138.927 E.00856
G1 X118.76 Y116.423 E.61659
G1 X119.321 Y116.423 E.01086
G1 X141.641 Y138.743 E.61156
G1 X142.016 Y138.558 E.00811
G1 X119.881 Y116.423 E.60649
G1 X120.441 Y116.423 E.01086
G1 X142.38 Y138.362 E.60112
G1 X142.716 Y138.138 E.00783
G1 X121.002 Y116.423 E.59497
M73 P33 R14
G1 X121.562 Y116.423 E.01086
G1 X143.052 Y137.913 E.58882
G2 X143.369 Y137.67 I-.766 J-1.326 E.00777
G1 X122.123 Y116.423 E.58215
G1 X122.683 Y116.423 E.01086
G1 X143.668 Y137.408 E.57498
G1 X143.967 Y137.146 E.00769
G1 X123.244 Y116.423 E.56781
G1 X123.804 Y116.423 E.01086
G1 X144.24 Y136.86 E.55995
G1 X144.502 Y136.561 E.00769
G1 X124.364 Y116.423 E.55177
G1 X124.925 Y116.423 E.01086
G1 X144.764 Y136.263 E.54359
G2 X144.994 Y135.932 I-1.14 J-1.038 E.00782
G1 X125.485 Y116.423 E.53453
G1 X126.046 Y116.423 E.01086
G1 X145.218 Y135.596 E.52533
G2 X145.44 Y135.257 I-1.174 J-1.008 E.00787
G1 X126.606 Y116.423 E.51604
G1 X127.166 Y116.423 E.01086
G1 X145.625 Y134.882 E.50575
G1 X145.81 Y134.506 E.00811
G1 X127.727 Y116.423 E.49547
G1 X128.287 Y116.423 E.01086
G1 X145.978 Y134.114 E.48471
G1 X146.12 Y133.695 E.00856
G1 X128.848 Y116.423 E.47325
G1 X129.408 Y116.423 E.01086
G1 X146.262 Y133.277 E.46179
G2 X146.361 Y132.816 I-1.701 J-.61 E.00916
G1 X129.968 Y116.423 E.44916
G1 X130.529 Y116.423 E.01086
G1 X146.454 Y132.349 E.43636
G2 X146.518 Y131.852 I-1.857 J-.489 E.00974
G1 X131.089 Y116.423 E.42274
G1 X131.65 Y116.423 E.01086
G1 X146.552 Y131.326 E.40832
G2 X146.577 Y130.79 I-4.077 J-.454 E.0104
G1 X132.21 Y116.423 E.39364
G1 X132.771 Y116.423 E.01086
G1 X146.577 Y130.229 E.37828
G1 X146.577 Y129.669 E.01086
G1 X133.331 Y116.423 E.36293
G1 X133.891 Y116.423 E.01086
G1 X146.577 Y129.109 E.34757
G1 X146.577 Y128.548 E.01086
G1 X134.452 Y116.423 E.33222
G1 X135.012 Y116.423 E.01086
G1 X146.577 Y127.988 E.31686
G1 X146.577 Y127.427 E.01086
G1 X135.573 Y116.423 E.30151
G1 X136.133 Y116.423 E.01086
G1 X146.577 Y126.867 E.28615
G1 X146.577 Y126.307 E.01086
G1 X136.693 Y116.423 E.2708
G1 X137.254 Y116.423 E.01086
G1 X146.577 Y125.746 E.25544
G1 X146.577 Y125.186 E.01086
G1 X137.814 Y116.423 E.24009
G1 X138.375 Y116.423 E.01086
G1 X146.577 Y124.625 E.22473
G1 X146.577 Y124.065 E.01086
G1 X138.935 Y116.423 E.20938
G1 X139.495 Y116.423 E.01086
G1 X146.577 Y123.505 E.19402
M73 P34 R14
G1 X146.577 Y122.944 E.01086
G1 X140.056 Y116.423 E.17866
G1 X140.616 Y116.423 E.01086
G1 X146.577 Y122.384 E.16331
G1 X146.577 Y121.823 E.01086
G1 X141.177 Y116.423 E.14795
G1 X141.737 Y116.423 E.01086
G1 X146.577 Y121.263 E.1326
G1 X146.577 Y120.702 E.01086
G1 X142.297 Y116.423 E.11724
G1 X142.858 Y116.423 E.01086
G1 X146.577 Y120.142 E.10189
G1 X146.577 Y119.582 E.01086
G1 X143.418 Y116.423 E.08653
G1 X143.979 Y116.423 E.01086
G1 X146.577 Y119.021 E.07118
G1 X146.577 Y118.461 E.01086
G1 X144.539 Y116.423 E.05582
G1 X145.1 Y116.423 E.01086
G1 X146.577 Y117.9 E.04047
G1 X146.577 Y117.34 E.01086
G1 X145.66 Y116.423 E.02511
G1 X145.909 Y116.423 E.00482
G3 X146.312 Y116.528 I-.016 J.893 E.00815
G3 X146.733 Y116.936 I-3.585 J4.12 E.01137
; CHANGE_LAYER
; Z_HEIGHT: 0.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15141.192
G1 X146.312 Y116.528 E-.22291
G1 X146.167 Y116.46 E-.06066
G1 X145.909 Y116.423 E-.09933
G1 X145.66 Y116.423 E-.09452
G1 X146.186 Y116.949 E-.28258
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/83
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z.84 I-.015 J-1.217 P1  F42000
G1 X109.043 Y117.397 Z.84
G1 Z.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.043 Y117.068 E.00682
G3 X109.33 Y116.33 I1.114 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.0243
G1 X145.755 Y135.477 E.02429
G1 X145.104 Y136.451 E.0243
G1 X144.332 Y137.332 E.02429
G1 X143.451 Y138.104 E.02429
G1 X142.477 Y138.755 E.0243
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.02429
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.0243
G1 X111.668 Y137.332 E.02429
G1 X110.896 Y136.451 E.02429
G1 X110.245 Y135.477 E.0243
G1 X109.727 Y134.427 E.02429
G1 X109.351 Y133.318 E.0243
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.457 E.2802
M204 S10000
G1 X108.619 Y117.397 F42000
G1 F14142.679
M204 S6000
G1 X108.619 Y117.041 E.00739
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02587
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02587
G1 X108.619 Y117.457 E.28049
M204 S10000
G1 X108.21 Y117.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.00739
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.732 Y115.74 E.00889
G1 F11160
G1 X108.74 Y115.732 E.00022
G1 F12000
G1 X109.106 Y115.451 E.00889
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.463 Y115.273 E.00927
G1 X146.894 Y115.451 E.009
G1 X147.26 Y115.732 E.00889
G1 F11160
G1 X147.268 Y115.74 E.00022
G1 F12000
G1 X147.549 Y116.106 E.00889
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02469
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02469
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.457 E.26091
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.16847
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.732 Y115.74 E-.17516
G1 X108.74 Y115.732 E-.00441
G1 X108.849 Y115.649 E-.05189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.96
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z0.96 F4000
            G39.3 S1
            G0 Z0.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.214 Y117.503 F42000
G1 Z.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422692
G1 F15115.635
M204 S6000
G1 X110.326 Y116.391 E.03052
G1 X110.887 Y116.391 E.01089
G1 X109.391 Y117.887 E.04105
G1 X109.391 Y118.448 E.01089
G1 X111.449 Y116.391 E.05646
G1 X112.01 Y116.391 E.01089
G1 X109.391 Y119.01 E.07187
G1 X109.391 Y119.571 E.01089
G1 X112.571 Y116.391 E.08728
G1 X113.133 Y116.391 E.01089
G1 X109.391 Y120.133 E.10268
G1 X109.391 Y120.694 E.01089
G1 X113.694 Y116.391 E.11809
G1 X114.255 Y116.391 E.01089
G1 X109.391 Y121.255 E.1335
G1 X109.391 Y121.817 E.01089
G1 X114.817 Y116.391 E.1489
G1 X115.378 Y116.391 E.01089
G1 X109.391 Y122.378 E.16431
G1 X109.391 Y122.939 E.01089
G1 X115.939 Y116.391 E.17972
G1 X116.501 Y116.391 E.01089
G1 X109.391 Y123.501 E.19513
G1 X109.391 Y124.062 E.01089
G1 X117.062 Y116.391 E.21053
G1 X117.623 Y116.391 E.01089
G1 X109.391 Y124.623 E.22594
G1 X109.391 Y125.185 E.01089
G1 X118.185 Y116.391 E.24135
G1 X118.746 Y116.391 E.01089
G1 X109.391 Y125.746 E.25675
G1 X109.391 Y126.308 E.01089
G1 X119.308 Y116.391 E.27216
G1 X119.869 Y116.391 E.01089
G1 X109.391 Y126.869 E.28757
G1 X109.391 Y127.43 E.01089
G1 X120.43 Y116.391 E.30298
G1 X120.992 Y116.391 E.01089
G1 X109.391 Y127.992 E.31838
G1 X109.391 Y128.553 E.01089
G1 X121.553 Y116.391 E.33379
G1 X122.114 Y116.391 E.01089
G1 X109.391 Y129.114 E.3492
G1 X109.391 Y129.676 E.01089
G1 X122.676 Y116.391 E.3646
G1 X123.237 Y116.391 E.01089
G1 X109.391 Y130.237 E.38001
G1 X109.391 Y130.798 E.01089
G1 X123.798 Y116.391 E.39542
G1 X124.36 Y116.391 E.01089
G1 X109.416 Y131.335 E.41014
G1 X109.451 Y131.862 E.01025
G1 X124.921 Y116.391 E.4246
G1 X125.482 Y116.391 E.01089
G1 X109.515 Y132.359 E.43825
G1 X109.608 Y132.827 E.00926
G1 X126.044 Y116.391 E.4511
G1 X126.605 Y116.391 E.01089
G1 X109.708 Y133.288 E.46375
G1 X109.851 Y133.707 E.00859
G1 X127.167 Y116.391 E.47526
G1 X127.728 Y116.391 E.01089
G1 X109.993 Y134.126 E.48676
G2 X110.161 Y134.52 I1.576 J-.442 E.00832
G1 X128.289 Y116.391 E.49755
G1 X128.851 Y116.391 E.01089
G1 X110.346 Y134.896 E.50787
G1 X110.532 Y135.271 E.00814
G1 X129.412 Y116.391 E.51819
G1 X129.973 Y116.391 E.01089
G1 X110.753 Y135.611 E.52751
G1 X110.978 Y135.948 E.00785
G1 X130.535 Y116.391 E.53675
G1 X131.096 Y116.391 E.01089
G1 X111.208 Y136.279 E.54585
G1 X111.47 Y136.578 E.00772
G1 X131.657 Y116.391 E.55405
G1 X132.219 Y116.391 E.01089
G1 X111.733 Y136.877 E.56226
G2 X112.006 Y137.165 I1.23 J-.895 E.00773
G1 X132.78 Y116.391 E.57016
G1 X133.341 Y116.391 E.01089
G1 X112.305 Y137.428 E.57736
G1 X112.604 Y137.69 E.00772
G1 X133.903 Y116.391 E.58456
G1 X134.464 Y116.391 E.01089
G1 X112.921 Y137.934 E.59127
G1 X113.258 Y138.159 E.00785
G1 X135.026 Y116.391 E.59744
G1 X135.587 Y116.391 E.01089
G1 X113.594 Y138.384 E.60361
G2 X113.958 Y138.581 I.932 J-1.283 E.00806
G1 X136.148 Y116.391 E.60903
G1 X136.71 Y116.391 E.01089
G1 X114.334 Y138.767 E.61412
G1 X114.71 Y138.952 E.00814
G1 X137.271 Y116.391 E.6192
G1 X137.832 Y116.391 E.01089
G1 X115.13 Y139.094 E.6231
G1 X115.549 Y139.236 E.00859
G1 X138.394 Y116.391 E.62701
G1 X138.955 Y116.391 E.01089
G1 X115.991 Y139.356 E.63029
G1 X116.459 Y139.449 E.00926
G1 X139.516 Y116.391 E.63284
G1 X140.078 Y116.391 E.01089
G1 X116.933 Y139.536 E.63522
G1 X117.46 Y139.57 E.01025
G1 X140.639 Y116.391 E.63617
G1 X141.2 Y116.391 E.01089
G1 X117.987 Y139.605 E.63712
G2 X118.544 Y139.609 I.308 J-4.258 E.01083
G1 X141.762 Y116.391 E.63723
G1 X142.323 Y116.391 E.01089
G1 X119.106 Y139.609 E.63723
G1 X119.667 Y139.609 E.01089
G1 X142.885 Y116.391 E.63723
G1 X143.446 Y116.391 E.01089
G1 X120.229 Y139.609 E.63723
G1 X120.79 Y139.609 E.01089
G1 X144.007 Y116.391 E.63723
G1 X144.569 Y116.391 E.01089
G1 X121.351 Y139.609 E.63723
G1 X121.913 Y139.609 E.01089
G1 X145.13 Y116.391 E.63723
M73 P35 R14
G1 X145.691 Y116.391 E.01089
G1 X122.474 Y139.609 E.63723
G1 X123.035 Y139.609 E.01089
G1 X146.201 Y116.443 E.63581
G3 X146.511 Y116.694 I-.222 J.591 E.00788
G1 X123.597 Y139.609 E.62891
G1 X124.158 Y139.609 E.01089
G1 X146.609 Y117.158 E.61618
G1 X146.609 Y117.719 E.01089
G1 X124.719 Y139.609 E.60077
G1 X125.281 Y139.609 E.01089
G1 X146.609 Y118.281 E.58537
G1 X146.609 Y118.842 E.01089
G1 X125.842 Y139.609 E.56996
G1 X126.404 Y139.609 E.01089
G1 X146.609 Y119.404 E.55455
G1 X146.609 Y119.965 E.01089
G1 X126.965 Y139.609 E.53915
G1 X127.526 Y139.609 E.01089
G1 X146.609 Y120.526 E.52374
G1 X146.609 Y121.088 E.01089
G1 X128.088 Y139.609 E.50833
G1 X128.649 Y139.609 E.01089
G1 X146.609 Y121.649 E.49292
G1 X146.609 Y122.21 E.01089
G1 X129.21 Y139.609 E.47752
G1 X129.772 Y139.609 E.01089
G1 X146.609 Y122.772 E.46211
G1 X146.609 Y123.333 E.01089
G1 X130.333 Y139.609 E.4467
G1 X130.894 Y139.609 E.01089
G1 X146.609 Y123.894 E.4313
G1 X146.609 Y124.456 E.01089
G1 X131.456 Y139.609 E.41589
G1 X132.017 Y139.609 E.01089
G1 X146.609 Y125.017 E.40048
G1 X146.609 Y125.578 E.01089
G1 X132.578 Y139.609 E.38507
G1 X133.14 Y139.609 E.01089
G1 X146.609 Y126.14 E.36967
G1 X146.609 Y126.701 E.01089
G1 X133.701 Y139.609 E.35426
G1 X134.263 Y139.609 E.01089
G1 X146.609 Y127.263 E.33885
G1 X146.609 Y127.824 E.01089
G1 X134.824 Y139.609 E.32345
G1 X135.385 Y139.609 E.01089
G1 X146.609 Y128.385 E.30804
G1 X146.609 Y128.947 E.01089
G1 X135.947 Y139.609 E.29263
G1 X136.508 Y139.609 E.01089
G1 X146.609 Y129.508 E.27723
G1 X146.609 Y130.069 E.01089
G1 X137.069 Y139.609 E.26182
G1 X137.631 Y139.609 E.01089
G1 X146.609 Y130.631 E.24641
G3 X146.592 Y131.209 I-4.417 J.162 E.01123
G1 X138.209 Y139.592 E.23009
G1 X138.809 Y139.553 E.01168
G1 X146.553 Y131.809 E.21252
G3 X146.465 Y132.458 I-2.507 J-.007 E.01273
G1 X139.458 Y139.465 E.19233
G1 X140.159 Y139.326 E.01387
G1 X146.326 Y133.159 E.16927
G1 X146.052 Y133.994 E.01706
G1 X140.994 Y139.052 E.13883
G1 X141.293 Y138.951 E.00613
G1 X142.011 Y138.597 E.01553
G1 X145.597 Y135.011 E.09843
G1 X145.453 Y135.303 E.00632
G1 X144.827 Y136.239 E.02185
G1 X144.095 Y137.074 E.02156
G1 X142.905 Y138.264 E.03265
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15115.635
G1 X144.095 Y137.074 E-.63934
G1 X144.304 Y136.835 E-.12066
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/83
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z.96 I.587 J-1.066 P1  F42000
G1 X109.043 Y117.414 Z.96
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.043 Y117.068 E.00716
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.94 Y116.045 E.74406
G3 X146.915 Y116.755 I.019 J.999 E.02687
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.0243
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.02429
G1 X142.477 Y138.755 E.0243
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.02429
G1 X110.245 Y135.477 E.0243
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.474 E.27986
M204 S10000
G1 X108.619 Y117.414 F42000
G1 F14142.679
M204 S6000
G1 X108.619 Y117.041 E.00774
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.968 Y115.62 E.74522
G1 X146.356 Y115.671 E.00812
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.474 E.28015
M204 S10000
G1 X108.21 Y117.414 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.00771
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.994 Y115.211 E.69355
G1 X146.463 Y115.273 E.00911
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.96 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02468
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.96 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02469
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.474 E.26059
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.17475
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17738
G1 X108.835 Y115.659 E-.04779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.08
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.08 F4000
            G39.3 S1
            G0 Z1.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.095 Y138.264 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422692
G1 F15115.635
M204 S6000
G1 X111.905 Y137.074 E.03266
G1 X111.173 Y136.239 E.02155
G1 X110.547 Y135.303 E.02184
G1 X110.403 Y135.011 E.00632
G1 X113.989 Y138.597 E.09842
G1 X114.707 Y138.951 E.01552
G1 X115.006 Y139.052 E.00614
G1 X109.948 Y133.994 E.13883
G1 X109.674 Y133.159 E.01706
G1 X115.841 Y139.326 E.16927
G1 X116.542 Y139.465 E.01387
G1 X109.535 Y132.458 E.19233
G3 X109.447 Y131.809 I2.419 J-.655 E.01273
G1 X117.191 Y139.553 E.21252
G1 X117.791 Y139.592 E.01168
G1 X109.408 Y131.209 E.23009
G3 X109.391 Y130.631 I4.4 J-.416 E.01123
G1 X118.369 Y139.609 E.24641
G1 X118.931 Y139.609 E.01089
G1 X109.391 Y130.069 E.26182
G1 X109.391 Y129.508 E.01089
G1 X119.492 Y139.609 E.27722
G1 X120.053 Y139.609 E.01089
G1 X109.391 Y128.947 E.29263
G1 X109.391 Y128.385 E.01089
G1 X120.615 Y139.609 E.30804
G1 X121.176 Y139.609 E.01089
G1 X109.391 Y127.824 E.32345
G1 X109.391 Y127.263 E.01089
G1 X121.737 Y139.609 E.33885
G1 X122.299 Y139.609 E.01089
G1 X109.391 Y126.701 E.35426
G1 X109.391 Y126.14 E.01089
G1 X122.86 Y139.609 E.36967
G1 X123.422 Y139.609 E.01089
G1 X109.391 Y125.578 E.38507
G1 X109.391 Y125.017 E.01089
G1 X123.983 Y139.609 E.40048
G1 X124.544 Y139.609 E.01089
G1 X109.391 Y124.456 E.41589
G1 X109.391 Y123.894 E.01089
G1 X125.106 Y139.609 E.4313
G1 X125.667 Y139.609 E.01089
G1 X109.391 Y123.333 E.4467
G1 X109.391 Y122.772 E.01089
G1 X126.228 Y139.609 E.46211
G1 X126.79 Y139.609 E.01089
G1 X109.391 Y122.21 E.47752
G1 X109.391 Y121.649 E.01089
G1 X127.351 Y139.609 E.49292
G1 X127.912 Y139.609 E.01089
G1 X109.391 Y121.088 E.50833
G1 X109.391 Y120.526 E.01089
G1 X128.474 Y139.609 E.52374
M73 P36 R14
G1 X129.035 Y139.609 E.01089
G1 X109.391 Y119.965 E.53915
G1 X109.391 Y119.404 E.01089
G1 X129.596 Y139.609 E.55455
G1 X130.158 Y139.609 E.01089
G1 X109.391 Y118.842 E.56996
G1 X109.391 Y118.281 E.01089
G1 X130.719 Y139.609 E.58537
G1 X131.281 Y139.609 E.01089
G1 X109.391 Y117.719 E.60077
G1 X109.391 Y117.158 E.01089
G1 X131.842 Y139.609 E.61618
G1 X132.403 Y139.609 E.01089
G1 X109.489 Y116.694 E.62891
G3 X109.799 Y116.443 I.532 J.34 E.00788
G1 X132.965 Y139.609 E.63581
G1 X133.526 Y139.609 E.01089
G1 X110.309 Y116.391 E.63723
G1 X110.87 Y116.391 E.01089
G1 X134.087 Y139.609 E.63723
G1 X134.649 Y139.609 E.01089
G1 X111.431 Y116.391 E.63722
G1 X111.993 Y116.391 E.01089
G1 X135.21 Y139.609 E.63722
G1 X135.771 Y139.609 E.01089
G1 X112.554 Y116.391 E.63722
G1 X113.116 Y116.391 E.01089
G1 X136.333 Y139.609 E.63722
G1 X136.894 Y139.609 E.01089
G1 X113.677 Y116.391 E.63722
G1 X114.238 Y116.391 E.01089
G1 X137.455 Y139.609 E.63722
G2 X138.013 Y139.605 I.249 J-4.252 E.01083
G1 X114.8 Y116.391 E.63712
G1 X115.361 Y116.391 E.01089
G1 X138.54 Y139.57 E.63617
G1 X139.067 Y139.536 E.01025
G1 X115.922 Y116.392 E.63522
G1 X116.484 Y116.392 E.01089
G1 X139.541 Y139.449 E.63284
G1 X140.009 Y139.356 E.00926
G1 X117.045 Y116.392 E.63028
G1 X117.607 Y116.392 E.01089
G1 X140.451 Y139.236 E.627
G1 X140.87 Y139.094 E.00859
G1 X118.168 Y116.392 E.6231
G1 X118.729 Y116.392 E.01089
G1 X141.29 Y138.952 E.61919
G1 X141.666 Y138.767 E.00814
G1 X119.291 Y116.392 E.61411
G1 X119.852 Y116.392 E.01089
G1 X142.042 Y138.581 E.60902
G2 X142.406 Y138.384 I-.568 J-1.481 E.00806
G1 X120.413 Y116.392 E.6036
G1 X120.975 Y116.392 E.01089
G1 X142.742 Y138.159 E.59743
G1 X143.079 Y137.934 E.00785
G1 X121.536 Y116.392 E.59126
G1 X122.098 Y116.392 E.01089
G1 X143.396 Y137.69 E.58455
G1 X143.695 Y137.428 E.00772
G1 X122.659 Y116.392 E.57735
G1 X123.22 Y116.392 E.01089
G1 X143.994 Y137.165 E.57015
G2 X144.267 Y136.877 I-.957 J-1.183 E.00773
G1 X123.782 Y116.392 E.56225
G1 X124.343 Y116.392 E.01089
G1 X144.53 Y136.578 E.55404
G1 X144.792 Y136.279 E.00772
G1 X124.904 Y116.392 E.54583
G1 X125.466 Y116.392 E.01089
G1 X145.022 Y135.948 E.53674
G1 X145.247 Y135.611 E.00785
G1 X126.027 Y116.392 E.5275
G1 X126.589 Y116.392 E.01089
G1 X145.468 Y135.271 E.51817
G1 X145.654 Y134.896 E.00814
G1 X127.15 Y116.392 E.50785
G1 X127.711 Y116.392 E.01089
G1 X145.839 Y134.52 E.49754
G2 X146.007 Y134.126 I-1.409 J-.835 E.00832
G1 X128.273 Y116.392 E.48675
G1 X128.834 Y116.392 E.01089
G1 X146.149 Y133.707 E.47524
G1 X146.292 Y133.288 E.00859
G1 X129.395 Y116.392 E.46374
G1 X129.957 Y116.392 E.01089
G1 X146.392 Y132.827 E.45108
G1 X146.485 Y132.359 E.00927
G1 X130.518 Y116.392 E.43823
G1 X131.08 Y116.392 E.01089
G1 X146.549 Y131.862 E.42458
G1 X146.584 Y131.335 E.01025
G1 X131.641 Y116.392 E.41012
G1 X132.202 Y116.392 E.01089
G1 X146.609 Y130.798 E.3954
G1 X146.609 Y130.237 E.01089
G1 X132.764 Y116.392 E.37999
G1 X133.325 Y116.392 E.01089
G1 X146.609 Y129.676 E.36458
G1 X146.609 Y129.114 E.01089
G1 X133.886 Y116.392 E.34918
G1 X134.448 Y116.392 E.01089
G1 X146.609 Y128.553 E.33377
G1 X146.609 Y127.992 E.01089
G1 X135.009 Y116.392 E.31836
G1 X135.571 Y116.392 E.01089
G1 X146.609 Y127.43 E.30295
G1 X146.609 Y126.869 E.01089
G1 X136.132 Y116.392 E.28755
G1 X136.693 Y116.392 E.01089
G1 X146.609 Y126.308 E.27214
G1 X146.609 Y125.746 E.01089
G1 X137.255 Y116.392 E.25673
G1 X137.816 Y116.392 E.01089
G1 X146.609 Y125.185 E.24132
G1 X146.609 Y124.623 E.01089
G1 X138.377 Y116.392 E.22592
G1 X138.939 Y116.392 E.01089
G1 X146.609 Y124.062 E.21051
G1 X146.609 Y123.501 E.01089
G1 X139.5 Y116.392 E.1951
G1 X140.062 Y116.392 E.01089
G1 X146.609 Y122.939 E.17969
G1 X146.609 Y122.378 E.01089
G1 X140.623 Y116.392 E.16429
G1 X141.184 Y116.392 E.01089
G1 X146.609 Y121.817 E.14888
G1 X146.609 Y121.255 E.01089
G1 X141.746 Y116.392 E.13347
G1 X142.307 Y116.392 E.01089
G1 X146.609 Y120.694 E.11806
G1 X146.609 Y120.133 E.01089
G1 X142.868 Y116.392 E.10266
G1 X143.43 Y116.392 E.01089
G1 X146.609 Y119.571 E.08725
G1 X146.609 Y119.01 E.01089
G1 X143.991 Y116.392 E.07184
G1 X144.553 Y116.392 E.01089
G1 X146.609 Y118.449 E.05643
G1 X146.609 Y117.887 E.01089
G1 X145.114 Y116.392 E.04103
G1 X145.675 Y116.392 E.01089
G1 X146.786 Y117.503 E.03049
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15115.635
G1 X145.675 Y116.392 E-.59695
G1 X145.246 Y116.392 E-.16306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/83
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S201.45
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.08 I-.035 J-1.216 P1  F42000
G1 X109.043 Y117.431 Z1.08
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8483
M204 S6000
G1 X109.043 Y117.068 E.00751
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.948 Y116.046 E.74423
G3 X146.915 Y116.755 I.013 J.996 E.02669
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.0243
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.02429
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.491 E.2795
M204 S10000
G1 X108.619 Y117.431 F42000
G1 F8483
M204 S6000
G1 X108.619 Y117.041 E.00809
M73 P37 R14
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.976 Y115.621 E.74539
G1 X146.356 Y115.671 E.00795
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.491 E.27979
M204 S10000
G1 X108.21 Y117.431 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8483
M204 S5000
G1 X108.21 Y117.014 E.00804
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.003 Y115.212 E.69371
G1 X146.463 Y115.273 E.00895
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02468
G1 X112.986 Y139.398 E.00276
G1 X112.041 Y138.767 E.02192
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.491 E.26026
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.18123
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17739
G1 X108.822 Y115.669 E-.0413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X111.822 Y136.956 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8483
M204 S6000
G3 X110.778 Y135.622 I4.544 J-4.628 E.03523
G1 X129.993 Y116.408 E.56364
G1 X130.807 Y116.408 E.01689
G1 X146.517 Y132.118 E.46085
G3 X146.052 Y133.947 I-12.203 J-2.129 E.03918
G1 X140.947 Y139.052 E.14978
G3 X139.451 Y139.451 I-2.263 J-5.48 E.03219
G1 X116.407 Y116.407 E.676
G1 X115.594 Y116.407 E.01685
G1 X109.406 Y122.595 E.18152
G1 X109.406 Y123.806 E.02512
G1 X125.194 Y139.594 E.46313
G1 X126.006 Y139.594 E.01684
G1 X146.594 Y119.006 E.60393
G1 X146.594 Y117.795 E.02512
G1 X145.207 Y116.408 E.04067
G1 X144.391 Y116.408 E.01692
G1 X121.206 Y139.594 E.68012
G1 X120.394 Y139.594 E.01684
G1 X109.406 Y128.606 E.32233
G1 X109.406 Y127.394 E.02512
G1 X120.394 Y116.407 E.32231
G1 X121.207 Y116.407 E.01686
G1 X142.861 Y138.062 E.63522
G2 X145.222 Y135.622 I-4.062 J-6.291 E.07103
G1 X126.007 Y116.407 E.56365
G1 X125.193 Y116.407 E.01688
G1 X109.483 Y132.118 E.46086
G2 X109.948 Y133.947 I12.204 J-2.129 E.03918
G1 X115.053 Y139.052 E.14978
G2 X116.549 Y139.451 I2.263 J-5.478 E.03219
G1 X139.592 Y116.408 E.67596
G1 X140.407 Y116.408 E.01691
G1 X146.594 Y122.595 E.18147
G1 X146.594 Y123.806 E.02512
G1 X130.806 Y139.594 E.46313
G1 X129.994 Y139.594 E.01684
G1 X109.406 Y119.006 E.60393
G1 X109.406 Y117.795 E.02512
G1 X110.795 Y116.406 E.04073
G1 X111.607 Y116.406 E.01684
G1 X134.794 Y139.594 E.68018
G1 X135.606 Y139.594 E.01684
G1 X146.594 Y128.606 E.32233
G1 X146.594 Y127.394 E.02512
G1 X135.607 Y116.408 E.32228
G1 X134.792 Y116.408 E.0169
G1 X113.139 Y138.062 E.6352
G3 X111.84 Y136.977 I5.928 J-8.418 E.03515
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X112.77 Y137.815 E-.47618
G1 X113.139 Y138.062 E-.16829
G1 X113.354 Y137.847 E-.11553
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/83
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.2 I1.191 J-.252 P1  F42000
G1 X109.043 Y117.448 Z1.2
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9309
M204 S6000
G1 X109.043 Y117.068 E.00788
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.0243
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.508 E.27914
M204 S10000
G1 X108.619 Y117.448 F42000
G1 F9309
M204 S6000
G1 X108.619 Y117.041 E.00846
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.508 E.27943
M204 S10000
G1 X108.21 Y117.448 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9309
M204 S5000
G1 X108.21 Y117.014 E.00837
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.997 Y115.211 E.69361
G1 X146.463 Y115.273 E.00905
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.508 E.25993
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.1879
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17739
G1 X108.808 Y115.68 E-.03464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.32
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.32 F4000
            G39.3 S1
            G0 Z1.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.422 Y119.249 F42000
G1 Z.92
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.365752
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X109.423 Y117.289 E.03258
; Slow Down End
M204 S10000
G1 X112.671 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X110.429 Y116.422 E.03727
; Slow Down End
M204 S10000
G1 X117.784 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X115.033 Y116.422 E.04573
; Slow Down End
M204 S10000
G1 X122.903 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X120.003 Y116.422 E.0482
; Slow Down End
M204 S10000
G1 X127.325 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X124.596 Y116.422 E.04537
; Slow Down End
M204 S10000
G1 X132.443 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X129.575 Y116.422 E.04767
; Slow Down End
M204 S10000
G1 X136.867 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X134.159 Y116.422 E.04502
; Slow Down End
M204 S10000
G1 X141.984 Y116.422 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X139.145 Y116.422 E.04719
; Slow Down End
M204 S10000
G1 X145.264 Y116.422 F42000
G1 F9309
M204 S6000
G1 X144.107 Y116.422 E.01923
M204 S10000
G1 X146.578 Y119.485 F42000
G1 F9309
M204 S6000
G1 X146.578 Y117.796 E.02806
M204 S10000
G1 X111.84 Y136.977 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P38 R13
G1 F9309
M204 S6000
G2 X113.139 Y138.062 I7.227 J-7.333 E.03515
G1 X134.4 Y116.801 E.62367
G1 X136 Y116.801 E.0332
G1 X146.594 Y127.394 E.31076
G1 X146.594 Y128.606 E.02512
G1 X135.606 Y139.594 E.32233
G1 X134.794 Y139.594 E.01684
G1 X112.001 Y116.801 E.66862
G1 X110.4 Y116.801 E.0332
G1 X109.801 Y117.4 E.01759
G1 X109.801 Y119.4 E.04148
G1 X129.994 Y139.594 E.59236
G1 X130.806 Y139.594 E.01684
G1 X146.594 Y123.806 E.46313
G1 X146.594 Y122.595 E.02512
G1 X140.8 Y116.801 E.16996
G1 X139.199 Y116.801 E.0332
G1 X116.549 Y139.451 E.66445
G3 X115.053 Y139.052 I.768 J-5.877 E.03219
G1 X109.948 Y133.947 E.14978
G3 X109.483 Y132.118 I11.739 J-3.958 E.03918
G1 X124.8 Y116.801 E.44932
G1 X126.4 Y116.801 E.0332
G1 X145.222 Y135.622 E.55211
G3 X142.861 Y138.062 I-6.422 J-3.852 E.07103
G1 X121.6 Y116.801 E.62367
G1 X120 Y116.801 E.0332
G1 X109.406 Y127.394 E.31076
G1 X109.406 Y128.606 E.02512
G1 X120.394 Y139.594 E.32233
G1 X121.206 Y139.594 E.01684
G1 X143.999 Y116.801 E.66862
G1 X145.6 Y116.801 E.0332
G1 X146.199 Y117.4 E.01759
G1 X146.199 Y119.4 E.04148
G1 X126.006 Y139.594 E.59236
G1 X125.194 Y139.594 E.01684
G1 X109.406 Y123.806 E.46313
G1 X109.406 Y122.595 E.02512
G1 X115.2 Y116.801 E.16996
G1 X116.801 Y116.801 E.0332
G1 X139.451 Y139.451 E.66445
G2 X140.947 Y139.052 I-.768 J-5.879 E.03219
G1 X146.052 Y133.947 E.14978
G2 X146.517 Y132.118 I-11.738 J-3.957 E.03918
G1 X131.2 Y116.801 E.44932
G1 X129.6 Y116.801 E.0332
G1 X110.778 Y135.622 E.55211
G2 X111.822 Y136.956 I5.587 J-3.294 E.03523
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X111.185 Y136.23 E-.3671
G1 X110.778 Y135.622 E-.27775
G1 X110.993 Y135.408 E-.11515
; WIPE_END
G1 E-.03999 F1800
; layer num/total_layer_count: 8/83
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S198.9
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.32 I1.21 J-.131 P1  F42000
G1 X109.043 Y117.466 Z1.32
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14142.679
M204 S6000
G1 X109.043 Y117.068 E.00825
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.02429
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.526 E.27877
M204 S10000
G1 X108.619 Y117.466 F42000
G1 F14142.679
M204 S6000
G1 X108.619 Y117.041 E.00883
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.526 E.27905
M204 S10000
G1 X108.21 Y117.466 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.00872
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.006 Y115.213 E.69377
G1 X146.463 Y115.273 E.00889
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02468
G1 X112.856 Y139.311 E.00579
G1 X112.041 Y138.767 E.0189
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.526 E.25958
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.19474
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17739
G1 X108.794 Y115.691 E-.0278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.44
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.44 F4000
            G39.3 S1
            G0 Z1.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.217 Y118.958 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40369
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X111.254 Y120.995 E.15023
G1 X111.574 Y120.674 E.02366
G1 X109.419 Y118.519 E.15895
G1 X109.419 Y117.877 E.03346
G1 X111.895 Y120.353 E.18261
G1 X112.216 Y120.032 E.02366
G1 X109.483 Y117.299 E.20156
G1 X109.651 Y117.302 E.00876
G1 X109.889 Y117.064 E.01758
G1 X112.537 Y119.712 E.19526
G1 X112.858 Y119.391 E.02366
G1 X110.21 Y116.743 E.19526
G1 X110.403 Y116.551 E.0142
G1 X110.43 Y116.419 E.007
G1 X110.528 Y116.419 E.00511
G1 X115.578 Y121.47 E.37249
G1 X115.899 Y121.149 E.02366
G1 X111.169 Y116.419 E.34883
G1 X111.811 Y116.419 E.03346
G1 X116.22 Y120.828 E.32517
G1 X116.541 Y120.508 E.02366
G1 X112.453 Y116.419 E.30151
G1 X112.562 Y116.419 E.00571
G1 X114.212 Y117.537 E.10396
G1 X116.862 Y120.187 E.19539
G1 X117.182 Y119.866 E.02366
G1 X114.535 Y117.218 E.19526
G1 X114.856 Y116.898 E.02366
G1 X117.503 Y119.545 E.19526
G1 X117.824 Y119.224 E.02366
G1 X115.031 Y116.419 E.20642
G1 X115.661 Y116.419 E.03281
G1 X120.545 Y121.303 E.36021
G1 X120.866 Y120.983 E.02366
G1 X116.302 Y116.419 E.33655
G1 X116.944 Y116.419 E.03346
G1 X121.186 Y120.662 E.31289
G1 X121.507 Y120.341 E.02366
G1 X117.585 Y116.419 E.28923
G1 X117.672 Y116.419 E.0045
G1 X119.162 Y117.391 E.09279
G1 X119.18 Y117.373 E.00134
G1 X121.828 Y120.02 E.19526
G1 X122.149 Y119.699 E.02366
G1 X119.501 Y117.052 E.19526
G1 X119.822 Y116.731 E.02366
G1 X122.47 Y119.379 E.19526
G1 X122.575 Y119.273 E.00779
G1 X124.975 Y121.673 E.17699
G1 X125.19 Y121.458 E.01587
G1 X120.152 Y116.419 E.37158
G1 X120.794 Y116.419 E.03346
G1 X125.511 Y121.137 E.34792
G1 X125.832 Y120.816 E.02366
G1 X121.435 Y116.419 E.32427
G1 X122.077 Y116.419 E.03346
G1 X126.153 Y120.495 E.30061
G1 X126.474 Y120.174 E.02366
G1 X122.718 Y116.419 E.27695
G1 X122.787 Y116.419 E.00356
G1 X124.302 Y117.361 E.09305
G1 X126.794 Y119.854 E.18381
G1 X127.115 Y119.533 E.02366
G1 X124.68 Y117.098 E.17958
G1 X124.595 Y116.419 E.03566
G1 X124.643 Y116.419 E.0025
G1 X127.436 Y119.212 E.20597
G1 X127.521 Y119.127 E.00625
G1 X129.921 Y121.527 E.17699
G1 X130.157 Y121.291 E.01741
G1 X125.285 Y116.419 E.3593
G1 X125.926 Y116.419 E.03346
G1 X130.478 Y120.97 E.33564
G1 X130.798 Y120.649 E.02366
G1 X126.568 Y116.419 E.31198
G1 X127.21 Y116.419 E.03346
M73 P39 R13
G1 X131.119 Y120.329 E.28832
G1 X131.44 Y120.008 E.02366
G1 X128.792 Y117.36 E.19526
G1 X129.113 Y117.04 E.02366
G1 X131.761 Y119.687 E.19526
G1 X132.082 Y119.366 E.02366
G1 X129.434 Y116.719 E.19526
G1 X129.558 Y116.595 E.00913
G1 X129.574 Y116.419 E.0092
G1 X129.776 Y116.419 E.01052
G1 X134.802 Y121.445 E.37068
G1 X135.123 Y121.125 E.02366
G1 X130.418 Y116.419 E.34702
G1 X131.059 Y116.419 E.03346
G1 X135.444 Y120.804 E.32336
G1 X135.765 Y120.483 E.02366
G1 X131.701 Y116.419 E.2997
G1 X132.328 Y116.419 E.03269
G1 X132.368 Y116.444 E.00245
G1 X136.085 Y120.162 E.2742
G1 X136.406 Y119.841 E.02366
G1 X134.091 Y117.526 E.17079
G1 X134.357 Y117.693 E.01641
G1 X134.256 Y117.05 E.03393
G1 X136.727 Y119.521 E.18221
G1 X137.048 Y119.2 E.02366
G1 X134.267 Y116.419 E.20506
G1 X134.909 Y116.419 E.03346
G1 X139.769 Y121.279 E.3584
G1 X140.089 Y120.958 E.02366
G1 X135.551 Y116.419 E.33474
G1 X136.192 Y116.419 E.03346
G1 X140.41 Y120.637 E.31108
G1 X140.731 Y120.316 E.02366
G1 X136.986 Y116.571 E.27622
G1 X138.307 Y117.445 E.08263
G1 X138.404 Y117.348 E.00718
G1 X141.052 Y119.996 E.19526
G1 X141.373 Y119.675 E.02366
G1 X138.725 Y117.027 E.19525
G1 X139.046 Y116.706 E.02366
G1 X141.693 Y119.354 E.19525
G1 X141.721 Y119.327 E.00201
G1 X144.121 Y121.727 E.17699
G1 X144.414 Y121.433 E.02165
G1 X139.4 Y116.419 E.36977
G1 X140.042 Y116.419 E.03346
G1 X144.735 Y121.112 E.34611
G1 X145.056 Y120.791 E.02366
G1 X140.684 Y116.419 E.32245
G1 X141.325 Y116.419 E.03346
G1 X145.377 Y120.471 E.29879
G1 X145.697 Y120.15 E.02366
G1 X142.136 Y116.588 E.26269
G1 X143.255 Y117.297 E.06911
G1 X143.371 Y117.181 E.00852
G1 X146.018 Y119.829 E.19526
G1 X146.339 Y119.508 E.02366
G1 X143.691 Y116.861 E.19526
G1 X144.012 Y116.54 E.02366
G1 X146.581 Y119.108 E.18943
G1 X146.581 Y118.467 E.03346
G1 X144.533 Y116.419 E.15101
G1 X145.175 Y116.419 E.03346
G1 X146.783 Y118.028 E.11862
M106 S198.9
M204 S10000
G1 X146.432 Y120.033 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.12
G1 F14142.679
M204 S6000
G1 X145.232 Y121.233 E.0352
G1 X146.594 Y122.595 E.03993
G1 X146.594 Y123.806 E.02512
G1 X130.806 Y139.594 E.46313
G1 X129.994 Y139.594 E.01684
G1 X111.634 Y121.233 E.53859
G1 X111.252 Y121.615 E.01119
G1 X110.819 Y121.182 E.0127
G1 X109.406 Y122.595 E.04145
G1 X109.406 Y123.806 E.02512
G1 X125.194 Y139.594 E.46313
G1 X126.006 Y139.594 E.01684
G1 X143.688 Y121.912 E.51868
G1 X142.488 Y120.712 E.0352
M204 S10000
G1 X136.833 Y120.033 F42000
G1 F14142.679
M204 S6000
G1 X135.633 Y121.233 E.0352
G1 X146.517 Y132.118 E.31929
G3 X146.052 Y133.947 I-12.205 J-2.13 E.03918
G1 X140.947 Y139.052 E.14978
G3 X139.451 Y139.451 I-2.263 J-5.48 E.03219
G1 X121.233 Y121.233 E.53442
G1 X120.348 Y122.119 E.02597
G1 X119.915 Y121.686 E.0127
G1 X109.483 Y132.118 E.30602
G2 X109.948 Y133.947 I12.204 J-2.129 E.03918
G1 X115.053 Y139.052 E.14978
G2 X116.549 Y139.451 I2.263 J-5.479 E.03219
G1 X134.115 Y121.885 E.5153
G1 X132.915 Y120.685 E.0352
M204 S10000
G1 X117.633 Y120.033 F42000
G1 F14142.679
M204 S6000
G1 X116.433 Y121.233 E.0352
G1 X134.794 Y139.594 E.53859
G1 X135.606 Y139.594 E.01684
G1 X146.594 Y128.606 E.32233
G1 X146.594 Y127.394 E.02512
G1 X140.433 Y121.233 E.18073
G1 X139.493 Y122.172 E.02755
G1 X139.06 Y121.739 E.0127
G1 X121.206 Y139.594 E.52374
G1 X120.394 Y139.594 E.01684
G1 X109.406 Y128.606 E.32233
G1 X109.406 Y127.394 E.02512
G1 X114.969 Y121.831 E.16319
G1 X113.769 Y120.631 E.0352
M204 S10000
G1 X111.822 Y136.956 F42000
G1 F14142.679
M204 S6000
G3 X110.778 Y135.622 I4.545 J-4.628 E.03523
G1 X124.542 Y121.858 E.40375
G1 X124.975 Y122.291 E.0127
G1 X126.033 Y121.233 E.03103
G1 X142.861 Y138.062 E.49365
G2 X145.222 Y135.622 I-4.062 J-6.292 E.07103
G1 X130.833 Y121.233 E.42208
G1 X129.921 Y122.146 E.02676
G1 X129.488 Y121.713 E.0127
G1 X113.139 Y138.062 E.47959
G3 X111.84 Y136.977 I5.929 J-8.418 E.03515
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X112.77 Y137.815 E-.47619
G1 X113.139 Y138.062 E-.16829
G1 X113.354 Y137.847 E-.11553
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/83
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S201.45
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.44 I1.191 J-.252 P1  F42000
G1 X109.043 Y117.485 Z1.44
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11265
M204 S6000
G1 X109.043 Y117.068 E.00863
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.02429
G1 X112.549 Y138.104 E.0243
G1 X111.668 Y137.332 E.02429
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.545 E.27838
M204 S10000
G1 X108.619 Y117.485 F42000
G1 F11265
M204 S6000
G1 X108.619 Y117.041 E.00921
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.545 E.27867
M204 S10000
G1 X108.21 Y117.485 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11265
M204 S5000
G1 X108.21 Y117.014 E.00908
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.014 Y115.214 E.69393
G1 X146.463 Y115.273 E.00873
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02468
G1 X112.79 Y139.268 E.0073
G1 X112.04 Y138.767 E.01739
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.545 E.25922
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.20174
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17738
G1 X108.736 Y115.736 E-.17739
G1 X108.779 Y115.702 E-.0208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.56
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.56 F4000
            G39.3 S1
            G0 Z1.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y130.303 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11265
M204 S6000
G1 X109.406 Y128.606 E.0352
G1 X120.394 Y139.594 E.32233
G1 X121.206 Y139.594 E.01684
G1 X140.605 Y120.195 E.56904
G1 X139.394 Y120.195 E.0251
G1 X146.594 Y127.394 E.21118
G1 X146.594 Y128.606 E.02512
G1 X135.606 Y139.594 E.32233
G1 X134.794 Y139.594 E.01684
G1 X115.395 Y120.195 E.56904
G1 X116.606 Y120.195 E.0251
G1 X109.406 Y127.394 E.21118
G1 X109.406 Y123.806 E.07444
G1 X125.194 Y139.594 E.46313
G1 X126.006 Y139.594 E.01684
G1 X145.404 Y120.195 E.56904
G1 X144.194 Y120.195 E.0251
G1 X146.594 Y122.595 E.07039
G1 X146.594 Y123.806 E.02512
G1 X130.806 Y139.594 E.46313
G1 X129.994 Y139.594 E.01684
G1 X110.596 Y120.195 E.56904
G1 X111.806 Y120.195 E.0251
G1 X109.406 Y122.595 E.07039
G1 X109.406 Y120.898 E.0352
M204 S10000
G1 X111.84 Y136.977 F42000
G1 F11265
M204 S6000
G2 X113.139 Y138.062 I7.226 J-7.331 E.03515
G1 X131.005 Y120.195 E.5241
G1 X129.795 Y120.195 E.0251
G1 X145.222 Y135.622 E.45253
G3 X142.861 Y138.062 I-6.423 J-3.852 E.07103
G1 X124.995 Y120.195 E.5241
M73 P40 R13
G1 X126.205 Y120.195 E.0251
G1 X110.778 Y135.622 E.45253
G2 X111.822 Y136.956 I5.587 J-3.294 E.03523
M204 S10000
G1 X146.594 Y130.423 F42000
G1 F11265
M204 S6000
G3 X146.517 Y132.118 I-12.962 J.265 E.03521
G1 X134.595 Y120.195 E.34974
G1 X135.805 Y120.195 E.0251
G1 X116.549 Y139.451 E.56487
G3 X115.053 Y139.052 I.768 J-5.877 E.03219
G1 X109.948 Y133.947 E.14978
G3 X109.483 Y132.118 I11.739 J-3.958 E.03918
G1 X121.405 Y120.195 E.34975
G1 X120.195 Y120.195 E.0251
G1 X139.451 Y139.451 E.56487
G2 X140.947 Y139.052 I-.768 J-5.879 E.03219
G1 X146.052 Y133.947 E.14978
G2 X146.476 Y132.326 I-5.942 J-2.42 E.03485
M204 S10000
G1 X146.497 Y116.815 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419992
G1 F11265
M204 S6000
G1 X146.255 Y116.532 E.00718
G1 X145.905 Y116.453 E.00692
G1 X110.095 Y116.453 E.69024
G1 X109.745 Y116.532 E.00692
G1 X109.503 Y116.815 E.00718
G1 X109.453 Y117.14 E.00634
G1 X109.453 Y119.786 E.051
G1 X146.547 Y119.786 E.71501
G1 X146.547 Y117.14 E.051
G1 X146.506 Y116.874 E.00518
M204 S10000
G1 X144.881 Y116.847 F42000
G1 F11265
M204 S6000
G1 X110.121 Y116.847 E.67
G1 X109.967 Y116.867 E.003
G1 X109.867 Y116.967 E.00272
G2 X109.847 Y119.392 I68.777 J1.789 E.04674
G1 X146.153 Y119.392 E.69981
G1 X146.153 Y117.14 E.0434
G1 X146.133 Y116.967 E.00336
G1 X146.033 Y116.867 E.00272
G1 X144.941 Y116.848 E.02106
M204 S10000
G1 X145.759 Y117.241 F42000
G1 F11265
M204 S6000
G1 X110.241 Y117.241 E.68461
G1 X110.241 Y118.997 E.03385
G1 X145.759 Y118.997 E.68461
G1 X145.759 Y117.301 E.0327
M204 S10000
G1 X145.365 Y117.635 F42000
G1 F11265
M204 S6000
G1 X110.635 Y117.635 E.66942
G1 X110.635 Y118.603 E.01865
G1 X145.365 Y118.603 E.66942
G1 X145.365 Y117.695 E.0175
M204 S10000
G1 X111.119 Y118.119 F42000
; LINE_WIDTH: 0.599322
G1 F10460.798
M204 S6000
G1 X144.821 Y118.119 E.94509
; CHANGE_LAYER
; Z_HEIGHT: 1.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10460.798
G1 X142.821 Y118.119 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/83
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.56 I.022 J-1.217 P1  F42000
G1 X109.043 Y117.503 Z1.56
G1 Z1.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11254
M204 S6000
G1 X109.043 Y117.068 E.00902
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.563 E.27799
M204 S10000
G1 X108.619 Y117.503 F42000
G1 F11254
M204 S6000
G1 X108.619 Y117.041 E.0096
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.969 Y115.62 E.74524
G1 X146.356 Y115.671 E.0081
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.563 E.27828
M204 S10000
G1 X108.21 Y117.503 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11254
M204 S5000
G1 X108.21 Y117.014 E.00944
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.022 Y115.215 E.69409
G1 X146.463 Y115.273 E.00857
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.563 E.25886
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.20888
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17738
G1 X108.764 Y115.714 E-.01366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.68
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.68 F4000
            G39.3 S1
            G0 Z1.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.898 F42000
G1 Z1.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11254
M204 S6000
G1 X109.406 Y122.595 E.0352
G1 X111.802 Y120.199 E.07026
G1 X110.6 Y120.199 E.02493
G1 X129.994 Y139.594 E.56892
G1 X130.806 Y139.594 E.01684
G1 X146.594 Y123.806 E.46313
G1 X146.594 Y122.595 E.02512
G1 X144.198 Y120.199 E.07026
G1 X145.4 Y120.199 E.02493
G1 X126.006 Y139.594 E.56892
G1 X125.194 Y139.594 E.01684
G1 X109.406 Y123.806 E.46313
G1 X109.406 Y127.394 E.07444
G1 X116.601 Y120.199 E.21106
G1 X115.4 Y120.199 E.02493
G1 X134.794 Y139.594 E.56892
G1 X135.606 Y139.594 E.01684
G1 X146.594 Y128.606 E.32233
G1 X146.594 Y127.394 E.02512
G1 X139.399 Y120.199 E.21106
G1 X140.6 Y120.199 E.02493
G1 X121.206 Y139.594 E.56892
G1 X120.394 Y139.594 E.01684
G1 X109.406 Y128.606 E.32233
G2 X109.483 Y132.118 I26.833 J1.174 E.07292
G1 X121.401 Y120.199 E.34962
G1 X120.199 Y120.199 E.02493
G1 X139.451 Y139.451 E.56475
G2 X140.947 Y139.052 I-.768 J-5.879 E.03219
G1 X146.052 Y133.947 E.14978
G2 X146.517 Y132.118 I-11.74 J-3.958 E.03918
G1 X134.599 Y120.199 E.34962
G1 X135.801 Y120.199 E.02493
G1 X116.549 Y139.451 E.56475
G3 X115.053 Y139.052 I.768 J-5.879 E.03219
G1 X109.948 Y133.947 E.14978
G3 X109.524 Y132.326 I5.942 J-2.42 E.03485
M204 S10000
G1 X111.822 Y136.956 F42000
G1 F11254
M204 S6000
G3 X110.778 Y135.622 I4.544 J-4.628 E.03523
G1 X126.201 Y120.199 E.45241
G1 X124.999 Y120.199 E.02493
G1 X142.861 Y138.062 E.52397
G2 X145.222 Y135.622 I-4.062 J-6.292 E.07103
G1 X129.799 Y120.199 E.45241
G1 X131.001 Y120.199 E.02493
G1 X113.139 Y138.062 E.52397
G3 X111.84 Y136.977 I5.928 J-8.418 E.03515
M204 S10000
G1 X146.547 Y117.14 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419992
G1 F11254
M204 S6000
G1 X146.497 Y116.815 E.00634
G1 X146.255 Y116.532 E.00718
G1 X145.905 Y116.453 E.00692
G1 X110.095 Y116.453 E.69024
G1 X109.745 Y116.532 E.00692
G1 X109.503 Y116.815 E.00718
G1 X109.453 Y117.14 E.00634
G1 X109.453 Y119.79 E.05108
G1 X146.547 Y119.79 E.71501
G1 X146.547 Y117.2 E.04992
M204 S10000
M73 P41 R13
G1 X146.153 Y117.14 F42000
G1 F11254
M204 S6000
G1 X146.133 Y116.967 E.00336
G1 X146.033 Y116.867 E.00272
G1 X144.879 Y116.847 E.02226
G1 X110.121 Y116.847 E.66996
G1 X109.967 Y116.867 E.003
G1 X109.867 Y116.967 E.00272
G2 X109.847 Y119.396 I69.088 J1.792 E.04682
G1 X146.153 Y119.396 E.69981
G1 X146.153 Y117.2 E.04232
M204 S10000
G1 X145.759 Y117.241 F42000
G1 F11254
M204 S6000
G1 X110.241 Y117.241 E.68461
G1 X110.241 Y119.002 E.03393
G1 X145.759 Y119.002 E.68461
G1 X145.759 Y117.301 E.03278
M204 S10000
G1 X145.365 Y117.635 F42000
G1 F11254
M204 S6000
G1 X110.635 Y117.635 E.66942
G1 X110.635 Y118.607 E.01874
G1 X145.365 Y118.607 E.66942
G1 X145.365 Y117.695 E.01758
M204 S10000
G1 X111.121 Y118.121 F42000
; LINE_WIDTH: 0.603512
G1 F10384.935
M204 S6000
G1 X144.819 Y118.121 E.95188
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10384.935
G1 X142.819 Y118.121 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/83
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.68 I.022 J-1.217 P1  F42000
G1 X109.043 Y117.523 Z1.68
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11286
M204 S6000
G1 X109.043 Y117.068 E.00942
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.0243
G1 X111.668 Y137.332 E.02429
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.583 E.2776
M204 S10000
G1 X108.619 Y117.523 F42000
G1 F11286
M204 S6000
G1 X108.619 Y117.041 E.01
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.977 Y115.622 E.74541
G1 X146.356 Y115.671 E.00793
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.583 E.27789
M204 S10000
G1 X108.21 Y117.523 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11286
M204 S5000
G1 X108.21 Y117.014 E.00981
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.031 Y115.216 E.69425
G1 X146.463 Y115.273 E.0084
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02468
G1 X112.66 Y139.18 E.01032
G1 X112.04 Y138.767 E.01436
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.583 E.25849
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.21616
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.736 Y115.736 E-.17739
G1 X108.749 Y115.725 E-.00639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.524 Y132.326 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11286
M204 S6000
G2 X109.948 Y133.947 I6.366 J-.8 E.03485
G1 X115.053 Y139.052 E.14978
G2 X116.549 Y139.451 I2.263 J-5.479 E.03219
G1 X135.796 Y120.204 E.56462
G1 X134.603 Y120.204 E.02475
G1 X146.517 Y132.118 E.3495
G3 X146.052 Y133.947 I-12.205 J-2.13 E.03918
G1 X140.947 Y139.052 E.14978
G3 X139.451 Y139.451 I-2.263 J-5.48 E.03219
G1 X120.204 Y120.204 E.56462
G1 X121.397 Y120.204 E.02475
G1 X109.483 Y132.118 E.3495
G3 X109.406 Y128.606 I26.757 J-2.338 E.07292
G1 X120.394 Y139.594 E.32233
G1 X121.206 Y139.594 E.01684
G1 X140.596 Y120.204 E.56879
G1 X139.403 Y120.204 E.02475
G1 X146.594 Y127.394 E.21094
G1 X146.594 Y128.606 E.02512
G1 X135.606 Y139.594 E.32233
G1 X134.794 Y139.594 E.01684
G1 X115.404 Y120.204 E.56879
G1 X116.597 Y120.204 E.02475
G1 X109.406 Y127.394 E.21094
G1 X109.406 Y123.806 E.07444
G1 X125.194 Y139.594 E.46313
G1 X126.006 Y139.594 E.01684
G1 X145.396 Y120.204 E.56879
G1 X144.203 Y120.204 E.02475
G1 X146.594 Y122.595 E.07014
G1 X146.594 Y123.806 E.02512
G1 X130.806 Y139.594 E.46313
G1 X129.994 Y139.594 E.01684
G1 X110.604 Y120.204 E.56879
G1 X111.797 Y120.204 E.02475
G1 X109.406 Y122.595 E.07014
G1 X109.406 Y120.898 E.0352
M204 S10000
G1 X111.84 Y136.977 F42000
G1 F11286
M204 S6000
G2 X113.139 Y138.062 I7.223 J-7.329 E.03515
G1 X130.997 Y120.204 E.52385
G1 X129.803 Y120.204 E.02475
G1 X145.222 Y135.622 E.45229
G3 X142.861 Y138.062 I-6.423 J-3.852 E.07103
G1 X125.003 Y120.204 E.52385
G1 X126.197 Y120.204 E.02475
G1 X110.778 Y135.622 E.45229
G2 X111.822 Y136.956 I5.587 J-3.294 E.03523
M204 S10000
G1 X146.547 Y117.14 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419992
G1 F11286
M204 S6000
G1 X146.497 Y116.815 E.00634
G1 X146.255 Y116.532 E.00718
G1 X145.905 Y116.453 E.00692
G1 X110.095 Y116.453 E.69024
G1 X109.745 Y116.532 E.00692
G1 X109.503 Y116.815 E.00718
G1 X109.453 Y117.14 E.00634
G1 X109.453 Y119.794 E.05116
G1 X146.547 Y119.794 E.71501
G1 X146.547 Y117.2 E.05
M204 S10000
G1 X146.153 Y117.14 F42000
G1 F11286
M204 S6000
G1 X146.133 Y116.967 E.00336
G1 X146.033 Y116.867 E.00272
G1 X144.876 Y116.847 E.0223
G1 X110.121 Y116.847 E.66992
G1 X109.967 Y116.867 E.003
G1 X109.867 Y116.967 E.00272
G2 X109.847 Y119.4 I69.3 J1.795 E.0469
G1 X146.153 Y119.4 E.69981
G1 X146.153 Y117.2 E.0424
M204 S10000
G1 X145.759 Y117.241 F42000
G1 F11286
M204 S6000
G1 X110.241 Y117.241 E.68461
G1 X110.241 Y119.006 E.03401
G1 X145.759 Y119.006 E.68461
G1 X145.759 Y117.301 E.03286
M204 S10000
G1 X145.365 Y117.635 F42000
G1 F11286
M204 S6000
G1 X110.635 Y117.635 E.66942
G1 X110.635 Y118.612 E.01882
G1 X145.365 Y118.612 E.66942
G1 X145.365 Y117.695 E.01766
M204 S10000
G1 X111.124 Y118.124 F42000
; LINE_WIDTH: 0.607692
G1 F10310.341
M204 S6000
G1 X144.816 Y118.124 E.95865
; CHANGE_LAYER
; Z_HEIGHT: 1.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10310.341
G1 X142.816 Y118.124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/83
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.8 I.021 J-1.217 P1  F42000
G1 X109.043 Y117.542 Z1.8
G1 Z1.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P42 R13
G1 F11589
M204 S6000
G1 X109.043 Y117.068 E.00982
G3 X109.33 Y116.33 I1.115 J.008 E.0168
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.957 Y117.068 E.00656
G1 X146.957 Y130.966 E.28826
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.02429
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y117.602 E.27719
M204 S10000
G1 X108.619 Y117.542 F42000
G1 F11589
M204 S6000
G1 X108.619 Y117.041 E.0104
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.985 Y115.623 E.74558
G1 X146.356 Y115.671 E.00775
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y130.98 E.28913
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y117.602 E.27748
M204 S10000
G1 X108.21 Y117.542 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11589
M204 S5000
G1 X108.21 Y117.014 E.01018
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.039 Y115.217 E.69441
G1 X146.463 Y115.273 E.00824
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y130.993 E.26946
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y117.602 E.25812
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.22354
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.734 Y115.738 E-.17639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.92
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.92 F4000
            G39.3 S1
            G0 Z1.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.898 F42000
G1 Z1.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11589
M204 S6000
G1 X109.406 Y122.595 E.0352
G1 X111.793 Y120.208 E.07001
G1 X110.608 Y120.208 E.02458
G1 X129.994 Y139.594 E.56867
G1 X130.806 Y139.594 E.01684
G1 X146.594 Y123.806 E.46313
G1 X146.594 Y122.595 E.02512
G1 X144.207 Y120.208 E.07001
G1 X145.392 Y120.208 E.02458
G1 X126.006 Y139.594 E.56867
G1 X125.194 Y139.594 E.01684
G1 X109.406 Y123.806 E.46313
G1 X109.406 Y127.394 E.07444
G1 X116.593 Y120.208 E.21081
G1 X115.408 Y120.208 E.02458
G1 X134.794 Y139.594 E.56867
G1 X135.606 Y139.594 E.01684
G1 X146.594 Y128.606 E.32233
G1 X146.594 Y127.394 E.02512
G1 X139.407 Y120.208 E.21081
G1 X140.592 Y120.208 E.02458
G1 X121.206 Y139.594 E.56867
G1 X120.394 Y139.594 E.01684
G1 X109.406 Y128.606 E.32233
G2 X109.483 Y132.118 I26.833 J1.174 E.07292
G1 X121.393 Y120.208 E.34937
G1 X120.208 Y120.208 E.02458
G1 X139.451 Y139.451 E.5645
G2 X140.947 Y139.052 I-.768 J-5.879 E.03219
G1 X146.052 Y133.947 E.14978
G2 X146.517 Y132.118 I-11.74 J-3.958 E.03918
G1 X134.607 Y120.208 E.34937
G1 X135.792 Y120.208 E.02458
G1 X116.549 Y139.451 E.5645
G3 X115.053 Y139.052 I.768 J-5.878 E.03219
G1 X109.948 Y133.947 E.14978
G3 X109.524 Y132.326 I5.942 J-2.42 E.03485
M204 S10000
G1 X111.822 Y136.956 F42000
G1 F11589
M204 S6000
M73 P42 R12
G3 X110.778 Y135.622 I4.544 J-4.628 E.03523
G1 X126.192 Y120.208 E.45216
G1 X125.008 Y120.208 E.02458
G1 X142.861 Y138.062 E.52373
G2 X145.222 Y135.622 I-4.062 J-6.292 E.07103
G1 X129.807 Y120.208 E.45216
G1 X130.992 Y120.208 E.02458
G1 X113.139 Y138.062 E.52372
G3 X111.84 Y136.977 I5.928 J-8.417 E.03515
; WIPE_START
G1 F14142.679
G1 X112.77 Y137.815 E-.47616
G1 X113.139 Y138.062 E-.16832
G1 X113.354 Y137.847 E-.11553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.847 Y133.835 Z1.92 F42000
G1 X145.067 Y118.257 Z1.92
G1 Z1.52
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.349562
G1 F11589
M204 S2000
G1 X145.067 Y117.933 E.00513
G1 X110.933 Y117.933 E.54041
G1 X110.933 Y118.257 E.00513
G1 X145.007 Y118.257 E.53946
M204 S10000
G1 X145.426 Y118.616 F42000
; LINE_WIDTH: 0.419992
G1 F11589
M204 S2000
G1 X145.426 Y117.574 E.02008
G1 X110.574 Y117.574 E.67179
G1 X110.574 Y118.616 E.02008
G1 X145.366 Y118.616 E.67063
M204 S10000
G1 X145.82 Y119.01 F42000
G1 F11589
M204 S2000
G1 X145.82 Y117.18 E.03528
G1 X110.18 Y117.18 E.68698
G1 X110.18 Y119.01 E.03528
G1 X145.76 Y119.01 E.68583
M204 S10000
G1 X146.215 Y119.404 F42000
G1 F11589
M204 S2000
G1 X146.215 Y117.14 E.04364
G1 X146.157 Y116.88 E.00514
G1 X146.026 Y116.804 E.00291
G1 X144.905 Y116.785 E.0216
G1 X110.117 Y116.785 E.67055
G1 X109.88 Y116.843 E.00471
G1 X109.804 Y116.974 E.00291
G2 X109.785 Y119.404 I72.446 J1.775 E.04684
G1 X146.155 Y119.404 E.70103
M204 S10000
G1 X146.609 Y119.799 F42000
G1 F11589
M204 S2000
G1 X146.609 Y117.14 E.05124
G1 X146.547 Y116.774 E.00717
G1 X146.422 Y116.578 E.00447
G1 X146.154 Y116.424 E.00595
G1 X145.86 Y116.391 E.00571
G1 X110.091 Y116.391 E.68945
G1 X109.702 Y116.483 E.00771
G1 X109.483 Y116.702 E.00596
G1 X109.391 Y117.091 E.00772
G1 X109.391 Y119.799 E.05218
G1 X146.549 Y119.799 E.71622
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F12000
M204 S6000
G1 X144.549 Y119.799 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/83
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z1.92 I.002 J-1.217 P1  F42000
G1 X109.043 Y119.749 Z1.92
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10684
M204 S6000
G1 X146.957 Y119.749 E.78641
G1 X146.957 Y130.966 E.23265
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
M73 P43 R12
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.809 E.23141
M204 S10000
G1 X108.619 Y119.325 F42000
G1 F10684
M204 S6000
G1 X147.381 Y119.325 E.80401
G1 X147.381 Y130.98 E.24174
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.385 E.2405
M204 S10000
G1 X108.21 Y118.916 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10684
M204 S5000
G1 X147.79 Y118.916 E.76293
G1 X147.79 Y130.993 E.23279
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.976 E.23164
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y118.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.04
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.04 F4000
            G39.3 S1
            G0 Z2.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.703 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10684
M204 S6000
G1 X109.406 Y120.112 E.01225
G1 X110.513 Y120.112 E.02295
G1 X129.994 Y139.594 E.57147
G1 X130.806 Y139.594 E.01684
G1 X146.594 Y123.806 E.46313
G1 X146.594 Y122.595 E.02512
G1 X144.111 Y120.112 E.07282
G1 X145.487 Y120.112 E.02854
G1 X126.006 Y139.594 E.57147
G1 X125.194 Y139.594 E.01684
G1 X109.406 Y123.806 E.46313
G1 X109.406 Y122.595 E.02512
G1 X111.889 Y120.112 E.07282
G1 X113.586 Y120.112 E.0352
M204 S10000
G1 X109.524 Y132.326 F42000
G1 F10684
M204 S6000
G2 X109.948 Y133.947 I6.366 J-.8 E.03485
G1 X115.053 Y139.052 E.14978
G2 X116.549 Y139.451 I2.263 J-5.48 E.03219
G1 X135.888 Y120.112 E.5673
G1 X134.512 Y120.112 E.02854
G1 X146.517 Y132.118 E.35218
G3 X146.052 Y133.947 I-12.201 J-2.129 E.03918
G1 X140.947 Y139.052 E.14978
G3 X139.451 Y139.451 I-2.263 J-5.48 E.03219
G1 X120.112 Y120.112 E.5673
G1 X121.488 Y120.112 E.02854
G1 X109.483 Y132.118 E.35218
G3 X109.406 Y130.423 I12.889 J-1.429 E.03521
M204 S10000
G1 X111.84 Y136.977 F42000
G1 F10684
M204 S6000
G2 X113.139 Y138.062 I7.227 J-7.333 E.03515
G1 X131.088 Y120.112 E.52653
G1 X129.712 Y120.112 E.02854
G1 X145.222 Y135.622 E.45496
G3 X142.861 Y138.062 I-6.423 J-3.852 E.07103
G1 X124.912 Y120.112 E.52653
G1 X126.288 Y120.112 E.02854
G1 X110.778 Y135.622 E.45496
G2 X111.822 Y136.956 I5.587 J-3.294 E.03523
M204 S10000
G1 X137.615 Y120.112 F42000
G1 F10684
M204 S6000
G1 X139.312 Y120.112 E.0352
G1 X146.594 Y127.394 E.21362
G1 X146.594 Y128.606 E.02512
G1 X135.606 Y139.594 E.32233
G1 X134.794 Y139.594 E.01684
G1 X115.312 Y120.112 E.57147
G1 X116.688 Y120.112 E.02854
G1 X109.406 Y127.394 E.21362
G1 X109.406 Y128.606 E.02512
G1 X120.394 Y139.594 E.32233
G1 X121.206 Y139.594 E.01684
G1 X140.688 Y120.112 E.57147
G1 X142.385 Y120.112 E.0352
; WIPE_START
G1 F14142.679
G1 X140.688 Y120.112 E-.64486
G1 X140.473 Y120.327 E-.11515
; WIPE_END
G1 E-.03999 F1800
M204 S10000
G1 X132.882 Y119.538 Z2.04 F42000
G1 X109.044 Y117.062 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10684
M204 S6000
G3 X109.33 Y116.33 I1.109 J.011 E.01666
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.956 Y117.062 I-.289 J.957 E.02691
G1 X109.104 Y117.062 E.78513
M204 S10000
G1 X108.619 Y117.486 F42000
G1 F10684
M204 S6000
G3 X108.671 Y116.644 I3.225 J-.223 E.01756
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.994 Y115.624 E.74576
G1 X146.356 Y115.671 E.00758
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.486 E.00925
G1 X108.679 Y117.486 E.80277
M204 S10000
G1 X108.21 Y117.896 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10684
M204 S5000
G1 X108.21 Y117.014 E.017
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.047 Y115.218 E.69457
G1 X146.463 Y115.273 E.00808
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.896 E.017
G1 X108.27 Y117.896 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.33586
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.554 Y115.972 E-.06407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.348 Y116.674 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.567733
G1 F10684
M204 S6000
G1 X109.884 Y116.567 E.01448
; LINE_WIDTH: 0.61999
G1 F10096.967
G1 X110.102 Y116.553 E.00635
G1 X145.898 Y116.553 E1.04002
G1 X146.116 Y116.567 E.00634
; LINE_WIDTH: 0.567686
G1 F10684
G1 X146.652 Y116.674 E.01448
; CHANGE_LAYER
; Z_HEIGHT: 1.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F11071.455
G1 X146.116 Y116.567 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/83
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.04 I-.104 J-1.212 P1  F42000
G1 X109.043 Y119.754 Z2.04
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10715
M204 S6000
G1 X146.957 Y119.754 E.78641
G1 X146.957 Y130.966 E.23257
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.02429
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.814 E.23132
M204 S10000
G1 X108.619 Y119.329 F42000
G1 F10715
M204 S6000
G1 X147.381 Y119.329 E.80401
G1 X147.381 Y130.98 E.24165
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.389 E.24041
M204 S10000
G1 X108.21 Y118.92 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10715
M204 S5000
G1 X147.79 Y118.92 E.76293
G1 X147.79 Y130.993 E.23271
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X143.318 Y139.195 E.01486
G1 X142.895 Y139.478 E.00982
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
M73 P44 R12
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.98 E.23155
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y118.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.16
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.16 F4000
            G39.3 S1
            G0 Z2.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X118.381 Y120.116 F42000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10715
M204 S6000
G1 X116.684 Y120.116 E.0352
G1 X109.406 Y127.394 E.21349
G1 X109.406 Y128.606 E.02512
G1 X120.394 Y139.594 E.32233
G1 X121.206 Y139.594 E.01684
G1 X140.683 Y120.116 E.57135
G1 X139.316 Y120.116 E.02837
G1 X146.594 Y127.394 E.21349
G1 X146.594 Y128.606 E.02512
G1 X135.606 Y139.594 E.32233
G1 X134.794 Y139.594 E.01684
G1 X115.317 Y120.116 E.57135
G1 X113.62 Y120.116 E.0352
M204 S10000
G1 X109.406 Y130.423 F42000
G1 F10715
M204 S6000
G2 X109.483 Y132.118 I12.965 J.265 E.03521
G1 X121.484 Y120.116 E.35205
G1 X120.116 Y120.116 E.02837
G1 X139.451 Y139.451 E.56718
G2 X140.947 Y139.052 I-.768 J-5.878 E.03219
G1 X146.052 Y133.947 E.14978
G2 X146.517 Y132.118 I-11.74 J-3.958 E.03918
G1 X134.516 Y120.116 E.35205
G1 X135.884 Y120.116 E.02837
G1 X116.549 Y139.451 E.56718
G3 X115.053 Y139.052 I.768 J-5.879 E.03219
G1 X109.948 Y133.947 E.14978
G3 X109.524 Y132.326 I5.942 J-2.42 E.03485
M204 S10000
G1 X111.822 Y136.956 F42000
G1 F10715
M204 S6000
G3 X110.778 Y135.622 I4.544 J-4.628 E.03523
G1 X126.284 Y120.116 E.45484
G1 X124.916 Y120.116 E.02837
G1 X142.861 Y138.062 E.52641
G2 X145.222 Y135.622 I-4.062 J-6.292 E.07103
G1 X129.716 Y120.116 E.45484
G1 X131.084 Y120.116 E.02837
G1 X113.139 Y138.062 E.52641
G3 X111.84 Y136.977 I5.928 J-8.418 E.03515
M204 S10000
G1 X146.594 Y120.703 F42000
G1 F10715
M204 S6000
G1 X146.594 Y120.116 E.01216
G1 X145.483 Y120.116 E.02304
G1 X126.006 Y139.594 E.57135
G1 X125.194 Y139.594 E.01684
G1 X109.406 Y123.806 E.46313
G1 X109.406 Y122.595 E.02512
G1 X111.884 Y120.116 E.07269
G1 X110.517 Y120.116 E.02837
G1 X129.994 Y139.594 E.57135
G1 X130.806 Y139.594 E.01684
G1 X146.594 Y123.806 E.46313
G1 X146.594 Y122.595 E.02512
G1 X144.116 Y120.116 E.07269
G1 X142.419 Y120.116 E.0352
; WIPE_START
G1 F14142.679
G1 X144.116 Y120.116 E-.64486
G1 X144.33 Y120.331 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.73 Y119.628 Z2.16 F42000
G1 X109.044 Y117.066 Z2.16
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10715
M204 S6000
G3 X109.33 Y116.33 I1.113 J.009 E.01675
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.947 Y116.045 E.7442
G3 X146.915 Y116.755 I.014 J.997 E.02672
G1 X146.956 Y117.066 E.00652
G1 X109.104 Y117.066 E.78516
M204 S10000
G1 X108.619 Y117.491 F42000
G1 F10715
M204 S6000
G3 X108.671 Y116.644 I3.241 J-.225 E.01764
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X146.002 Y115.625 E.74593
G3 X147.329 Y116.644 I-.038 J1.422 E.03709
G3 X147.381 Y117.491 I-3.189 J.622 E.01764
G1 X108.679 Y117.491 E.80277
M204 S10000
G1 X108.21 Y117.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10715
M204 S5000
G1 X108.21 Y117.014 E.01708
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.055 Y115.219 E.69473
G1 X146.463 Y115.273 E.00792
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.9 E.01708
G1 X108.27 Y117.9 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.33745
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.551 Y115.975 E-.06249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.347 Y116.676 Z2.16 F42000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.572052
G1 F10715
M204 S6000
G1 X109.885 Y116.569 E.01464
; LINE_WIDTH: 0.624181
G1 F10026.26
G1 X110.102 Y116.555 E.00638
G1 X145.898 Y116.555 E1.04734
G1 X146.115 Y116.569 E.00637
; LINE_WIDTH: 0.572072
G1 F10715
G1 X146.653 Y116.676 E.01464
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10982.57
G1 X146.115 Y116.569 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/83
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.16 I-.104 J-1.212 P1  F42000
G1 X109.043 Y119.758 Z2.16
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11536
M204 S6000
G1 X146.957 Y119.758 E.78641
G1 X146.957 Y130.966 E.23248
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.02429
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.818 E.23123
M204 S10000
G1 X108.619 Y119.334 F42000
G1 F11536
M204 S6000
G1 X147.381 Y119.334 E.80401
G1 X147.381 Y130.98 E.24157
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.394 E.24032
M204 S10000
G1 X108.21 Y118.924 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11536
M204 S5000
G1 X147.79 Y118.924 E.76293
G1 X147.79 Y130.993 E.23263
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X143.253 Y139.239 E.01638
G1 X142.895 Y139.478 E.00831
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.984 E.23147
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y118.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.28
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.28 F4000
            G39.3 S1
            G0 Z2.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.703 F42000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11536
M204 S6000
G1 X109.406 Y120.121 E.01208
G1 X110.521 Y120.121 E.02312
G1 X110.768 Y120.367 E.00723
G1 X110.62 Y120.515 E.00434
G1 X110.915 Y120.515 E.00613
G1 X129.6 Y139.199 E.54809
G1 X131.2 Y139.199 E.0332
G1 X146.199 Y124.2 E.43999
G1 X146.199 Y122.2 E.04148
G1 X144.514 Y120.515 E.04944
G1 X144.219 Y120.515 E.00613
G1 X144.366 Y120.367 E.00433
G1 X144.12 Y120.121 E.00723
G1 X141.734 Y120.121 E.04949
G1 X142.128 Y120.515 E.01157
G1 X140.285 Y120.515 E.03823
G1 X121.6 Y139.199 E.54809
G1 X120 Y139.199 E.0332
G1 X109.801 Y129 E.29919
G1 X109.801 Y127 E.04148
G1 X116.286 Y120.515 E.19023
G1 X117.945 Y120.515 E.03442
G1 X117.551 Y120.121 E.01157
G1 X120.121 Y120.121 E.05331
G1 X120.367 Y120.367 E.00723
G1 X120.219 Y120.515 E.00434
G1 X120.515 Y120.515 E.00613
G1 X139.116 Y139.116 E.54565
G2 X141.711 Y138.288 I-1.313 J-8.595 E.05673
G1 X145.288 Y134.711 E.10495
G2 X146.146 Y131.747 I-6.135 J-3.382 E.06453
G1 X134.914 Y120.515 E.32948
G1 X134.619 Y120.515 E.00613
G1 X134.767 Y120.367 E.00434
G1 X134.52 Y120.121 E.00723
G1 X132.188 Y120.121 E.04838
G1 X132.582 Y120.515 E.01157
G1 X130.685 Y120.515 E.03935
G1 X113.423 Y137.777 E.50637
M204 S10000
G1 X111.063 Y135.338 F42000
G1 F11536
M204 S6000
G1 X125.885 Y120.515 E.43481
G1 X127.491 Y120.515 E.0333
G1 X127.097 Y120.121 E.01157
G1 X129.72 Y120.121 E.05442
M73 P45 R12
G1 X129.967 Y120.367 E.00723
G1 X129.819 Y120.515 E.00434
G1 X130.115 Y120.515 E.00613
G1 X144.937 Y135.338 E.43481
M204 S10000
G1 X146.594 Y120.703 F42000
G1 F11536
M204 S6000
G1 X146.594 Y120.121 E.01208
G1 X145.479 Y120.121 E.02312
G1 X145.197 Y120.402 E.00826
G1 X145.31 Y120.515 E.00331
G1 X145.085 Y120.515 E.00468
G1 X126.4 Y139.199 E.54809
G1 X124.8 Y139.199 E.0332
G1 X109.801 Y124.2 E.43999
G1 X109.801 Y122.2 E.04148
G1 X111.486 Y120.515 E.04944
G1 X113.49 Y120.515 E.04157
G1 X113.096 Y120.121 E.01157
G1 X115.321 Y120.121 E.04615
G1 X134.4 Y139.199 E.55966
G1 X136 Y139.199 E.0332
G1 X146.199 Y129 E.29919
G1 X146.199 Y127 E.04148
G1 X139.714 Y120.515 E.19024
G1 X139.419 Y120.515 E.00613
G1 X139.566 Y120.367 E.00434
G1 X139.32 Y120.121 E.00723
G1 X136.643 Y120.121 E.05554
G1 X137.037 Y120.515 E.01157
G1 X135.485 Y120.515 E.03219
G1 X116.884 Y139.116 E.54565
G3 X114.289 Y138.288 I1.313 J-8.596 E.05672
G1 X110.712 Y134.711 E.10495
G3 X109.854 Y131.747 I6.135 J-3.382 E.06453
G1 X121.086 Y120.515 E.32948
G1 X123.036 Y120.515 E.04046
G1 X122.642 Y120.121 E.01157
G1 X124.92 Y120.121 E.04727
G1 X142.577 Y137.777 E.51794
M204 S10000
G1 X141.214 Y120.136 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.365752
G1 F11536
M204 S6000
G1 X140.206 Y120.136 E.01676
M204 S10000
G1 X136.123 Y120.136 F42000
G1 F11536
M204 S6000
G1 X135.593 Y120.136 E.00881
M204 S10000
G1 X131.668 Y120.136 F42000
G1 F11536
M204 S6000
G1 X130.637 Y120.136 E.01714
M204 S10000
G1 X126.577 Y120.136 F42000
G1 F11536
M204 S6000
G1 X125.653 Y120.136 E.01537
M204 S10000
G1 X122.122 Y120.136 F42000
G1 F11536
M204 S6000
G1 X121.067 Y120.136 E.01755
M204 S10000
G1 X117.031 Y120.136 F42000
G1 F11536
M204 S6000
G1 X116.09 Y120.136 E.01565
M204 S10000
G1 X112.576 Y120.136 F42000
G1 F11536
M204 S6000
G1 X111.494 Y120.136 E.01798
M204 S10000
G1 X109.422 Y121.896 F42000
G1 F11536
M204 S6000
G1 X109.422 Y123.831 E.03217
G1 X109.492 Y124.058 E.00395
G1 X109.422 Y124.206 E.00272
G1 X109.422 Y130.953 E.11217
G1 X109.501 Y132.13 E.0196
G1 X109.721 Y133.23 E.01865
G1 X110.083 Y134.291 E.01864
G1 X110.58 Y135.296 E.01864
G1 X111.204 Y136.228 E.01864
G1 X111.945 Y137.07 E.01864
G1 X112.772 Y137.796 E.01828
G1 X113.703 Y138.42 E.01864
G1 X114.709 Y138.917 E.01864
G1 X115.791 Y139.285 E.019
G1 X116.892 Y139.502 E.01864
G1 X118.047 Y139.578 E.01924
G1 X137.953 Y139.578 E.33092
G1 X139.108 Y139.502 E.01924
G1 X140.209 Y139.285 E.01865
G1 X141.291 Y138.917 E.019
G1 X142.297 Y138.42 E.01865
G1 X143.211 Y137.809 E.01828
G1 X144.055 Y137.07 E.01865
G1 X144.809 Y136.211 E.01901
G1 X145.42 Y135.297 E.01828
G1 X145.917 Y134.291 E.01864
G1 X146.285 Y133.209 E.019
G1 X146.502 Y132.108 E.01865
G1 X146.578 Y130.953 E.01924
G1 X146.578 Y122.378 E.14255
; WIPE_START
G1 F16800
G1 X146.578 Y124.378 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.086 Y122.92 Z2.28 F42000
G1 X109.043 Y117.07 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11536
M204 S6000
G3 X109.33 Y116.33 I1.116 J.007 E.01684
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.955 Y116.047 E.74437
G3 X146.915 Y116.755 I.008 J.994 E.02655
G1 X146.957 Y117.07 E.00661
G1 X109.103 Y117.07 E.78518
M204 S10000
G1 X108.619 Y117.495 F42000
G1 F11536
M204 S6000
G3 X108.671 Y116.644 I3.257 J-.227 E.01773
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X146.01 Y115.626 E.7461
G3 X147.329 Y116.644 I-.044 J1.419 E.03692
G3 X147.381 Y117.495 I-3.205 J.624 E.01773
G1 X108.679 Y117.495 E.80277
M204 S10000
G1 X108.21 Y117.904 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11536
M204 S5000
G1 X108.21 Y117.014 E.01716
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.064 Y115.22 E.69489
G1 X146.463 Y115.273 E.00776
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.904 E.01716
G1 X108.27 Y117.904 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.33904
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.549 Y115.979 E-.0609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.346 Y116.678 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.576437
G1 F10895.527
M204 S6000
G1 X109.885 Y116.571 E.0148
; LINE_WIDTH: 0.627567
G1 F9969.844
G1 X110.102 Y116.557 E.0064
G1 X145.907 Y116.558 E1.05354
G1 X146.613 Y116.604 E.0208
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9969.844
G1 X145.907 Y116.558 E-.26858
G1 X144.614 Y116.558 E-.49142
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/83
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S183.6
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.28 I-.109 J-1.212 P1  F42000
G1 X109.043 Y119.762 Z2.28
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.957 Y119.762 E.78641
G1 X146.957 Y130.966 E.23239
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.822 E.23115
M204 S10000
G1 X108.619 Y119.338 F42000
G1 F14142.679
M204 S6000
G1 X147.381 Y119.338 E.80401
G1 X147.381 Y130.98 E.24148
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.398 E.24023
M204 S10000
G1 X108.21 Y118.929 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.79 Y118.929 E.76293
G1 X147.79 Y130.993 E.23255
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.989 E.23139
; WIPE_START
M204 S6000
G1 X110.21 Y118.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.525 Y120.125 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X110.768 Y120.367 E.00711
M204 S10000
G1 X115.325 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X115.567 Y120.367 E.00711
M204 S10000
G1 X120.125 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X120.367 Y120.367 E.00711
M204 S10000
G1 X124.925 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X125.167 Y120.367 E.00711
M204 S10000
G1 X129.724 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X129.967 Y120.367 E.00711
M204 S10000
G1 X134.524 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X134.767 Y120.367 E.00711
M204 S10000
G1 X139.324 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X139.567 Y120.367 E.00711
M204 S10000
G1 X142.427 Y120.125 F42000
G1 F14142.679
M204 S6000
G1 X144.124 Y120.125 E.0352
G1 X144.366 Y120.367 E.00711
G1 X143.166 Y121.554 E.035
M204 S10000
G1 X144.62 Y120.445 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40277
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X146.581 Y122.406 E.14395
G1 X146.581 Y123.047 E.03324
G1 X144.443 Y120.909 E.15695
G1 X144.123 Y121.229 E.0235
G1 X146.581 Y123.687 E.18045
G1 X146.581 Y124.327 E.03324
G1 X143.803 Y121.549 E.20395
G1 X143.483 Y121.869 E.0235
G1 X146.581 Y124.968 E.22746
G1 X146.581 Y125.608 E.03324
G1 X141.111 Y120.138 E.40159
G1 X140.47 Y120.138 E.03324
G1 X146.581 Y126.248 E.4486
G1 X146.581 Y126.888 E.03324
G1 X140.122 Y120.43 E.47416
G1 X139.802 Y120.75 E.0235
G1 X146.581 Y127.529 E.49766
G1 X146.581 Y128.169 E.03324
G1 X139.482 Y121.07 E.52117
G1 X139.162 Y121.39 E.0235
G1 X146.581 Y128.809 E.54467
G1 X146.581 Y129.45 E.03324
G1 X138.842 Y121.71 E.56817
G1 X138.521 Y122.031 E.0235
G1 X146.581 Y130.09 E.59168
G1 X146.581 Y130.73 E.03324
G1 X135.988 Y120.138 E.77765
G1 X135.615 Y120.138 E.0194
G1 X135.481 Y120.271 E.00979
G1 X146.555 Y131.345 E.81299
G1 X146.516 Y131.946 E.03126
G1 X135.161 Y120.591 E.8336
G1 X134.841 Y120.911 E.0235
G1 X146.429 Y132.499 E.85072
G1 X146.323 Y133.033 E.02827
G1 X134.521 Y121.231 E.86643
G1 X134.201 Y121.552 E.0235
G1 X146.18 Y133.531 E.87946
G1 X146.018 Y134.009 E.02621
G1 X133.88 Y121.872 E.89105
G1 X133.6 Y122.152 E.02055
G1 X131.586 Y120.138 E.14786
G1 X131.506 Y120.138 E.00417
G1 X145.834 Y134.466 E1.05191
G1 X145.623 Y134.895 E.02482
G1 X130.866 Y120.138 E1.08339
G1 X130.636 Y120.138 E.01192
G1 X130.624 Y120.328 E.00991
G1 X130.52 Y120.432 E.00765
G1 X145.408 Y135.32 E1.09297
G1 X145.151 Y135.704 E.02396
G1 X130.2 Y120.752 E1.09765
G1 X129.88 Y121.073 E.0235
G1 X144.895 Y136.088 E1.10232
G3 X144.611 Y136.444 I-1.495 J-.902 E.02372
G1 X129.56 Y121.393 E1.10495
G1 X129.239 Y121.713 E.0235
G1 X144.311 Y136.785 E1.10649
M73 P46 R12
G3 X144.005 Y137.119 I-1.42 J-.997 E.02359
G1 X128.919 Y122.033 E1.10749
G1 X128.655 Y122.297 E.0194
G1 X126.495 Y120.138 E.15856
G1 X126.383 Y120.138 E.0058
G1 X143.664 Y137.418 E1.26861
G1 X143.322 Y137.717 E.02355
G1 X125.743 Y120.138 E1.29057
G1 X125.652 Y120.138 E.00473
G1 X125.698 Y120.454 E.01661
G1 X125.559 Y120.594 E.01024
G1 X142.951 Y137.986 E1.27684
G1 X142.567 Y138.243 E.02396
G1 X125.239 Y120.914 E1.27217
G1 X124.919 Y121.234 E.0235
G1 X142.171 Y138.487 E1.26659
G1 X141.742 Y138.698 E.02482
G1 X124.598 Y121.554 E1.25861
G1 X124.278 Y121.874 E.0235
G1 X141.314 Y138.91 E1.25063
G1 X140.839 Y139.075 E.02609
G1 X121.901 Y120.138 E1.3903
G1 X121.261 Y120.138 E.03324
G1 X140.361 Y139.238 E1.40221
G3 X139.843 Y139.36 I-.725 J-1.904 E.02769
G1 X120.918 Y120.435 E1.3894
G1 X120.598 Y120.755 E.0235
G1 X139.309 Y139.467 E1.3737
G3 X138.732 Y139.53 I-.528 J-2.162 E.03023
G1 X120.278 Y121.075 E1.35483
G1 X119.957 Y121.395 E.0235
G1 X138.131 Y139.569 E1.33422
G3 X137.503 Y139.581 I-.403 J-4.791 E.03266
G1 X119.637 Y121.716 E1.31157
G1 X119.317 Y122.036 E.0235
G1 X136.862 Y139.581 E1.28806
G1 X136.222 Y139.581 E.03324
G1 X116.779 Y120.138 E1.42741
G1 X116.138 Y120.138 E.03324
G1 X135.582 Y139.581 E1.42741
G1 X134.941 Y139.581 E.03324
G1 X115.957 Y120.596 E1.39374
G1 X115.637 Y120.916 E.0235
G1 X134.301 Y139.581 E1.37024
G1 X133.661 Y139.581 E.03324
G1 X115.316 Y121.237 E1.34673
G1 X114.996 Y121.557 E.0235
G1 X133.02 Y139.581 E1.32323
G1 X132.38 Y139.581 E.03324
G1 X114.676 Y121.877 E1.29972
G1 X114.455 Y122.098 E.01624
G1 X112.494 Y120.138 E.14392
G1 X112.297 Y120.138 E.01027
G1 X131.74 Y139.581 E1.42741
G1 X131.1 Y139.581 E.03324
G1 X111.656 Y120.138 E1.42741
G1 X111.494 Y120.138 E.00844
G1 X111.469 Y120.284 E.00768
G1 X111.316 Y120.437 E.01129
G1 X130.459 Y139.581 E1.4054
G1 X129.819 Y139.581 E.03324
G1 X110.996 Y120.758 E1.3819
G1 X110.675 Y121.078 E.0235
G1 X129.179 Y139.581 E1.35839
G1 X128.538 Y139.581 E.03324
G1 X110.355 Y121.398 E1.33489
G1 X110.035 Y121.718 E.0235
G1 X127.898 Y139.581 E1.31138
G1 X127.258 Y139.581 E.03324
G1 X109.672 Y121.995 E1.29106
G1 X109.419 Y121.955 E.01327
G1 X109.419 Y122.383 E.02222
G1 X126.617 Y139.581 E1.26259
G1 X125.977 Y139.581 E.03324
G1 X109.419 Y123.023 E1.21558
G1 X109.419 Y123.663 E.03324
M73 P46 R11
G1 X125.337 Y139.581 E1.16857
G1 X124.696 Y139.581 E.03324
G1 X109.419 Y124.304 E1.12157
G1 X109.419 Y124.944 E.03324
G1 X124.056 Y139.581 E1.07456
G1 X123.416 Y139.581 E.03324
M73 P47 R11
G1 X109.419 Y125.584 E1.02755
G1 X109.419 Y126.225 E.03324
G1 X122.775 Y139.581 E.98054
G1 X122.135 Y139.581 E.03324
G1 X109.419 Y126.865 E.93353
G1 X109.419 Y127.505 E.03324
G1 X121.495 Y139.581 E.88653
G1 X120.854 Y139.581 E.03324
G1 X109.419 Y128.145 E.83952
G1 X109.419 Y128.786 E.03324
G1 X120.214 Y139.581 E.79251
G1 X119.574 Y139.581 E.03324
G1 X109.419 Y129.426 E.7455
G1 X109.419 Y130.066 E.03324
G1 X118.934 Y139.581 E.69849
G1 X118.293 Y139.581 E.03324
G1 X109.419 Y130.707 E.65149
G2 X109.447 Y131.375 I5.109 J.123 E.03473
G1 X117.625 Y139.553 E.60042
G1 X116.94 Y139.508 E.03565
G1 X109.492 Y132.06 E.54682
G1 X109.641 Y132.849 E.0417
G1 X116.151 Y139.359 E.47793
G3 X115.26 Y139.109 I.505 J-3.507 E.04815
G1 X109.891 Y133.74 E.39419
G2 X110.349 Y134.838 I4.401 J-1.191 E.06198
G1 X114.162 Y138.651 E.27988
G3 X113.438 Y138.246 I1.176 J-2.952 E.04316
G1 X112.778 Y137.805 E.04119
G1 X111.945 Y137.075 E.0575
G1 X110.667 Y135.797 E.09385
M106 S183.6
M204 S10000
G1 X146.594 Y120.703 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.12
G1 F14142.679
M204 S6000
G1 X146.594 Y120.125 E.01199
G1 X145.475 Y120.125 E.02321
G1 X145.197 Y120.402 E.00814
G1 X146.397 Y121.602 E.0352
; WIPE_START
G1 X145.197 Y120.402 E-.64486
G1 X145.411 Y120.188 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.807 Y119.537 Z2.4 F42000
G1 X109.043 Y117.075 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14142.679
M204 S6000
G3 X109.33 Y116.33 I1.12 J.004 E.01693
G3 X110.068 Y116.043 I.746 J.828 E.0168
G1 X145.963 Y116.048 E.74455
G3 X146.915 Y116.755 I.002 J.991 E.02637
G1 X146.957 Y117.075 E.00669
G1 X109.103 Y117.075 E.7852
M204 S10000
G1 X108.619 Y117.499 F42000
G1 F14142.679
M204 S6000
G3 X108.671 Y116.644 I3.273 J-.229 E.01782
G3 X110.041 Y115.619 I1.375 J.41 E.038
M73 P48 R11
G1 X146.019 Y115.627 E.74627
G1 X146.356 Y115.671 E.00706
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.499 E.00951
G1 X108.679 Y117.499 E.80277
M204 S10000
G1 X108.21 Y117.908 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.01724
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X146.072 Y115.221 E.69505
G1 X146.463 Y115.273 E.0076
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.908 E.01724
G1 X108.27 Y117.908 E.76178
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.34062
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.546 Y115.982 E-.05931
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.345 Y116.681 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5808
G1 F10809.877
M204 S6000
G1 X109.886 Y116.573 E.01496
; LINE_WIDTH: 0.631405
G1 F9906.67
G1 X110.102 Y116.559 E.00643
G1 X145.916 Y116.56 E1.0605
G1 X146.114 Y116.573 E.0059
; LINE_WIDTH: 0.580791
G1 F10810.058
G1 X146.655 Y116.681 E.01496
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10810.058
G1 X146.114 Y116.573 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/83
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S201.45
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.4 I-.104 J-1.212 P1  F42000
G1 X109.043 Y119.766 Z2.4
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.957 Y119.766 E.78641
G1 X146.957 Y130.966 E.2323
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.826 E.23106
M204 S10000
G1 X108.619 Y119.342 F42000
G1 F14142.679
M204 S6000
G1 X147.381 Y119.342 E.80401
G1 X147.381 Y130.98 E.24139
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.402 E.24015
M204 S10000
G1 X108.21 Y118.933 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.79 Y118.933 E.76293
G1 X147.79 Y130.993 E.23247
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X143.123 Y139.326 E.0194
G1 X142.895 Y139.478 E.00528
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.993 E.23131
; WIPE_START
M204 S6000
G1 X110.21 Y118.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.52
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.52 F4000
            G39.3 S1
            G0 Z2.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.092 Y138.262 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420022
G1 F15217.999
M204 S6000
G1 X111.911 Y137.081 E.03221
G1 X111.173 Y136.239 E.02158
G1 X110.547 Y135.303 E.0217
G1 X110.408 Y135.02 E.00609
G1 X113.98 Y138.592 E.09739
G1 X114.707 Y138.951 E.01562
G1 X114.993 Y139.048 E.00584
G1 X109.952 Y134.007 E.13743
G1 X109.677 Y133.174 E.01691
G1 X115.826 Y139.323 E.16764
G1 X116.522 Y139.462 E.01368
G1 X109.538 Y132.478 E.19039
G3 X109.449 Y131.831 I2.413 J-.664 E.01263
G1 X117.169 Y139.551 E.21048
G1 X117.766 Y139.59 E.01153
G1 X109.41 Y131.234 E.22781
G3 X109.391 Y130.658 I4.385 J-.428 E.01111
G1 X118.342 Y139.609 E.24401
G1 X118.9 Y139.609 E.01075
G1 X109.391 Y130.1 E.25921
G1 X109.391 Y129.543 E.01075
G1 X119.457 Y139.609 E.27441
G1 X120.015 Y139.609 E.01075
G1 X109.391 Y128.985 E.28961
G1 X109.391 Y128.428 E.01075
G1 X120.572 Y139.609 E.30481
G1 X121.13 Y139.609 E.01075
G1 X109.391 Y127.87 E.32001
G1 X109.391 Y127.312 E.01075
G1 X121.688 Y139.609 E.33521
G1 X122.245 Y139.609 E.01075
G1 X109.391 Y126.755 E.35041
G1 X109.391 Y126.197 E.01075
G1 X122.803 Y139.609 E.36561
G1 X123.36 Y139.609 E.01075
G1 X109.391 Y125.64 E.38081
G1 X109.391 Y125.082 E.01075
G1 X123.918 Y139.609 E.39602
G1 X124.475 Y139.609 E.01075
G1 X109.391 Y124.525 E.41122
G1 X109.391 Y123.967 E.01075
G1 X125.033 Y139.609 E.42642
G1 X125.591 Y139.609 E.01075
G1 X109.391 Y123.409 E.44162
G1 X109.391 Y122.852 E.01075
G1 X126.148 Y139.609 E.45682
G1 X126.706 Y139.609 E.01075
G1 X109.879 Y122.782 E.45872
G1 X110.437 Y122.782 E.01075
G1 X127.263 Y139.609 E.45872
G1 X127.821 Y139.609 E.01075
G1 X110.994 Y122.782 E.45872
G1 X111.552 Y122.782 E.01075
G1 X128.379 Y139.609 E.45872
G1 X128.936 Y139.609 E.01075
G1 X112.109 Y122.782 E.45872
G1 X112.667 Y122.782 E.01075
G1 X129.494 Y139.609 E.45872
G1 X130.051 Y139.609 E.01075
G1 X113.225 Y122.782 E.45872
G1 X113.782 Y122.782 E.01075
G1 X130.609 Y139.609 E.45872
G1 X131.166 Y139.609 E.01075
G1 X114.34 Y122.782 E.45872
G1 X114.897 Y122.782 E.01075
G1 X131.724 Y139.609 E.45872
G1 X132.282 Y139.609 E.01075
G1 X115.455 Y122.782 E.45872
G1 X116.013 Y122.782 E.01075
G1 X132.839 Y139.609 E.45872
G1 X133.397 Y139.609 E.01075
G1 X116.57 Y122.782 E.45872
G1 X117.128 Y122.782 E.01075
G1 X133.954 Y139.609 E.45872
G1 X134.512 Y139.609 E.01075
G1 X117.685 Y122.782 E.45872
G1 X118.243 Y122.782 E.01075
G1 X135.07 Y139.609 E.45872
G1 X135.627 Y139.609 E.01075
G1 X118.8 Y122.782 E.45872
G1 X119.358 Y122.782 E.01075
G1 X136.185 Y139.609 E.45872
G1 X136.742 Y139.609 E.01075
G1 X119.916 Y122.782 E.45872
G1 X120.473 Y122.782 E.01075
G1 X137.3 Y139.609 E.45872
G1 X137.857 Y139.609 E.01075
G1 X121.031 Y122.782 E.45872
G1 X121.588 Y122.782 E.01075
G1 X138.387 Y139.58 E.45795
G1 X138.91 Y139.546 E.01011
G1 X122.146 Y122.782 E.45701
G1 X122.704 Y122.782 E.01075
G1 X139.399 Y139.477 E.45514
G1 X139.864 Y139.385 E.00914
G1 X123.261 Y122.782 E.45262
G1 X123.819 Y122.782 E.01075
G1 X140.318 Y139.282 E.4498
G1 X140.735 Y139.14 E.00847
G1 X124.376 Y122.782 E.44595
G1 X124.934 Y122.782 E.01075
G1 X141.151 Y138.999 E.4421
G2 X141.539 Y138.829 I-.45 J-1.559 E.00819
M73 P49 R11
G1 X125.491 Y122.782 E.43748
G1 X126.049 Y122.782 E.01075
G1 X141.912 Y138.645 E.43246
G1 X142.286 Y138.461 E.00803
G1 X126.607 Y122.782 E.42744
G1 X127.164 Y122.782 E.01075
G1 X142.622 Y138.24 E.4214
G1 X142.956 Y138.016 E.00775
G1 X127.722 Y122.782 E.41531
G1 X128.279 Y122.782 E.01075
G1 X143.285 Y137.787 E.40906
G1 X143.582 Y137.527 E.00762
G1 X128.837 Y122.782 E.40196
G1 X129.395 Y122.782 E.01075
G1 X143.879 Y137.266 E.39486
G2 X144.165 Y136.995 I-.889 J-1.222 E.00762
G1 X129.952 Y122.782 E.38745
G1 X130.51 Y122.782 E.01075
G1 X144.425 Y136.697 E.37936
G1 X144.686 Y136.4 E.00762
G1 X131.067 Y122.782 E.37126
G1 X131.625 Y122.782 E.01075
G1 X144.929 Y136.086 E.3627
G1 X145.153 Y135.752 E.00775
G1 X132.182 Y122.782 E.35359
G1 X132.74 Y122.782 E.01075
G1 X145.376 Y135.418 E.34447
G2 X145.574 Y135.058 I-1.269 J-.931 E.00794
G1 X133.298 Y122.782 E.33466
G1 X133.855 Y122.782 E.01075
G1 X145.758 Y134.685 E.32448
G1 X145.942 Y134.311 E.00803
G1 X134.413 Y122.782 E.3143
G1 X134.97 Y122.782 E.01075
G1 X146.085 Y133.897 E.30301
G1 X146.226 Y133.481 E.00847
G1 X135.528 Y122.782 E.29166
G1 X136.085 Y122.782 E.01075
G1 X146.349 Y133.045 E.27979
G1 X146.441 Y132.58 E.00914
G1 X136.643 Y122.782 E.26711
G1 X137.201 Y122.782 E.01075
G1 X146.533 Y132.114 E.2544
G1 X146.567 Y131.591 E.01011
G1 X137.758 Y122.782 E.24014
G1 X138.316 Y122.782 E.01075
G1 X146.601 Y131.067 E.22587
G2 X146.609 Y130.517 I-4.197 J-.332 E.01061
G1 X138.873 Y122.782 E.21087
G1 X139.431 Y122.782 E.01075
G1 X146.609 Y129.96 E.19567
G1 X146.609 Y129.402 E.01075
G1 X139.989 Y122.782 E.18047
G1 X140.546 Y122.782 E.01075
G1 X146.609 Y128.845 E.16527
G1 X146.609 Y128.287 E.01075
G1 X141.104 Y122.782 E.15007
G1 X141.661 Y122.782 E.01075
G1 X146.609 Y127.729 E.13487
G1 X146.609 Y127.172 E.01075
G1 X142.219 Y122.782 E.11967
G1 X142.776 Y122.782 E.01075
G1 X146.609 Y126.614 E.10447
G1 X146.609 Y126.057 E.01075
G1 X143.334 Y122.782 E.08927
G1 X143.892 Y122.782 E.01075
G1 X146.609 Y125.499 E.07407
G1 X146.609 Y124.941 E.01075
G1 X144.449 Y122.782 E.05887
G1 X145.007 Y122.782 E.01075
G1 X146.609 Y124.384 E.04367
G1 X146.609 Y123.826 E.01075
G1 X145.564 Y122.782 E.02847
G1 X146.122 Y122.782 E.01075
G1 X146.786 Y123.446 E.0181
M204 S10000
G1 X146.594 Y120.898 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.594 Y122.373 E.0306
G1 X146.372 Y122.373 E.0046
G1 X144.128 Y120.129 E.06582
G1 X145.471 Y120.129 E.02785
G1 X143.227 Y122.373 E.06582
G1 X141.572 Y122.373 E.03433
G1 X139.328 Y120.129 E.06582
G1 X140.671 Y120.129 E.02785
G1 X138.427 Y122.373 E.06582
G1 X136.772 Y122.373 E.03433
G1 X134.528 Y120.129 E.06582
G1 X135.871 Y120.129 E.02785
G1 X133.627 Y122.373 E.06582
G1 X131.972 Y122.373 E.03433
G1 X129.729 Y120.129 E.06582
G1 X131.071 Y120.129 E.02785
G1 X128.828 Y122.373 E.06582
G1 X127.172 Y122.373 E.03433
G1 X124.929 Y120.129 E.06581
G1 X126.271 Y120.129 E.02785
G1 X124.028 Y122.373 E.06582
G1 X122.373 Y122.373 E.03433
G1 X120.129 Y120.129 E.06581
G1 X121.471 Y120.129 E.02785
G1 X119.228 Y122.373 E.06582
G1 X117.573 Y122.373 E.03433
G1 X115.329 Y120.129 E.06581
G1 X116.672 Y120.129 E.02785
G1 X114.428 Y122.373 E.06582
G1 X112.773 Y122.373 E.03433
G1 X110.529 Y120.129 E.06581
G1 X111.872 Y120.129 E.02785
G1 X109.628 Y122.373 E.06582
G1 X109.406 Y122.373 E.0046
G1 X109.406 Y120.898 E.0306
; WIPE_START
G1 X109.406 Y122.373 E-.56053
G1 X109.628 Y122.373 E-.08433
G1 X109.843 Y122.158 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.042 Y117.079 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14142.679
M204 S6000
G1 X109.085 Y116.755 E.00678
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.971 Y116.049 E.74472
G3 X146.915 Y116.755 I-.004 J.989 E.02619
G1 X146.958 Y117.079 E.00678
G1 X109.102 Y117.079 E.78522
M204 S10000
G1 X108.619 Y117.503 F42000
G1 F14142.679
M204 S6000
G3 X108.671 Y116.644 I3.289 J-.231 E.0179
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X146.027 Y115.628 E.74644
G1 X146.356 Y115.671 E.00689
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.503 E.00959
G1 X108.679 Y117.503 E.80277
M204 S10000
G1 X108.21 Y117.912 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.01732
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.08 Y115.222 E.00183
G1 X146.463 Y115.273 E.00744
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.912 E.01732
G1 X108.27 Y117.912 E.76178
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.34221
G1 X108.273 Y116.537 E-.18268
G1 X108.451 Y116.106 E-.17739
G1 X108.544 Y115.985 E-.05772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.344 Y116.683 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585164
G1 F10725.55
M204 S6000
G1 X109.886 Y116.575 E.01512
; LINE_WIDTH: 0.636762
G1 F9819.802
G1 X110.102 Y116.561 E.00647
G1 X145.898 Y116.561 E1.06934
G1 X146.114 Y116.575 E.00647
; LINE_WIDTH: 0.585156
G1 F10725.709
G1 X146.656 Y116.683 E.01512
; CHANGE_LAYER
; Z_HEIGHT: 2.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10725.709
G1 X146.114 Y116.575 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/83
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.52 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.77 Z2.52
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.957 Y119.77 E.78641
G1 X146.957 Y130.966 E.23222
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.83 E.23097
M204 S10000
G1 X108.619 Y119.346 F42000
G1 F14142.679
M204 S6000
G1 X147.381 Y119.346 E.80401
G1 X147.381 Y130.98 E.24131
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.406 E.24006
M204 S10000
G1 X108.21 Y118.937 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.79 Y118.937 E.76293
G1 X147.79 Y130.993 E.23239
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X143.057 Y139.369 E.02091
G1 X142.895 Y139.478 E.00377
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y118.997 E.23123
; WIPE_START
M204 S6000
G1 X110.21 Y118.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.64
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.64 F4000
            G39.3 S1
            G0 Z2.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.898 F42000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.406 Y122.373 E.0306
G1 X109.628 Y122.373 E.0046
G1 X111.868 Y120.133 E.06569
G1 X110.534 Y120.133 E.02767
G1 X112.773 Y122.373 E.06569
G1 X114.428 Y122.373 E.03433
G1 X116.667 Y120.133 E.06569
G1 X115.333 Y120.133 E.02767
G1 X117.573 Y122.373 E.06569
G1 X119.228 Y122.373 E.03433
G1 X121.467 Y120.133 E.06569
G1 X120.133 Y120.133 E.02767
G1 X122.373 Y122.373 E.06569
G1 X124.028 Y122.373 E.03433
G1 X126.267 Y120.133 E.06569
G1 X124.933 Y120.133 E.02767
G1 X127.172 Y122.373 E.06569
M73 P50 R11
G1 X128.828 Y122.373 E.03433
G1 X131.067 Y120.133 E.06569
G1 X129.733 Y120.133 E.02767
G1 X131.972 Y122.373 E.06569
G1 X133.627 Y122.373 E.03433
G1 X135.867 Y120.133 E.06569
G1 X134.533 Y120.133 E.02767
G1 X136.772 Y122.373 E.06569
G1 X138.427 Y122.373 E.03433
G1 X140.667 Y120.133 E.06569
G1 X139.332 Y120.133 E.02767
G1 X141.572 Y122.373 E.06569
G1 X143.227 Y122.373 E.03433
G1 X145.466 Y120.133 E.06569
G1 X144.132 Y120.133 E.02767
G1 X146.372 Y122.373 E.06569
G1 X146.594 Y122.373 E.0046
G1 X146.594 Y120.898 E.0306
M204 S10000
G1 X141.632 Y138.982 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420022
G1 F15217.999
M204 S6000
G1 X145.591 Y135.022 E.10795
G1 X145.951 Y134.293 E.01566
G1 X146.047 Y134.008 E.0058
G1 X141.008 Y139.047 E.13737
G1 X140.175 Y139.323 E.01691
G1 X146.323 Y133.175 E.16759
G1 X146.461 Y132.479 E.01368
G1 X139.479 Y139.461 E.19034
G3 X138.832 Y139.551 I-.665 J-2.414 E.01264
G1 X146.551 Y131.832 E.21044
G1 X146.59 Y131.235 E.01153
G1 X138.235 Y139.59 E.22778
G3 X137.659 Y139.609 I-.428 J-4.384 E.01112
G1 X146.609 Y130.659 E.24398
G1 X146.609 Y130.101 E.01075
G1 X137.101 Y139.609 E.25918
G1 X136.544 Y139.609 E.01075
G1 X146.609 Y129.544 E.27438
G1 X146.609 Y128.986 E.01075
G1 X135.986 Y139.609 E.28958
G1 X135.429 Y139.609 E.01075
G1 X146.609 Y128.429 E.30478
G1 X146.609 Y127.871 E.01075
G1 X134.871 Y139.609 E.31998
G1 X134.314 Y139.609 E.01075
G1 X146.609 Y127.314 E.33518
G1 X146.609 Y126.756 E.01075
G1 X133.756 Y139.609 E.35038
G1 X133.198 Y139.609 E.01075
G1 X146.609 Y126.198 E.36558
G1 X146.609 Y125.641 E.01075
G1 X132.641 Y139.609 E.38079
G1 X132.083 Y139.609 E.01075
G1 X146.609 Y125.083 E.39599
G1 X146.609 Y124.526 E.01075
G1 X131.526 Y139.609 E.41119
G1 X130.968 Y139.609 E.01075
G1 X146.609 Y123.968 E.42639
G1 X146.609 Y123.41 E.01075
G1 X130.41 Y139.609 E.44159
G1 X129.853 Y139.609 E.01075
G1 X146.609 Y122.853 E.45679
G1 X146.609 Y122.782 E.00137
G1 X146.122 Y122.782 E.00938
G1 X129.295 Y139.609 E.45872
G1 X128.738 Y139.609 E.01075
G1 X145.564 Y122.782 E.45872
G1 X145.007 Y122.782 E.01075
G1 X128.18 Y139.609 E.45872
G1 X127.623 Y139.609 E.01075
G1 X144.449 Y122.782 E.45872
G1 X143.892 Y122.782 E.01075
G1 X127.065 Y139.609 E.45872
G1 X126.507 Y139.609 E.01075
G1 X143.334 Y122.782 E.45872
G1 X142.776 Y122.782 E.01075
G1 X125.95 Y139.609 E.45872
G1 X125.392 Y139.609 E.01075
G1 X142.219 Y122.782 E.45872
G1 X141.661 Y122.782 E.01075
G1 X124.835 Y139.609 E.45872
G1 X124.277 Y139.609 E.01075
G1 X141.104 Y122.782 E.45872
G1 X140.546 Y122.782 E.01075
G1 X123.719 Y139.609 E.45872
G1 X123.162 Y139.609 E.01075
G1 X139.989 Y122.782 E.45872
G1 X139.431 Y122.782 E.01075
G1 X122.604 Y139.609 E.45872
G1 X122.047 Y139.609 E.01075
G1 X138.873 Y122.782 E.45872
G1 X138.316 Y122.782 E.01075
G1 X121.489 Y139.609 E.45872
G1 X120.932 Y139.609 E.01075
G1 X137.758 Y122.782 E.45872
G1 X137.201 Y122.782 E.01075
G1 X120.374 Y139.609 E.45872
G1 X119.816 Y139.609 E.01075
G1 X136.643 Y122.782 E.45872
G1 X136.085 Y122.782 E.01075
G1 X119.259 Y139.609 E.45872
G1 X118.701 Y139.609 E.01075
G1 X135.528 Y122.782 E.45872
G1 X134.97 Y122.782 E.01075
G1 X118.144 Y139.609 E.45872
G3 X117.614 Y139.58 I-.049 J-4.052 E.01023
G1 X134.413 Y122.782 E.45795
G1 X133.855 Y122.782 E.01075
G1 X117.091 Y139.546 E.45701
G3 X116.602 Y139.477 I.016 J-1.891 E.00954
G1 X133.298 Y122.782 E.45514
G1 X132.74 Y122.782 E.01075
G1 X116.137 Y139.385 E.45262
G3 X115.683 Y139.282 I.164 J-1.777 E.00901
G1 X132.182 Y122.782 E.44981
G1 X131.625 Y122.782 E.01075
G1 X115.266 Y139.141 E.44596
G1 X114.85 Y138.999 E.00847
G1 X131.067 Y122.782 E.44211
G1 X130.51 Y122.782 E.01075
G1 X114.462 Y138.83 E.43749
G1 X114.088 Y138.646 E.00803
G1 X129.952 Y122.782 E.43247
G1 X129.394 Y122.782 E.01075
G1 X113.715 Y138.462 E.42745
G3 X113.379 Y138.24 I.671 J-1.384 E.00778
G1 X128.837 Y122.782 E.42141
G1 X128.279 Y122.782 E.01075
G1 X113.045 Y138.017 E.41532
G3 X112.716 Y137.788 I.706 J-1.363 E.00774
G1 X127.722 Y122.782 E.40908
G1 X127.164 Y122.782 E.01075
G1 X112.419 Y137.527 E.40198
G1 X112.122 Y137.267 E.00762
G1 X126.607 Y122.782 E.39487
G1 X126.049 Y122.782 E.01075
G1 X111.836 Y136.995 E.38747
G1 X111.575 Y136.698 E.00762
G1 X125.491 Y122.782 E.37937
G1 X124.934 Y122.782 E.01075
G1 X111.315 Y136.401 E.37127
G3 X111.071 Y136.087 I1.071 J-1.083 E.00768
G1 X124.376 Y122.782 E.36271
G1 X123.819 Y122.782 E.01075
G1 X110.848 Y135.753 E.3536
G1 X110.625 Y135.419 E.00775
G1 X123.261 Y122.782 E.34449
G1 X122.703 Y122.782 E.01075
G1 X110.427 Y135.059 E.33468
G1 X110.243 Y134.685 E.00803
G1 X122.146 Y122.782 E.3245
G1 X121.588 Y122.782 E.01075
G1 X110.059 Y134.312 E.31432
G1 X109.915 Y133.898 E.00845
G1 X121.031 Y122.782 E.30303
G1 X120.473 Y122.782 E.01075
G1 X109.774 Y133.481 E.29168
G3 X109.651 Y133.046 I1.592 J-.682 E.00874
G1 X119.916 Y122.782 E.27981
G1 X119.358 Y122.782 E.01075
G1 X109.559 Y132.581 E.26714
G1 X109.467 Y132.115 E.00915
G1 X118.8 Y122.782 E.25443
G1 X118.243 Y122.782 E.01075
G1 X109.433 Y131.592 E.24017
G1 X109.399 Y131.068 E.01011
G1 X117.685 Y122.782 E.2259
G1 X117.128 Y122.782 E.01075
G1 X109.391 Y130.518 E.2109
G1 X109.391 Y129.961 E.01075
G1 X116.57 Y122.782 E.1957
G1 X116.013 Y122.782 E.01075
G1 X109.391 Y129.403 E.1805
G1 X109.391 Y128.846 E.01075
G1 X115.455 Y122.782 E.1653
G1 X114.897 Y122.782 E.01075
G1 X109.391 Y128.288 E.1501
G1 X109.391 Y127.73 E.01075
G1 X114.34 Y122.782 E.1349
G1 X113.782 Y122.782 E.01075
G1 X109.391 Y127.173 E.1197
G1 X109.391 Y126.615 E.01075
G1 X113.225 Y122.782 E.1045
G1 X112.667 Y122.782 E.01075
G1 X109.391 Y126.058 E.0893
G1 X109.391 Y125.5 E.01075
G1 X112.109 Y122.782 E.0741
G1 X111.552 Y122.782 E.01075
G1 X109.391 Y124.943 E.0589
G1 X109.391 Y124.385 E.01075
G1 X110.994 Y122.782 E.0437
G1 X110.437 Y122.782 E.01075
G1 X109.391 Y123.827 E.0285
G1 X109.391 Y123.27 E.01075
G1 X110.057 Y122.605 E.01813
; WIPE_START
G1 X109.391 Y123.27 E-.35747
G1 X109.391 Y123.827 E-.21188
G1 X109.746 Y123.473 E-.19065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.042 Y117.083 Z2.64 F42000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.085 Y116.755 E.00687
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.98 Y116.05 E.74489
G3 X146.915 Y116.755 I-.01 J.986 E.02602
G1 X146.958 Y117.083 E.00687
G1 X109.102 Y117.083 E.78525
M204 S10000
G1 X108.619 Y117.507 F42000
G1 F14142.679
M204 S6000
G3 X108.671 Y116.644 I3.305 J-.233 E.01799
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X146.035 Y115.629 E.74662
G1 X146.356 Y115.671 E.00671
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.507 E.00968
G1 X108.679 Y117.507 E.80277
M204 S10000
G1 X108.21 Y117.917 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.0174
G1 X108.273 Y116.537 E.00927
M73 P51 R11
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.089 Y115.223 E.00199
G1 X146.463 Y115.273 E.00728
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.917 E.0174
G1 X108.27 Y117.917 E.76178
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.3438
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.541 Y115.989 E-.05613
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.343 Y116.686 Z2.64 F42000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.589518
G1 F10642.717
M204 S6000
G1 X109.887 Y116.577 E.01528
; LINE_WIDTH: 0.640943
G1 F9753.068
G1 X110.103 Y116.563 E.00651
G1 X145.897 Y116.563 E1.07664
G1 X146.113 Y116.577 E.00651
; LINE_WIDTH: 0.589496
G1 F10643.128
G1 X146.657 Y116.686 E.01528
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10643.128
G1 X146.113 Y116.577 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/83
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.64 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.775 Z2.64
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.957 Y119.775 E.78641
G1 X146.957 Y130.966 E.23213
G1 X146.878 Y132.169 E.02501
G1 X146.649 Y133.318 E.02429
G1 X146.273 Y134.427 E.02429
G1 X145.755 Y135.477 E.0243
G1 X145.104 Y136.451 E.02429
G1 X144.332 Y137.332 E.0243
G1 X143.451 Y138.104 E.0243
G1 X142.477 Y138.755 E.02429
G1 X141.427 Y139.273 E.0243
G1 X140.318 Y139.649 E.0243
G1 X139.169 Y139.878 E.02429
G1 X137.966 Y139.957 E.02501
G1 X118.034 Y139.957 E.41342
G1 X116.831 Y139.878 E.02501
G1 X115.682 Y139.649 E.02429
G1 X114.573 Y139.273 E.0243
G1 X113.523 Y138.755 E.0243
G1 X112.549 Y138.104 E.02429
G1 X111.668 Y137.332 E.0243
G1 X110.896 Y136.451 E.0243
G1 X110.245 Y135.477 E.02429
G1 X109.727 Y134.427 E.0243
G1 X109.351 Y133.318 E.02429
G1 X109.122 Y132.169 E.02429
G1 X109.043 Y130.966 E.02501
G1 X109.043 Y119.835 E.23089
M204 S10000
G1 X108.619 Y119.35 F42000
G1 F14142.679
M204 S6000
G1 X147.381 Y119.35 E.80401
G1 X147.381 Y130.98 E.24122
G1 X147.299 Y132.224 E.02588
G1 X147.06 Y133.428 E.02545
G1 X146.665 Y134.589 E.02545
G1 X146.123 Y135.69 E.02545
G1 X145.441 Y136.71 E.02545
G1 X144.632 Y137.632 E.02545
G1 X143.71 Y138.441 E.02545
G1 X142.69 Y139.123 E.02545
G1 X141.589 Y139.665 E.02545
G1 X140.428 Y140.06 E.02545
G1 X139.224 Y140.299 E.02545
G1 X137.98 Y140.381 E.02588
G1 X118.02 Y140.381 E.414
G1 X116.776 Y140.299 E.02588
G1 X115.572 Y140.06 E.02545
G1 X114.411 Y139.665 E.02545
G1 X113.31 Y139.123 E.02545
G1 X112.29 Y138.441 E.02545
G1 X111.368 Y137.632 E.02545
G1 X110.559 Y136.71 E.02545
G1 X109.877 Y135.69 E.02545
G1 X109.335 Y134.589 E.02545
G1 X108.94 Y133.428 E.02545
G1 X108.701 Y132.224 E.02545
G1 X108.619 Y130.98 E.02588
G1 X108.619 Y119.41 E.23997
M204 S10000
G1 X108.21 Y118.941 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.79 Y118.941 E.76293
G1 X147.79 Y130.993 E.23231
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
M73 P51 R10
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y119.001 E.23115
; WIPE_START
M204 S6000
G1 X110.21 Y118.998 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.76
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.76 F4000
            G39.3 S1
            G0 Z2.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.097 Y138.265 F42000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422502
G1 F15122.873
M204 S6000
G1 X111.9 Y137.068 E.03284
G1 X111.173 Y136.239 E.02139
G1 X110.547 Y135.303 E.02183
G1 X110.403 Y135.01 E.00634
G1 X113.99 Y138.597 E.09841
G1 X114.707 Y138.951 E.0155
G1 X115.006 Y139.052 E.00614
G1 X109.948 Y133.994 E.13878
G1 X109.674 Y133.159 E.01704
G1 X115.841 Y139.326 E.16919
G1 X116.542 Y139.465 E.01385
G1 X109.535 Y132.458 E.19222
G3 X109.447 Y131.81 I2.419 J-.655 E.01272
G1 X117.19 Y139.553 E.2124
G1 X117.79 Y139.592 E.01167
G1 X109.408 Y131.21 E.22995
G3 X109.391 Y130.632 I4.401 J-.416 E.01122
G1 X118.368 Y139.609 E.24626
G1 X118.929 Y139.609 E.01088
G1 X109.391 Y130.071 E.26165
G1 X109.391 Y129.51 E.01088
G1 X119.49 Y139.609 E.27705
G1 X120.051 Y139.609 E.01088
G1 X109.391 Y128.949 E.29244
G1 X109.391 Y128.387 E.01088
G1 X120.613 Y139.609 E.30783
G1 X121.174 Y139.609 E.01088
G1 X109.391 Y127.826 E.32322
G1 X109.391 Y127.265 E.01088
G1 X121.735 Y139.609 E.33861
G1 X122.296 Y139.609 E.01088
G1 X109.391 Y126.704 E.35401
G1 X109.391 Y126.143 E.01088
G1 X122.857 Y139.609 E.3694
G1 X123.418 Y139.609 E.01088
G1 X109.391 Y125.582 E.38479
G1 X109.391 Y125.021 E.01088
G1 X123.979 Y139.609 E.40018
G1 X124.54 Y139.609 E.01088
G1 X109.391 Y124.46 E.41558
G1 X109.391 Y123.899 E.01088
G1 X125.101 Y139.609 E.43097
G1 X125.662 Y139.609 E.01088
G1 X109.391 Y123.338 E.44636
G1 X109.391 Y122.777 E.01088
G1 X126.223 Y139.609 E.46175
G1 X126.784 Y139.609 E.01088
G1 X109.646 Y122.47 E.47016
G1 X110.207 Y122.47 E.01088
G1 X127.346 Y139.609 E.47016
G1 X127.907 Y139.609 E.01088
G1 X110.768 Y122.47 E.47016
G1 X111.329 Y122.47 E.01088
G1 X128.468 Y139.609 E.47016
G1 X129.029 Y139.609 E.01088
G1 X111.89 Y122.47 E.47016
G1 X112.451 Y122.47 E.01088
G1 X129.59 Y139.609 E.47016
G1 X130.151 Y139.609 E.01088
G1 X113.012 Y122.47 E.47016
G1 X113.574 Y122.47 E.01088
G1 X130.712 Y139.609 E.47016
G1 X131.273 Y139.609 E.01088
G1 X114.135 Y122.47 E.47016
G1 X114.696 Y122.47 E.01088
G1 X131.834 Y139.609 E.47016
G1 X132.395 Y139.609 E.01088
G1 X115.257 Y122.47 E.47016
G1 X115.818 Y122.47 E.01088
G1 X132.956 Y139.609 E.47016
G1 X133.518 Y139.609 E.01088
G1 X116.379 Y122.47 E.47016
G1 X116.94 Y122.47 E.01088
G1 X134.079 Y139.609 E.47016
G1 X134.64 Y139.609 E.01088
G1 X117.501 Y122.47 E.47016
G1 X118.062 Y122.47 E.01088
G1 X135.201 Y139.609 E.47016
G1 X135.762 Y139.609 E.01088
G1 X118.623 Y122.47 E.47016
G1 X119.184 Y122.47 E.01088
G1 X136.323 Y139.609 E.47016
G1 X136.884 Y139.609 E.01088
G1 X119.746 Y122.47 E.47016
G1 X120.307 Y122.47 E.01088
G1 X137.445 Y139.609 E.47016
G2 X138.003 Y139.605 I.255 J-4.254 E.01083
G1 X120.868 Y122.47 E.47008
G1 X121.429 Y122.47 E.01088
G1 X138.53 Y139.571 E.46913
G1 X139.056 Y139.536 E.01024
G1 X121.99 Y122.47 E.46818
G1 X122.551 Y122.47 E.01088
G1 X139.532 Y139.451 E.46583
G1 X140 Y139.358 E.00926
G1 X123.112 Y122.47 E.46328
G1 X123.673 Y122.47 E.01088
G1 X140.442 Y139.239 E.46003
G1 X140.861 Y139.097 E.00858
G1 X124.234 Y122.47 E.45613
G1 X124.795 Y122.47 E.01088
G1 X141.28 Y138.955 E.45223
G1 X141.657 Y138.771 E.00814
G1 X125.356 Y122.47 E.44718
G1 X125.917 Y122.47 E.01088
G1 X142.033 Y138.586 E.4421
G2 X142.398 Y138.389 I-.564 J-1.484 E.00806
G1 X126.479 Y122.47 E.43671
G1 X127.04 Y122.47 E.01088
G1 X142.734 Y138.165 E.43055
G1 X143.07 Y137.94 E.00785
G1 X127.601 Y122.47 E.42438
G1 X128.162 Y122.47 E.01088
G1 X143.388 Y137.696 E.4177
G1 X143.687 Y137.434 E.00771
G1 X128.723 Y122.47 E.41051
G1 X129.284 Y122.47 E.01088
G1 X143.986 Y137.172 E.40332
G2 X144.26 Y136.885 I-.952 J-1.186 E.00772
G1 X129.845 Y122.47 E.39545
G1 X130.406 Y122.47 E.01088
G1 X144.523 Y136.586 E.38725
G1 X144.785 Y136.287 E.00771
G1 X130.967 Y122.47 E.37905
G1 X131.528 Y122.47 E.01088
G1 X145.016 Y135.957 E.36999
G1 X145.24 Y135.621 E.00785
G1 X132.089 Y122.47 E.36077
G1 X132.651 Y122.47 E.01088
G1 X145.463 Y135.282 E.35148
G1 X145.648 Y134.907 E.00813
G1 X133.212 Y122.47 E.34117
G1 X133.773 Y122.47 E.01088
G1 X145.833 Y134.531 E.33086
G2 X146.003 Y134.139 I-1.402 J-.839 E.0083
G1 X134.334 Y122.47 E.32012
G1 X134.895 Y122.47 E.01088
G1 X146.145 Y133.72 E.30863
G1 X146.287 Y133.301 E.00858
G1 X135.456 Y122.47 E.29714
G1 X136.017 Y122.47 E.01088
G1 X146.389 Y132.842 E.28453
G1 X146.482 Y132.374 E.00926
G1 X136.578 Y122.47 E.2717
G1 X137.139 Y122.47 E.01088
G1 X146.548 Y131.879 E.25811
M73 P52 R10
G1 X146.583 Y131.352 E.01024
G1 X137.7 Y122.47 E.24367
G1 X138.261 Y122.47 E.01088
G1 X146.609 Y130.817 E.22899
G1 X146.609 Y130.256 E.01088
G1 X138.823 Y122.47 E.2136
G1 X139.384 Y122.47 E.01088
G1 X146.609 Y129.695 E.1982
G1 X146.609 Y129.134 E.01088
G1 X139.945 Y122.47 E.18281
G1 X140.506 Y122.47 E.01088
G1 X146.609 Y128.573 E.16742
G1 X146.609 Y128.012 E.01088
G1 X141.067 Y122.47 E.15203
G1 X141.628 Y122.47 E.01088
G1 X146.609 Y127.451 E.13663
G1 X146.609 Y126.89 E.01088
G1 X142.189 Y122.47 E.12124
G1 X142.75 Y122.47 E.01088
G1 X146.609 Y126.329 E.10585
G1 X146.609 Y125.767 E.01088
G1 X143.311 Y122.47 E.09046
G1 X143.872 Y122.47 E.01088
G1 X146.609 Y125.206 E.07507
G1 X146.609 Y124.645 E.01088
G1 X144.433 Y122.47 E.05967
G1 X144.995 Y122.47 E.01088
G1 X146.609 Y124.084 E.04428
G1 X146.609 Y123.523 E.01088
G1 X145.556 Y122.47 E.02889
G1 X146.117 Y122.47 E.01088
G1 X146.786 Y123.139 E.01836
M204 S10000
G1 X146.594 Y120.898 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.594 Y122.061 E.02413
G1 X146.06 Y122.061 E.01107
G1 X144.136 Y120.137 E.05642
G1 X145.462 Y120.137 E.0275
G1 X143.539 Y122.061 E.05642
G1 X141.26 Y122.061 E.04727
G1 X139.337 Y120.137 E.05642
G1 X140.662 Y120.137 E.0275
G1 X138.739 Y122.061 E.05642
G1 X136.46 Y122.061 E.04727
G1 X134.537 Y120.137 E.05642
G1 X135.863 Y120.137 E.0275
G1 X133.939 Y122.061 E.05642
G1 X131.66 Y122.061 E.04727
G1 X129.737 Y120.137 E.05642
G1 X131.063 Y120.137 E.0275
G1 X129.139 Y122.061 E.05642
G1 X126.861 Y122.061 E.04727
G1 X124.937 Y120.137 E.05642
G1 X126.263 Y120.137 E.0275
G1 X124.34 Y122.061 E.05642
G1 X122.061 Y122.061 E.04727
G1 X120.137 Y120.137 E.05642
G1 X121.463 Y120.137 E.0275
G1 X119.54 Y122.061 E.05642
G1 X117.261 Y122.061 E.04727
G1 X115.338 Y120.137 E.05642
G1 X116.663 Y120.137 E.0275
G1 X114.74 Y122.061 E.05642
G1 X112.461 Y122.061 E.04727
G1 X110.538 Y120.137 E.05642
G1 X111.863 Y120.137 E.0275
G1 X109.94 Y122.061 E.05642
G1 X109.406 Y122.061 E.01107
G1 X109.406 Y120.898 E.02413
; WIPE_START
G1 X109.406 Y122.061 E-.44198
G1 X109.94 Y122.061 E-.20287
G1 X110.154 Y121.846 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.041 Y117.087 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14142.679
M204 S6000
G1 X109.085 Y116.755 E.00696
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.988 Y116.051 E.74506
G3 X146.915 Y116.755 I-.016 J.983 E.02584
G1 X146.959 Y117.087 E.00696
G1 X109.101 Y117.087 E.78527
M204 S10000
G1 X108.619 Y117.511 F42000
G1 F14142.679
M204 S6000
G3 X108.671 Y116.644 I3.321 J-.235 E.01808
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X146.043 Y115.63 E.74679
G1 X146.356 Y115.671 E.00654
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.511 E.00977
G1 X108.679 Y117.511 E.80277
M204 S10000
G1 X108.21 Y117.921 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.01748
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.097 Y115.225 E.00215
G1 X146.463 Y115.273 E.00712
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.921 E.01748
G1 X108.27 Y117.921 E.76178
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.34539
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.539 Y115.992 E-.05454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.342 Y116.688 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.593877
G1 F10561.051
M204 S6000
G1 X109.887 Y116.579 E.01544
; LINE_WIDTH: 0.645134
G1 F9687.081
G1 X110.103 Y116.565 E.00654
G1 X145.897 Y116.565 E1.08397
G1 X146.113 Y116.579 E.00654
; LINE_WIDTH: 0.593863
G1 F10561.32
G1 X146.658 Y116.688 E.01544
; CHANGE_LAYER
; Z_HEIGHT: 2.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10561.32
G1 X146.113 Y116.579 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/83
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S198.9
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.76 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.779 Z2.76
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X146.957 Y119.779 E.78641
G1 X146.957 Y122.818 E.06305
G1 X109.043 Y122.818 E.78641
G1 X109.043 Y119.839 E.06181
M204 S10000
G1 X108.619 Y119.355 F42000
G1 F14142.679
M204 S6000
G1 X147.381 Y119.355 E.80401
G1 X147.381 Y123.243 E.08065
G1 X108.619 Y123.243 E.80401
G1 X108.619 Y119.415 E.07941
M204 S10000
G1 X108.21 Y118.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.79 Y118.945 E.76293
G1 X147.79 Y130.993 E.23223
G1 X147.706 Y132.278 E.02482
G1 X147.456 Y133.534 E.02468
G1 X147.044 Y134.746 E.02468
G1 X146.478 Y135.895 E.02468
G1 X145.767 Y136.959 E.02468
G1 X144.922 Y137.922 E.02468
G1 X143.959 Y138.767 E.02468
G1 X142.895 Y139.478 E.02468
G1 X141.746 Y140.044 E.02469
G1 X140.534 Y140.456 E.02468
G1 X139.278 Y140.706 E.02468
G1 X137.993 Y140.79 E.02482
G1 X118.007 Y140.79 E.38524
G1 X116.722 Y140.706 E.02482
G1 X115.466 Y140.456 E.02468
G1 X114.254 Y140.044 E.02468
G1 X113.105 Y139.478 E.02469
G1 X112.041 Y138.767 E.02468
G1 X111.078 Y137.922 E.02468
G1 X110.233 Y136.959 E.02468
G1 X109.522 Y135.895 E.02468
G1 X108.956 Y134.746 E.02468
G1 X108.544 Y133.534 E.02468
G1 X108.294 Y132.278 E.02468
G1 X108.21 Y130.993 E.02482
G1 X108.21 Y119.005 E.23107
; WIPE_START
M204 S6000
G1 X110.21 Y119.002 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.88
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.88 F4000
            G39.3 S1
            G0 Z2.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.898 F42000
G1 Z2.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.406 Y121.801 E.01874
G1 X110.2 Y121.801 E.01645
G1 X111.859 Y120.142 E.04869
G1 X110.542 Y120.142 E.02732
G1 X112.202 Y121.801 E.04869
G1 X114.999 Y121.801 E.05803
G1 X116.659 Y120.142 E.04869
G1 X115.342 Y120.142 E.02732
G1 X117.002 Y121.801 E.04869
G1 X119.799 Y121.801 E.05803
G1 X121.459 Y120.142 E.04869
G1 X120.142 Y120.142 E.02732
G1 X121.801 Y121.801 E.04869
G1 X124.599 Y121.801 E.05803
G1 X126.259 Y120.142 E.04869
G1 X124.941 Y120.142 E.02732
G1 X126.601 Y121.801 E.04869
G1 X129.399 Y121.801 E.05803
G1 X131.059 Y120.142 E.04869
G1 X129.741 Y120.142 E.02732
G1 X131.401 Y121.801 E.04869
G1 X134.199 Y121.801 E.05803
G1 X135.858 Y120.142 E.04869
G1 X134.541 Y120.142 E.02732
G1 X136.201 Y121.801 E.04869
G1 X138.998 Y121.801 E.05803
G1 X140.658 Y120.142 E.04869
G1 X139.341 Y120.142 E.02732
G1 X141.001 Y121.801 E.04869
G1 X143.798 Y121.801 E.05803
G1 X145.458 Y120.142 E.04869
G1 X144.141 Y120.142 E.02732
G1 X145.8 Y121.801 E.04869
G1 X146.594 Y121.801 E.01645
G1 X146.594 Y120.898 E.01874
; WIPE_START
G1 X146.594 Y121.801 E-.34341
G1 X145.8 Y121.801 E-.30145
G1 X145.586 Y121.587 E-.11515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.038 Y127.717 Z2.88 F42000
G1 X137.712 Y132.2 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.376026
G1 F12000
M204 S2000
G1 X138.297 Y132.149 E.01007
G2 X138.838 Y131.841 I-.297 J-1.151 E.01079
G2 X137.706 Y131.848 I-.353 J34.597 E.01939
G1 X118.294 Y131.848 E.33245
G2 X117.162 Y131.841 I-.847 J45.562 E.01939
G2 X117.703 Y132.149 I.838 J-.843 E.01079
G2 X118.294 Y132.2 I.771 J-5.56 E.01017
G1 X137.652 Y132.2 E.33152
M204 S10000
G1 X137.724 Y132.572 F42000
; LINE_WIDTH: 0.419992
G1 F12000
M204 S2000
G1 X138.237 Y132.534 E.00992
G1 X138.624 Y132.422 E.00777
G1 X138.967 Y132.215 E.00772
G1 X139.244 Y131.93 E.00765
G1 X139.438 Y131.589 E.00756
G1 X139.477 Y131.475 E.00232
G1 X116.523 Y131.475 E.44243
G1 X116.661 Y131.788 E.00658
G1 X116.919 Y132.115 E.00802
G1 X117.25 Y132.36 E.00794
G1 X117.631 Y132.508 E.00788
G2 X118.294 Y132.572 I.807 J-4.862 E.01284
G1 X137.664 Y132.572 E.37337
M204 S10000
G1 X137.737 Y132.967 F42000
G1 F12000
M204 S2000
G1 X138.254 Y132.933 E.01
G1 X138.746 Y132.801 E.00981
G1 X139.187 Y132.547 E.00981
G1 X139.547 Y132.187 E.00981
G1 X139.801 Y131.746 E.00981
G1 X139.933 Y131.254 E.00981
G1 X139.944 Y131.081 E.00335
G1 X116.056 Y131.081 E.46045
G1 X116.124 Y131.525 E.00866
G1 X116.333 Y132.007 E.01012
G1 X116.659 Y132.411 E.01001
M73 P53 R10
G1 X117.076 Y132.713 E.00993
G1 X117.554 Y132.895 E.00986
G2 X118.294 Y132.967 I.883 J-5.235 E.01434
G1 X137.677 Y132.967 E.37361
M204 S10000
G1 X137.75 Y133.361 F42000
G1 F12000
M204 S2000
G1 X138.306 Y133.324 E.01074
G1 X138.817 Y133.193 E.01018
G1 X139.24 Y132.985 E.00909
G1 X139.658 Y132.658 E.01022
G1 X139.994 Y132.226 E.01055
G1 X140.184 Y131.843 E.00825
G1 X140.317 Y131.341 E.01
G1 X140.361 Y130.687 E.01264
G1 X115.639 Y130.687 E.47652
G1 X115.673 Y131.27 E.01126
G1 X115.816 Y131.843 E.01138
G1 X116.006 Y132.226 E.00824
G1 X116.342 Y132.658 E.01055
G1 X116.76 Y132.985 E.01022
G1 X117.183 Y133.193 E.00909
G1 X117.694 Y133.324 E.01017
G1 X118.25 Y133.361 E.01074
G1 X137.69 Y133.361 E.37471
M204 S10000
G1 X137.763 Y133.755 F42000
G1 F12000
M204 S2000
G1 X138.358 Y133.716 E.01149
G1 X138.944 Y133.566 E.01167
G1 X139.46 Y133.313 E.01108
G1 X139.861 Y133.004 E.00976
G1 X140.227 Y132.587 E.0107
G1 X140.494 Y132.123 E.01032
G1 X140.661 Y131.637 E.00991
G1 X140.754 Y130.778 E.01666
G2 X140.755 Y130.293 I-7.363 J-.257 E.00935
G1 X115.245 Y130.293 E.49172
G1 X115.28 Y131.296 E.01935
G1 X115.377 Y131.779 E.0095
G1 X115.587 Y132.288 E.01062
G1 X115.89 Y132.74 E.01049
G1 X116.253 Y133.104 E.0099
G1 X116.727 Y133.42 E.01099
G1 X117.291 Y133.646 E.0117
G2 X118.294 Y133.755 I1.011 J-4.638 E.01948
G1 X137.703 Y133.755 E.37411
M204 S10000
G1 X137.776 Y134.149 F42000
G1 F12000
M204 S2000
G1 X138.409 Y134.108 E.01224
G2 X140.896 Y132.2 I-.46 J-3.174 E.06313
G2 X141.149 Y130.748 I-3.954 J-1.438 E.02855
G1 X141.149 Y129.898 E.01637
G1 X114.851 Y129.898 E.50692
G2 X114.892 Y131.409 I11.55 J.439 E.02915
G1 X115.004 Y131.906 E.00981
G1 X115.234 Y132.463 E.01161
G1 X115.513 Y132.908 E.01014
G2 X117.324 Y134.055 I2.533 J-1.997 E.0421
G1 X118.294 Y134.149 E.01879
G1 X137.716 Y134.149 E.37436
M204 S10000
G1 X137.789 Y134.544 F42000
G1 F12000
M204 S2000
G1 X138.461 Y134.5 E.01298
G1 X139.068 Y134.357 E.01203
G1 X139.621 Y134.128 E.01154
G1 X140.149 Y133.8 E.01196
G1 X140.597 Y133.381 E.01183
G1 X140.978 Y132.883 E.01208
G1 X141.261 Y132.351 E.01162
G2 X141.544 Y130.748 I-4.29 J-1.583 E.03154
G1 X141.544 Y129.504 E.02397
G1 X114.456 Y129.504 E.52212
G1 X114.456 Y130.789 E.02476
G1 X114.5 Y131.461 E.01298
G1 X114.631 Y132.032 E.0113
G1 X114.88 Y132.637 E.01261
G1 X115.2 Y133.149 E.01163
G1 X115.619 Y133.597 E.01183
G1 X116.102 Y133.968 E.01175
G1 X116.649 Y134.261 E.01196
G1 X117.247 Y134.441 E.01203
G2 X118.211 Y134.544 I1.087 J-5.649 E.01872
G1 X137.729 Y134.544 E.3762
M204 S10000
G1 X137.801 Y134.938 F42000
G1 F12000
M204 S2000
G1 X138.512 Y134.891 E.01373
G2 X141.891 Y131.512 I-.512 J-3.891 E.09903
G2 X141.938 Y130.748 I-5.808 J-.738 E.01477
G1 X141.938 Y129.11 E.03157
G1 X114.062 Y129.11 E.53731
G1 X114.062 Y130.801 E.0326
G1 X114.109 Y131.512 E.01373
G2 X117.488 Y134.891 I3.891 J-.512 E.09903
G1 X118.199 Y134.938 E.01373
G1 X137.741 Y134.938 E.3767
M204 S10000
G1 X137.814 Y135.332 F42000
G1 F12000
M204 S2000
G1 X138.564 Y135.283 E.01448
G2 X142.283 Y131.564 I-.564 J-4.283 E.109
G2 X142.332 Y130.748 I-6.201 J-.783 E.01577
G1 X142.332 Y128.716 E.03917
G1 X113.668 Y128.716 E.55251
G1 X113.668 Y130.814 E.04045
G1 X113.717 Y131.564 E.01448
G2 X117.436 Y135.283 I4.283 J-.564 E.109
G1 X118.186 Y135.332 E.01448
G1 X137.754 Y135.332 E.37719
M204 S10000
G1 X137.827 Y135.726 F42000
G1 F12000
M204 S2000
G1 X138.615 Y135.675 E.01523
G2 X142.675 Y131.615 I-.616 J-4.675 E.11897
G2 X142.726 Y130.748 I-6.593 J-.828 E.01677
G1 X142.726 Y128.321 E.04677
G1 X113.274 Y128.321 E.56771
G1 X113.274 Y130.827 E.0483
G1 X113.325 Y131.615 E.01523
G2 X117.385 Y135.675 I4.675 J-.616 E.11897
G1 X118.173 Y135.726 E.01523
G1 X137.767 Y135.726 E.37769
M204 S10000
G1 X137.84 Y136.121 F42000
G1 F12000
M204 S2000
G1 X138.667 Y136.066 E.01597
G2 X143.066 Y131.667 I-.667 J-5.067 E.12893
G1 X143.121 Y130.84 E.01597
G1 X143.121 Y127.927 E.05615
G1 X112.879 Y127.927 E.58291
G1 X112.879 Y130.84 E.05615
G1 X112.934 Y131.667 E.01597
G2 X117.333 Y136.066 I5.067 J-.667 E.12893
G1 X118.16 Y136.121 E.01597
G1 X137.78 Y136.121 E.37819
M204 S10000
G1 X137.853 Y136.515 F42000
G1 F12000
M204 S2000
G1 X138.719 Y136.458 E.01672
G2 X143.458 Y131.719 I-.719 J-5.458 E.1389
G1 X143.515 Y130.853 E.01672
G1 X143.515 Y127.533 E.064
G1 X112.485 Y127.533 E.59811
G1 X112.485 Y130.853 E.064
G1 X112.542 Y131.719 E.01672
G2 X117.281 Y136.458 I5.458 J-.719 E.1389
G1 X118.147 Y136.515 E.01672
G1 X137.793 Y136.515 E.37869
M204 S10000
G1 X137.866 Y136.909 F42000
G1 F12000
M204 S2000
G1 X138.77 Y136.85 E.01747
G1 X139.527 Y136.699 E.01488
G1 X140.258 Y136.451 E.01488
G1 X140.95 Y136.11 E.01487
G1 X141.592 Y135.681 E.01488
G1 X142.172 Y135.172 E.01488
G1 X142.681 Y134.592 E.01488
G1 X143.11 Y133.95 E.01488
G1 X143.451 Y133.258 E.01488
G1 X143.699 Y132.527 E.01488
G1 X143.85 Y131.77 E.01488
G1 X143.909 Y130.866 E.01747
G1 X143.909 Y127.139 E.07184
G1 X112.091 Y127.139 E.61331
G1 X112.091 Y130.866 E.07184
G1 X112.15 Y131.77 E.01747
G1 X112.301 Y132.527 E.01488
G1 X112.549 Y133.258 E.01488
G1 X112.89 Y133.95 E.01487
G1 X113.319 Y134.592 E.01488
G1 X113.828 Y135.172 E.01488
G1 X114.408 Y135.681 E.01488
G1 X115.05 Y136.11 E.01488
G1 X115.742 Y136.451 E.01487
G1 X116.473 Y136.699 E.01488
G1 X117.23 Y136.85 E.01488
G1 X118.134 Y136.909 E.01747
G1 X137.806 Y136.909 E.37918
M204 S10000
G1 X137.879 Y137.303 F42000
G1 F12000
M204 S2000
G1 X138.822 Y137.242 E.01821
G1 X139.629 Y137.081 E.01587
G1 X140.409 Y136.816 E.01587
G1 X141.148 Y136.452 E.01587
G1 X141.832 Y135.994 E.01588
G1 X142.451 Y135.452 E.01587
G1 X142.995 Y134.832 E.01587
G1 X143.452 Y134.148 E.01587
G1 X143.816 Y133.409 E.01587
G1 X144.081 Y132.629 E.01587
G1 X144.242 Y131.822 E.01587
G1 X144.303 Y130.879 E.01821
G1 X144.303 Y126.744 E.07969
G1 X111.697 Y126.744 E.6285
G1 X111.697 Y130.879 E.07969
G1 X111.758 Y131.822 E.01821
G1 X111.919 Y132.629 E.01587
G1 X112.184 Y133.409 E.01587
G1 X112.548 Y134.148 E.01587
G1 X113.006 Y134.832 E.01588
G1 X113.548 Y135.451 E.01587
G1 X114.168 Y135.994 E.01587
G1 X114.852 Y136.452 E.01588
G1 X115.591 Y136.816 E.01587
G1 X116.371 Y137.081 E.01587
G1 X117.178 Y137.242 E.01587
G1 X118.121 Y137.303 E.01821
G1 X137.819 Y137.303 E.37968
M204 S10000
G1 X137.892 Y137.698 F42000
G1 F12000
M204 S2000
G1 X138.873 Y137.633 E.01896
G1 X139.732 Y137.462 E.01687
G1 X140.56 Y137.181 E.01687
G1 X141.345 Y136.794 E.01687
G1 X142.073 Y136.308 E.01687
G1 X142.731 Y135.731 E.01687
G1 X143.308 Y135.073 E.01687
G1 X143.794 Y134.345 E.01687
G1 X144.181 Y133.56 E.01687
G1 X144.462 Y132.732 E.01687
G1 X144.633 Y131.873 E.01687
G1 X144.698 Y130.892 E.01896
G1 X144.698 Y126.35 E.08754
G1 X111.302 Y126.35 E.6437
G1 X111.302 Y130.892 E.08754
G1 X111.367 Y131.873 E.01896
G1 X111.538 Y132.732 E.01687
G1 X111.819 Y133.56 E.01687
G1 X112.206 Y134.345 E.01687
G1 X112.692 Y135.073 E.01687
G1 X113.269 Y135.731 E.01687
G1 X113.927 Y136.308 E.01687
G1 X114.655 Y136.794 E.01687
G1 X115.44 Y137.181 E.01687
G1 X116.268 Y137.462 E.01687
G1 X117.127 Y137.633 E.01687
G1 X118.108 Y137.698 E.01896
G1 X137.832 Y137.698 E.38018
M204 S10000
G1 X137.905 Y138.092 F42000
G1 F12000
M204 S2000
G1 X138.925 Y138.025 E.01971
G1 X139.834 Y137.844 E.01787
G1 X140.712 Y137.546 E.01786
G1 X141.543 Y137.136 E.01786
G1 X142.313 Y136.621 E.01787
G1 X143.01 Y136.01 E.01786
G1 X143.621 Y135.313 E.01787
G1 X144.136 Y134.543 E.01786
G1 X144.546 Y133.712 E.01786
G1 X144.844 Y132.834 E.01787
G1 X145.025 Y131.925 E.01786
G1 X145.092 Y130.905 E.01971
G1 X145.092 Y125.956 E.09539
G1 X110.908 Y125.956 E.6589
G1 X110.908 Y130.905 E.09539
G1 X110.975 Y131.925 E.01971
G1 X111.156 Y132.834 E.01787
G1 X111.454 Y133.712 E.01787
G1 X111.864 Y134.543 E.01786
G1 X112.379 Y135.313 E.01787
G1 X112.99 Y136.01 E.01786
G1 X113.687 Y136.621 E.01786
G1 X114.457 Y137.136 E.01787
G1 X115.288 Y137.546 E.01786
G1 X116.166 Y137.844 E.01786
G1 X117.075 Y138.025 E.01786
G1 X118.095 Y138.092 E.01971
G1 X137.845 Y138.092 E.38067
M204 S10000
G1 X137.918 Y138.486 F42000
G1 F12000
M204 S2000
G1 X138.976 Y138.417 E.02045
G1 X139.936 Y138.226 E.01886
G1 X140.863 Y137.911 E.01886
G1 X141.74 Y137.478 E.01886
G1 X142.554 Y136.935 E.01886
G1 X143.29 Y136.29 E.01886
G1 X143.935 Y135.554 E.01886
G1 X144.478 Y134.74 E.01886
G1 X144.911 Y133.863 E.01886
G1 X145.226 Y132.936 E.01886
G1 X145.417 Y131.976 E.01886
G1 X145.486 Y130.918 E.02045
G1 X145.486 Y125.562 E.10324
G1 X110.514 Y125.562 E.6741
G1 X110.514 Y130.918 E.10324
G1 X110.583 Y131.976 E.02045
G1 X110.774 Y132.936 E.01886
G1 X111.089 Y133.863 E.01886
G1 X111.522 Y134.74 E.01886
G1 X112.065 Y135.554 E.01886
G1 X112.71 Y136.29 E.01886
G1 X113.446 Y136.935 E.01886
G1 X114.26 Y137.478 E.01886
G1 X115.137 Y137.911 E.01886
G1 X116.064 Y138.226 E.01886
G1 X117.024 Y138.417 E.01886
G1 X118.082 Y138.486 E.02045
G1 X137.858 Y138.486 E.38117
M204 S10000
G1 X137.93 Y138.88 F42000
G1 F12000
M204 S2000
G1 X139.028 Y138.808 E.0212
G1 X140.038 Y138.607 E.01986
G1 X141.014 Y138.276 E.01986
G1 X141.938 Y137.821 E.01985
G1 X142.794 Y137.248 E.01986
G1 X143.569 Y136.569 E.01986
G1 X144.248 Y135.794 E.01986
G1 X144.821 Y134.938 E.01986
G1 X145.276 Y134.014 E.01986
G1 X145.607 Y133.038 E.01986
G1 X145.808 Y132.028 E.01986
G1 X145.88 Y130.93 E.0212
G1 X145.88 Y125.167 E.11108
G1 X110.12 Y125.168 E.6893
G1 X110.12 Y130.93 E.11108
G1 X110.192 Y132.028 E.0212
G1 X110.393 Y133.038 E.01986
G1 X110.724 Y134.014 E.01986
G1 X111.179 Y134.938 E.01985
G1 X111.752 Y135.794 E.01986
G1 X112.431 Y136.569 E.01986
G1 X113.206 Y137.248 E.01986
G1 X114.062 Y137.821 E.01986
G1 X114.986 Y138.276 E.01985
G1 X115.962 Y138.607 E.01986
G1 X116.972 Y138.808 E.01986
G1 X118.07 Y138.88 E.0212
G1 X137.87 Y138.88 E.38167
M204 S10000
G1 X137.943 Y139.275 F42000
G1 F12000
M204 S2000
G1 X139.08 Y139.2 E.02195
G1 X140.141 Y138.989 E.02085
G1 X141.165 Y138.641 E.02085
G1 X142.135 Y138.163 E.02085
G1 X143.035 Y137.562 E.02086
G1 X143.848 Y136.848 E.02085
G1 X144.562 Y136.035 E.02086
G1 X145.163 Y135.135 E.02085
G1 X145.641 Y134.165 E.02085
G1 X145.989 Y133.141 E.02085
G1 X146.2 Y132.08 E.02085
G1 X146.275 Y130.943 E.02195
G1 X146.275 Y124.773 E.11893
G1 X109.725 Y124.773 E.7045
G1 X109.725 Y130.943 E.11893
G1 X109.8 Y132.08 E.02195
G1 X110.011 Y133.141 E.02085
G1 X110.359 Y134.165 E.02085
G1 X110.837 Y135.135 E.02085
G1 X111.438 Y136.035 E.02086
G1 X112.152 Y136.848 E.02085
G1 X112.965 Y137.562 E.02085
G1 X113.865 Y138.163 E.02086
G1 X114.835 Y138.641 E.02085
G1 X115.859 Y138.989 E.02085
G1 X116.92 Y139.2 E.02085
G1 X118.057 Y139.275 E.02195
G1 X137.883 Y139.275 E.38217
M204 S10000
G1 X137.956 Y139.669 F42000
G1 F12000
M204 S2000
G1 X139.131 Y139.592 E.02269
G1 X140.243 Y139.371 E.02185
G1 X141.316 Y139.006 E.02185
G1 X142.333 Y138.505 E.02185
G1 X143.275 Y137.875 E.02185
G1 X144.128 Y137.128 E.02185
G1 X144.875 Y136.275 E.02185
G1 X145.505 Y135.333 E.02185
G1 X146.006 Y134.316 E.02185
G1 X146.371 Y133.243 E.02185
G1 X146.592 Y132.131 E.02185
G1 X146.669 Y130.956 E.0227
G1 X146.669 Y124.379 E.12678
G1 X109.331 Y124.379 E.71969
G1 X109.331 Y130.956 E.12678
G1 X109.408 Y132.131 E.02269
G1 X109.629 Y133.243 E.02185
G1 X109.994 Y134.316 E.02185
G1 X110.495 Y135.333 E.02185
G1 X111.125 Y136.275 E.02185
G1 X111.872 Y137.128 E.02185
G1 X112.725 Y137.875 E.02185
G1 X113.667 Y138.505 E.02185
G1 X114.684 Y139.006 E.02185
G1 X115.757 Y139.371 E.02185
G1 X116.869 Y139.592 E.02185
G1 X118.044 Y139.669 E.0227
G1 X137.896 Y139.669 E.38266
M204 S10000
G1 X137.969 Y140.063 F42000
G1 F12000
M204 S2000
G1 X139.183 Y139.983 E.02344
G1 X140.345 Y139.752 E.02285
G1 X141.467 Y139.371 E.02284
G1 X142.53 Y138.847 E.02284
G1 X143.516 Y138.189 E.02285
G1 X144.407 Y137.407 E.02285
G1 X145.189 Y136.516 E.02285
G1 X145.847 Y135.531 E.02284
G1 X146.371 Y134.468 E.02285
G1 X146.752 Y133.345 E.02285
G1 X146.983 Y132.183 E.02285
G1 X147.063 Y130.969 E.02344
G1 X147.063 Y123.985 E.13463
G1 X108.937 Y123.985 E.73489
G1 X108.937 Y130.969 E.13463
G1 X109.017 Y132.183 E.02344
M73 P54 R10
G1 X109.248 Y133.345 E.02285
G1 X109.629 Y134.468 E.02285
G1 X110.153 Y135.53 E.02284
G1 X110.811 Y136.516 E.02285
G1 X111.593 Y137.407 E.02284
G1 X112.484 Y138.189 E.02285
G1 X113.47 Y138.847 E.02285
G1 X114.532 Y139.371 E.02284
G1 X115.655 Y139.752 E.02285
G1 X116.817 Y139.983 E.02285
G1 X118.031 Y140.063 E.02344
G1 X137.909 Y140.063 E.38316
M204 S10000
G1 X137.982 Y140.457 F42000
G1 F12000
M204 S2000
G1 X139.234 Y140.375 E.02419
G1 X140.447 Y140.134 E.02384
G1 X141.619 Y139.736 E.02384
G1 X142.728 Y139.189 E.02384
G1 X143.757 Y138.502 E.02385
G1 X144.686 Y137.686 E.02384
G1 X145.502 Y136.756 E.02384
G1 X146.189 Y135.728 E.02384
G1 X146.736 Y134.619 E.02384
G1 X147.134 Y133.447 E.02384
G1 X147.375 Y132.234 E.02384
G1 X147.457 Y130.982 E.02419
G1 X147.457 Y123.591 E.14247
G1 X108.543 Y123.591 E.75009
G1 X108.543 Y130.982 E.14247
G1 X108.625 Y132.234 E.02419
G1 X108.866 Y133.447 E.02384
G1 X109.264 Y134.619 E.02384
G1 X109.811 Y135.728 E.02384
G1 X110.498 Y136.757 E.02385
G1 X111.314 Y137.686 E.02384
G1 X112.243 Y138.502 E.02384
G1 X113.272 Y139.189 E.02385
G1 X114.381 Y139.736 E.02384
G1 X115.553 Y140.134 E.02384
G1 X116.766 Y140.375 E.02384
G1 X118.018 Y140.457 E.02419
G1 X137.922 Y140.457 E.38366
; WIPE_START
M204 S6000
G1 X135.922 Y140.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.635 Y136.13 Z2.88 F42000
G1 X109.552 Y122.31 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.618632
G1 F10120.092
M204 S6000
G1 X146.388 Y122.31 E1.06778
; WIPE_START
G1 X144.388 Y122.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.837 Y121.195 Z2.88 F42000
G1 X109.04 Y117.091 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14142.679
M204 S6000
G1 X109.085 Y116.755 E.00704
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.996 Y116.052 E.74523
G3 X146.915 Y116.755 I-.022 J.981 E.02566
G1 X146.96 Y117.091 E.00704
G1 X109.1 Y117.091 E.78529
M204 S10000
G1 X108.619 Y117.516 F42000
G1 F14142.679
M204 S6000
G3 X108.671 Y116.644 I3.337 J-.238 E.01817
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.052 Y115.631 E.00193
G1 X146.356 Y115.671 E.00637
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.516 E.00985
G1 X108.679 Y117.516 E.80277
M204 S10000
G1 X108.21 Y117.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X108.21 Y117.014 E.01756
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.105 Y115.226 E.00231
G1 X146.463 Y115.273 E.00695
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.925 E.01756
G1 X108.27 Y117.925 E.76178
; WIPE_START
M204 S6000
G1 X108.21 Y117.014 E-.34698
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.536 Y115.995 E-.05295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.341 Y116.69 Z2.88 F42000
G1 Z2.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.59822
G1 F10480.948
M204 S6000
G1 X109.888 Y116.582 E.0156
; LINE_WIDTH: 0.649335
G1 F9621.825
G1 X110.103 Y116.567 E.00657
G1 X145.897 Y116.567 E1.09131
G1 X146.112 Y116.582 E.00657
; LINE_WIDTH: 0.598236
G1 F10480.647
G1 X146.659 Y116.69 E.0156
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10480.647
G1 X146.112 Y116.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/83
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S201.45
; OBJECT_ID: 82
M204 S10000
G17
G3 Z2.88 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.783 Z2.88
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7648
M204 S6000
G1 X146.957 Y119.783 E.78641
G1 X146.957 Y123.55 E.07815
G1 X109.043 Y123.55 E.78641
G1 X109.043 Y119.843 E.0769
M204 S10000
G1 X108.619 Y119.359 F42000
G1 F7648
M204 S6000
G1 X147.381 Y119.359 E.80401
G1 X147.381 Y123.975 E.09575
G1 X108.619 Y123.975 E.80401
G1 X108.619 Y119.419 E.0945
M204 S10000
G1 X108.21 Y118.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7648
M204 S5000
G1 X147.79 Y118.949 E.76293
G1 X147.79 Y124.384 E.10475
G1 X108.21 Y124.384 E.76293
G1 X108.21 Y119.009 E.1036
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.006 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X146.594 Y120.898 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7648
M204 S6000
G1 X146.594 Y121.577 E.01409
G1 X145.576 Y121.577 E.02111
G1 X144.145 Y120.146 E.04198
G1 X145.454 Y120.146 E.02715
G1 X144.023 Y121.577 E.04198
G1 X140.776 Y121.577 E.06735
G1 X139.345 Y120.146 E.04198
G1 X140.654 Y120.146 E.02715
G1 X139.223 Y121.577 E.04198
G1 X135.976 Y121.577 E.06735
G1 X134.545 Y120.146 E.04198
G1 X135.854 Y120.146 E.02715
G1 X134.423 Y121.577 E.04198
G1 X131.176 Y121.577 E.06735
G1 X129.745 Y120.146 E.04198
G1 X131.054 Y120.146 E.02715
G1 X129.623 Y121.577 E.04198
G1 X126.377 Y121.577 E.06735
G1 X124.946 Y120.146 E.04198
G1 X126.255 Y120.146 E.02715
G1 X124.824 Y121.577 E.04198
G1 X121.577 Y121.577 E.06735
G1 X120.146 Y120.146 E.04198
G1 X121.455 Y120.146 E.02715
G1 X120.024 Y121.577 E.04198
G1 X116.777 Y121.577 E.06735
G1 X115.346 Y120.146 E.04198
G1 X116.655 Y120.146 E.02715
G1 X115.224 Y121.577 E.04198
G1 X111.977 Y121.577 E.06735
G1 X110.546 Y120.146 E.04198
G1 X111.855 Y120.146 E.02715
G1 X110.424 Y121.577 E.04198
G1 X109.406 Y121.577 E.02111
G1 X109.406 Y120.898 E.01409
M204 S10000
G1 X146.547 Y122.564 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419992
G1 F7648
M204 S6000
G1 X146.547 Y121.986 E.01113
G1 X109.453 Y121.986 E.71501
G1 X109.453 Y123.141 E.02226
G1 X146.547 Y123.141 E.71501
G1 X146.547 Y122.624 E.00998
M204 S10000
G1 X146.16 Y122.564 F42000
; LINE_WIDTH: 0.406177
G1 F7648
M204 S6000
G1 X146.16 Y122.373 E.00354
G1 X109.84 Y122.373 E.67555
G1 X109.84 Y122.754 E.00708
G1 X146.16 Y122.754 E.67555
G1 X146.16 Y122.624 E.00242
; WIPE_START
G1 F15771.835
G1 X146.16 Y122.754 E-.04948
G1 X144.29 Y122.754 E-.71052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.754 Y121.544 Z3 F42000
G1 X109.04 Y117.096 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7648
M204 S6000
G1 X109.085 Y116.755 E.00713
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X146.005 Y116.053 E.74541
G3 X146.915 Y116.755 I-.028 J.978 E.02549
G1 X146.96 Y117.096 E.00713
G1 X109.1 Y117.096 E.78532
M204 S10000
G1 X108.619 Y117.52 F42000
G1 F7648
M204 S6000
G3 X108.671 Y116.644 I3.353 J-.24 E.01825
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.06 Y115.632 E.00211
G1 X146.356 Y115.671 E.00619
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.52 E.00994
G1 X108.679 Y117.52 E.80277
M204 S10000
G1 X108.21 Y117.929 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7648
M204 S5000
G1 X108.21 Y117.014 E.01764
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.113 Y115.227 E.00247
G1 X146.463 Y115.273 E.00679
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.929 E.01764
G1 X108.27 Y117.929 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.34857
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.534 Y115.999 E-.05136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.34 Y116.693 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.60257
G1 F7648
M204 S6000
G1 X109.888 Y116.584 E.01577
; LINE_WIDTH: 0.653525
G1 X110.103 Y116.57 E.0066
G1 X145.897 Y116.57 E1.09864
G1 X146.112 Y116.584 E.0066
; LINE_WIDTH: 0.602603
G1 X146.66 Y116.693 E.01577
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10401.307
G1 X146.112 Y116.584 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/83
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.787 Z3
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7242
M204 S6000
G1 X146.957 Y119.787 E.78641
M73 P55 R10
G1 X146.957 Y122.902 E.06461
G1 X109.043 Y122.902 E.78641
G1 X109.043 Y119.847 E.06337
M204 S10000
G1 X108.619 Y119.363 F42000
G1 F7242
M204 S6000
G1 X147.381 Y119.363 E.80401
G1 X147.381 Y123.326 E.08221
G1 X108.619 Y123.326 E.80401
G1 X108.619 Y119.423 E.08097
M204 S10000
G1 X108.21 Y118.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7242
M204 S5000
G1 X147.79 Y118.954 E.76293
G1 X147.79 Y123.736 E.09217
G1 X108.21 Y123.736 E.76293
G1 X108.21 Y119.014 E.09102
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.12
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.12 F4000
            G39.3 S1
            G0 Z3.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X146.594 Y120.703 F42000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7242
M204 S6000
G1 X146.594 Y120.15 E.01147
G1 X145.45 Y120.15 E.02373
G1 X144.247 Y121.352 E.03527
G1 X145.351 Y121.352 E.0229
G1 X144.149 Y120.15 E.03527
G1 X140.65 Y120.15 E.07258
G1 X139.447 Y121.352 E.03527
G1 X140.552 Y121.352 E.0229
G1 X139.349 Y120.15 E.03527
G1 X135.85 Y120.15 E.07258
G1 X134.648 Y121.352 E.03527
G1 X135.752 Y121.352 E.0229
G1 X134.549 Y120.15 E.03527
G1 X131.05 Y120.15 E.07258
G1 X129.848 Y121.352 E.03527
G1 X130.952 Y121.352 E.0229
G1 X129.75 Y120.15 E.03527
G1 X126.25 Y120.15 E.07258
G1 X125.048 Y121.352 E.03527
G1 X126.152 Y121.352 E.0229
G1 X124.95 Y120.15 E.03527
G1 X121.451 Y120.15 E.07258
G1 X120.248 Y121.352 E.03527
G1 X121.352 Y121.352 E.0229
G1 X120.15 Y120.15 E.03527
G1 X116.651 Y120.15 E.07258
G1 X115.448 Y121.352 E.03527
G1 X116.553 Y121.352 E.0229
G1 X115.35 Y120.15 E.03527
G1 X111.851 Y120.15 E.07258
G1 X110.649 Y121.352 E.03527
G1 X111.753 Y121.352 E.0229
G1 X110.55 Y120.15 E.03527
G1 X109.406 Y120.15 E.02373
G1 X109.406 Y120.703 E.01147
M204 S10000
G1 X146.547 Y122.127 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419992
G1 F7242
M204 S6000
G1 X146.547 Y121.762 E.00705
G1 X109.453 Y121.762 E.71501
G1 X109.453 Y122.493 E.0141
G1 X146.547 Y122.493 E.71501
G1 X146.547 Y122.187 E.00589
M204 S10000
G1 X109.818 Y122.127 F42000
; LINE_WIDTH: 0.362792
G1 F7242
M204 S6000
G1 X146.122 Y122.127 E.59823
; WIPE_START
G1 F16800
G1 X144.122 Y122.127 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.566 Y121.045 Z3.12 F42000
G1 X109.039 Y117.1 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7242
M204 S6000
G1 X109.085 Y116.755 E.00722
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X146.013 Y116.054 E.74558
G3 X146.915 Y116.755 I-.035 J.976 E.02531
G1 X146.961 Y117.1 E.00722
G1 X109.099 Y117.1 E.78534
M204 S10000
G1 X108.619 Y117.524 F42000
G1 F7242
M204 S6000
G3 X108.671 Y116.644 I3.368 J-.242 E.01834
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.068 Y115.634 E.00228
G1 X146.356 Y115.671 E.00602
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.524 E.01003
G1 X108.679 Y117.524 E.80277
M204 S10000
G1 X108.21 Y117.933 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7242
M204 S5000
G1 X108.21 Y117.014 E.01772
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.122 Y115.228 E.00263
G1 X146.463 Y115.273 E.00663
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.933 E.01772
G1 X108.27 Y117.933 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35016
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.531 Y116.002 E-.04977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.339 Y116.695 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.606959
G1 F7242
M204 S6000
G1 X109.889 Y116.586 E.01593
; LINE_WIDTH: 0.657716
G1 X110.103 Y116.572 E.00663
G1 X145.897 Y116.572 E1.10596
G1 X146.111 Y116.586 E.00663
; LINE_WIDTH: 0.606966
G1 X146.661 Y116.695 E.01593
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10323.229
G1 X146.111 Y116.586 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/83
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.12 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.791 Z3.12
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P55 R9
G1 F6602
M204 S6000
G1 X146.957 Y119.791 E.78641
G1 X146.957 Y122.506 E.05632
G1 X109.043 Y122.506 E.78641
G1 X109.043 Y119.851 E.05507
M204 S10000
G1 X108.619 Y119.367 F42000
G1 F6602
M204 S6000
G1 X147.381 Y119.367 E.80401
G1 X147.381 Y122.931 E.07392
G1 X108.619 Y122.931 E.80401
G1 X108.619 Y119.427 E.07267
M204 S10000
G1 X108.21 Y118.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X147.79 Y118.958 E.76293
G1 X147.79 Y123.34 E.08447
G1 X108.21 Y123.34 E.76293
G1 X108.21 Y119.018 E.08331
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.24
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.24 F4000
            G39.3 S1
            G0 Z3.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.703 F42000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X109.406 Y120.154 E.01138
G1 X110.555 Y120.154 E.02382
G1 X111.584 Y121.184 E.0302
G1 X110.817 Y121.184 E.01591
G1 X111.847 Y120.154 E.0302
G1 X115.354 Y120.154 E.07276
G1 X116.384 Y121.184 E.0302
G1 X115.617 Y121.184 E.01591
G1 X116.647 Y120.154 E.0302
G1 X120.154 Y120.154 E.07276
G1 X121.184 Y121.184 E.0302
G1 X120.417 Y121.184 E.01591
G1 X121.446 Y120.154 E.0302
G1 X124.954 Y120.154 E.07276
G1 X125.984 Y121.184 E.0302
G1 X125.217 Y121.184 E.01591
G1 X126.246 Y120.154 E.0302
G1 X129.754 Y120.154 E.07276
G1 X130.783 Y121.184 E.0302
G1 X130.016 Y121.184 E.01591
G1 X131.046 Y120.154 E.0302
G1 X134.554 Y120.154 E.07276
G1 X135.583 Y121.184 E.0302
G1 X134.816 Y121.184 E.01591
G1 X135.846 Y120.154 E.0302
G1 X139.353 Y120.154 E.07276
G1 X140.383 Y121.184 E.0302
G1 X139.616 Y121.184 E.01591
G1 X140.646 Y120.154 E.0302
G1 X144.153 Y120.154 E.07276
G1 X145.183 Y121.184 E.0302
G1 X144.416 Y121.184 E.01591
G1 X145.445 Y120.154 E.0302
G1 X146.594 Y120.154 E.02382
G1 X146.594 Y120.703 E.01138
M204 S10000
G1 X146.52 Y121.845 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.474957
G1 F6602
M204 S6000
G1 X146.52 Y121.621 E.00493
G1 X109.48 Y121.621 E.81349
M73 P56 R9
G1 X109.48 Y122.07 E.00987
G1 X146.52 Y122.07 E.81349
G1 X146.52 Y121.905 E.00362
; WIPE_START
G1 F13356.931
G1 X146.52 Y122.07 E-.06255
G1 X144.684 Y122.07 E-.69745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.125 Y121.017 Z3.24 F42000
G1 X109.039 Y117.104 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
M204 S6000
G1 X109.085 Y116.755 E.00731
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X146.021 Y116.055 E.74575
G3 X146.915 Y116.755 I-.041 J.974 E.02513
G1 X146.961 Y117.104 E.00731
G1 X109.099 Y117.104 E.78536
M204 S10000
G1 X108.619 Y117.528 F42000
G1 F6602
M204 S6000
G3 X108.671 Y116.644 I3.384 J-.244 E.01843
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.077 Y115.635 E.00245
G1 X146.356 Y115.671 E.00585
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.528 E.01011
G1 X108.679 Y117.528 E.80277
M204 S10000
G1 X108.21 Y117.938 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
M204 S5000
G1 X108.21 Y117.014 E.0178
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.13 Y115.229 E.0028
G1 X146.463 Y115.273 E.00647
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.938 E.0178
G1 X108.27 Y117.938 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35175
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.529 Y116.005 E-.04818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.338 Y116.697 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.611322
G1 F6602
M204 S6000
G1 X109.889 Y116.588 E.01609
; LINE_WIDTH: 0.661906
G1 X110.103 Y116.574 E.00666
G1 X145.897 Y116.574 E1.11329
G1 X146.111 Y116.588 E.00666
; LINE_WIDTH: 0.611329
G1 X146.662 Y116.697 E.01609
; CHANGE_LAYER
; Z_HEIGHT: 2.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10246.314
G1 X146.111 Y116.588 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/83
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.24 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.796 Z3.24
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
M204 S6000
G1 X146.957 Y119.796 E.78641
G1 X146.957 Y122.247 E.05085
G1 X109.043 Y122.247 E.78641
G1 X109.043 Y119.856 E.04961
M204 S10000
G1 X108.619 Y119.371 F42000
G1 F6643
M204 S6000
G1 X147.381 Y119.371 E.80401
G1 X147.381 Y122.671 E.06845
G1 X108.619 Y122.671 E.80401
G1 X108.619 Y119.431 E.06721
M204 S10000
G1 X108.21 Y118.962 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
M204 S5000
G1 X147.79 Y118.962 E.76293
G1 X147.79 Y123.081 E.07939
G1 X108.21 Y123.081 E.76293
G1 X108.21 Y119.022 E.07823
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.36
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.36 F4000
            G39.3 S1
            G0 Z3.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X146.594 Y120.703 F42000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
M204 S6000
G1 X146.594 Y120.158 E.0113
G1 X145.441 Y120.158 E.0239
G1 X144.562 Y121.038 E.02579
G1 X145.037 Y121.038 E.00985
G1 X144.157 Y120.158 E.02579
G1 X140.641 Y120.158 E.07293
G1 X139.762 Y121.038 E.02579
G1 X140.237 Y121.038 E.00985
G1 X139.358 Y120.158 E.02579
G1 X135.842 Y120.158 E.07293
G1 X134.962 Y121.038 E.02579
G1 X135.437 Y121.038 E.00985
G1 X134.558 Y120.158 E.02579
G1 X131.042 Y120.158 E.07293
G1 X130.163 Y121.038 E.02579
G1 X130.637 Y121.038 E.00985
G1 X129.758 Y120.158 E.02579
G1 X126.242 Y120.158 E.07293
G1 X125.363 Y121.038 E.02579
G1 X125.837 Y121.038 E.00985
G1 X124.958 Y120.158 E.02579
G1 X121.442 Y120.158 E.07293
G1 X120.563 Y121.038 E.02579
G1 X121.038 Y121.038 E.00985
G1 X120.158 Y120.158 E.02579
G1 X116.642 Y120.158 E.07293
G1 X115.763 Y121.038 E.02579
G1 X116.238 Y121.038 E.00985
G1 X115.359 Y120.158 E.02579
G1 X111.843 Y120.158 E.07293
G1 X110.963 Y121.038 E.02579
G1 X111.438 Y121.038 E.00985
G1 X110.559 Y120.158 E.02579
G1 X109.406 Y120.158 E.0239
G1 X109.406 Y120.703 E.0113
M204 S10000
G1 X146.548 Y121.642 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.418367
G1 F6643
M204 S6000
G1 X146.548 Y121.446 E.00377
G1 X109.452 Y121.446 E.71209
G1 X109.452 Y121.839 E.00754
G1 X146.548 Y121.839 E.71209
G1 X146.548 Y121.702 E.00262
; WIPE_START
G1 F15282.147
G1 X146.548 Y121.839 E-.0518
G1 X144.684 Y121.839 E-.70821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.118 Y120.835 Z3.36 F42000
G1 X109.038 Y117.108 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
M204 S6000
G1 X109.085 Y116.755 E.0074
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.029 Y116.056 E.00205
G3 X146.915 Y116.755 I-.048 J.972 E.02496
G1 X146.962 Y117.108 E.00739
G1 X109.098 Y117.108 E.78538
M204 S10000
G1 X108.619 Y117.532 F42000
G1 F6643
M204 S6000
G3 X108.671 Y116.644 I3.4 J-.246 E.01851
G3 X110.041 Y115.619 I1.375 J.41 E.038
M73 P57 R9
G1 X145.959 Y115.619 E.74504
G1 X146.085 Y115.636 E.00262
G1 X146.356 Y115.671 E.00567
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.532 E.0102
G1 X108.679 Y117.532 E.80277
M204 S10000
G1 X108.21 Y117.942 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
M204 S5000
G1 X108.21 Y117.014 E.01789
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.138 Y115.23 E.00296
G1 X146.463 Y115.273 E.00631
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.942 E.01789
G1 X108.27 Y117.942 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35333
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.526 Y116.009 E-.04659
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.337 Y116.7 Z3.36 F42000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.615651
G1 F6643
M204 S6000
G1 X109.89 Y116.59 E.01626
; LINE_WIDTH: 0.666097
G1 X110.103 Y116.576 E.00669
G1 X145.897 Y116.576 E1.12062
G1 X146.11 Y116.59 E.00669
; LINE_WIDTH: 0.615687
G1 X146.663 Y116.7 E.01626
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10170.621
G1 X146.11 Y116.59 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/83
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.36 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.8 Z3.36
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6458
M204 S6000
G1 X146.957 Y119.8 E.78641
G1 X146.957 Y122.023 E.04611
G1 X109.043 Y122.023 E.78641
G1 X109.043 Y119.86 E.04486
M204 S10000
G1 X108.619 Y119.375 F42000
G1 F6458
M204 S6000
G1 X147.381 Y119.375 E.80401
G1 X147.381 Y122.447 E.06371
G1 X108.619 Y122.447 E.80401
G1 X108.619 Y119.435 E.06246
M204 S10000
G1 X108.21 Y118.966 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6458
M204 S5000
G1 X147.79 Y118.966 E.76293
G1 X147.79 Y122.856 E.07498
G1 X108.21 Y122.856 E.76293
G1 X108.21 Y119.026 E.07382
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.48
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.48 F4000
            G39.3 S1
            G0 Z3.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.406 Y120.703 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6458
M204 S6000
G1 X109.406 Y120.163 E.01121
G1 X110.563 Y120.163 E.02399
G1 X111.292 Y120.891 E.02138
G1 X111.11 Y120.891 E.00378
G1 X111.838 Y120.163 E.02138
G1 X115.363 Y120.163 E.07311
G1 X116.092 Y120.891 E.02138
G1 X115.909 Y120.891 E.00378
G1 X116.638 Y120.163 E.02138
G1 X120.163 Y120.163 E.07311
G1 X120.891 Y120.891 E.02138
G1 X120.709 Y120.891 E.00378
G1 X121.438 Y120.163 E.02138
G1 X124.962 Y120.163 E.07311
G1 X125.691 Y120.891 E.02138
G1 X125.509 Y120.891 E.00378
G1 X126.238 Y120.163 E.02138
G1 X129.762 Y120.163 E.07311
G1 X130.491 Y120.891 E.02138
G1 X130.309 Y120.891 E.00378
G1 X131.038 Y120.163 E.02138
G1 X134.562 Y120.163 E.07311
G1 X135.291 Y120.891 E.02138
G1 X135.109 Y120.891 E.00378
G1 X135.837 Y120.163 E.02138
G1 X139.362 Y120.163 E.07311
G1 X140.091 Y120.891 E.02138
G1 X139.908 Y120.891 E.00378
G1 X140.637 Y120.163 E.02138
G1 X144.162 Y120.163 E.07311
G1 X144.89 Y120.891 E.02138
G1 X144.708 Y120.891 E.00378
G1 X145.437 Y120.163 E.02138
G1 X146.594 Y120.163 E.02399
G1 X146.594 Y120.703 E.01121
M204 S10000
G1 X146.568 Y121.457 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.379227
G1 F6458
M204 S6000
G1 X146.568 Y121.28 E.00305
G1 X109.432 Y121.28 E.64178
G1 X109.432 Y121.634 E.00611
G1 X146.568 Y121.634 E.64178
G1 X146.568 Y121.517 E.00202
; WIPE_START
G1 F16800
G1 X146.568 Y121.634 E-.04436
G1 X144.684 Y121.634 E-.71564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.113 Y120.673 Z3.48 F42000
G1 X109.038 Y117.112 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6458
M204 S6000
G1 X109.085 Y116.755 E.00748
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.038 Y116.057 E.00222
G3 X146.915 Y116.755 I-.054 J.969 E.02478
G1 X146.962 Y117.112 E.00748
G1 X109.098 Y117.112 E.78541
M204 S10000
G1 X108.619 Y117.537 F42000
G1 F6458
M204 S6000
G3 X108.671 Y116.644 I3.416 J-.248 E.0186
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.093 Y115.637 E.0028
G1 X146.356 Y115.671 E.0055
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.537 E.01029
G1 X108.679 Y117.537 E.80277
M204 S10000
G1 X108.21 Y117.946 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6458
M204 S5000
G1 X108.21 Y117.014 E.01797
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.147 Y115.231 E.00312
G1 X146.463 Y115.273 E.00615
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.946 E.01797
G1 X108.27 Y117.946 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35492
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.523 Y116.012 E-.04501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.336 Y116.702 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.620001
G1 F6458
M204 S6000
G1 X109.891 Y116.592 E.01643
; LINE_WIDTH: 0.670288
G1 X110.104 Y116.578 E.00672
G1 X145.897 Y116.578 E1.12794
G1 X146.109 Y116.592 E.00672
; LINE_WIDTH: 0.62005
G1 X146.664 Y116.702 E.01642
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10095.956
G1 X146.109 Y116.592 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/83
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.48 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.804 Z3.48
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5997
M204 S6000
G1 X146.957 Y119.804 E.78641
G1 X146.957 Y121.798 E.04136
G1 X109.043 Y121.798 E.78641
G1 X109.043 Y119.864 E.04012
M204 S10000
G1 X108.619 Y119.38 F42000
G1 F5997
M204 S6000
G1 X147.381 Y119.38 E.80401
G1 X147.381 Y122.222 E.05896
G1 X108.619 Y122.222 E.80401
G1 X108.619 Y119.44 E.05772
M204 S10000
G1 X108.21 Y118.97 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
M204 S5000
G1 X147.79 Y118.97 E.76293
G1 X147.79 Y122.632 E.07057
G1 X108.21 Y122.632 E.76293
G1 X108.21 Y119.03 E.06941
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.027 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P58 R9
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.57 Y121.272 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.654422
G1 F5997
M204 S6000
G1 X146.37 Y121.272 E1.13113
M204 S10000
G1 X146.594 Y120.703 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5997
M204 S6000
G1 X146.594 Y120.167 E.01112
G1 X145.433 Y120.167 E.02408
G1 X144.854 Y120.745 E.01697
G1 X144.744 Y120.745 E.00229
G1 X144.166 Y120.167 E.01697
G1 X140.633 Y120.167 E.07328
G1 X140.055 Y120.745 E.01697
G1 X139.944 Y120.745 E.00229
G1 X139.366 Y120.167 E.01697
G1 X135.833 Y120.167 E.07328
G1 X135.255 Y120.745 E.01697
G1 X135.145 Y120.745 E.00229
G1 X134.566 Y120.167 E.01697
G1 X131.033 Y120.167 E.07328
G1 X130.455 Y120.745 E.01697
G1 X130.345 Y120.745 E.00229
G1 X129.766 Y120.167 E.01697
G1 X126.234 Y120.167 E.07328
G1 X125.655 Y120.745 E.01697
G1 X125.545 Y120.745 E.00229
G1 X124.967 Y120.167 E.01697
G1 X121.434 Y120.167 E.07328
G1 X120.855 Y120.745 E.01697
G1 X120.745 Y120.745 E.00229
G1 X120.167 Y120.167 E.01697
G1 X116.634 Y120.167 E.07328
G1 X116.056 Y120.745 E.01697
G1 X115.945 Y120.745 E.00229
G1 X115.367 Y120.167 E.01697
G1 X111.834 Y120.167 E.07328
G1 X111.256 Y120.745 E.01697
G1 X111.146 Y120.745 E.00229
G1 X110.567 Y120.167 E.01697
G1 X109.406 Y120.167 E.02408
G1 X109.406 Y120.703 E.01112
; WIPE_START
G1 F14142.679
G1 X109.406 Y120.167 E-.20375
G1 X110.567 Y120.167 E-.44111
G1 X110.781 Y120.381 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.037 Y117.117 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5997
M204 S6000
G1 X109.085 Y116.755 E.00757
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.046 Y116.059 E.00239
G3 X146.915 Y116.755 I-.061 J.967 E.02461
G1 X146.963 Y117.117 E.00757
G1 X109.097 Y117.117 E.78543
M204 S10000
G1 X108.619 Y117.541 F42000
G1 F5997
M204 S6000
G3 X108.671 Y116.644 I3.432 J-.25 E.01869
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.101 Y115.638 E.00297
G1 X146.356 Y115.671 E.00533
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.541 E.01038
G1 X108.679 Y117.541 E.80277
M204 S10000
G1 X108.21 Y117.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
M204 S5000
G1 X108.21 Y117.014 E.01805
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.155 Y115.232 E.00328
G1 X146.463 Y115.273 E.00599
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.95 E.01805
G1 X108.27 Y117.95 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35651
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.521 Y116.015 E-.04342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.335 Y116.705 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.624399
G1 F5997
M204 S6000
G1 X109.891 Y116.594 E.01659
; LINE_WIDTH: 0.674478
G1 X110.104 Y116.58 E.00676
G1 X145.896 Y116.58 E1.13527
G1 X146.109 Y116.594 E.00675
; LINE_WIDTH: 0.624397
G1 X146.665 Y116.705 E.01659
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10022.636
G1 X146.109 Y116.594 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/83
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.6 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.808 Z3.6
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6074
M204 S6000
G1 X146.957 Y119.808 E.78641
G1 X146.957 Y121.63 E.03778
G1 X109.043 Y121.63 E.78641
G1 X109.043 Y119.868 E.03654
M204 S10000
G1 X108.619 Y119.384 F42000
G1 F6074
M204 S6000
G1 X147.381 Y119.384 E.80401
G1 X147.381 Y122.054 E.05538
G1 X108.619 Y122.054 E.80401
G1 X108.619 Y119.444 E.05414
M204 S10000
G1 X108.21 Y118.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6074
M204 S5000
G1 X147.79 Y118.975 E.76293
G1 X147.79 Y122.463 E.06724
G1 X108.21 Y122.463 E.76293
G1 X108.21 Y119.035 E.06609
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.72
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.72 F4000
            G39.3 S1
            G0 Z3.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.483 Y120.626 F42000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6074
M204 S6000
G1 X109.406 Y120.626 E.00159
G1 X109.406 Y120.171 E.00944
G1 X110.571 Y120.171 E.02417
G1 X111.027 Y120.626 E.01335
G1 X111.375 Y120.626 E.00722
G1 X111.83 Y120.171 E.01335
G1 X115.371 Y120.171 E.07345
G1 X115.826 Y120.626 E.01335
G1 X116.175 Y120.626 E.00722
G1 X116.63 Y120.171 E.01335
G1 X120.171 Y120.171 E.07345
G1 X120.626 Y120.626 E.01335
G1 X120.974 Y120.626 E.00722
G1 X121.43 Y120.171 E.01335
G1 X124.971 Y120.171 E.07345
G1 X125.426 Y120.626 E.01335
G1 X125.774 Y120.626 E.00722
G1 X126.229 Y120.171 E.01335
G1 X129.771 Y120.171 E.07345
G1 X130.226 Y120.626 E.01335
G1 X130.574 Y120.626 E.00722
G1 X131.029 Y120.171 E.01335
G1 X134.57 Y120.171 E.07345
G1 X135.026 Y120.626 E.01335
G1 X135.374 Y120.626 E.00722
G1 X135.829 Y120.171 E.01335
G1 X139.37 Y120.171 E.07345
G1 X139.825 Y120.626 E.01335
G1 X140.174 Y120.626 E.00722
G1 X140.629 Y120.171 E.01335
G1 X144.17 Y120.171 E.07345
G1 X144.625 Y120.626 E.01335
G1 X144.973 Y120.626 E.00722
G1 X145.429 Y120.171 E.01335
G1 X146.594 Y120.171 E.02417
G1 X146.594 Y120.626 E.00944
G1 X146.517 Y120.626 E.00159
M204 S10000
G1 X109.545 Y121.128 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.604932
G1 F6074
M204 S6000
G1 X146.395 Y121.128 E1.04349
; WIPE_START
G1 F10359.474
G1 X144.395 Y121.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.811 Y120.268 Z3.72 F42000
G1 X109.037 Y117.121 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6074
M204 S6000
G1 X109.085 Y116.755 E.00766
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.054 Y116.06 E.00257
G3 X146.915 Y116.755 I-.068 J.965 E.02443
G1 X146.963 Y117.121 E.00766
M73 P59 R9
G1 X109.097 Y117.121 E.78545
M204 S10000
G1 X108.619 Y117.545 F42000
G1 F6074
M204 S6000
G3 X108.671 Y116.644 I3.448 J-.252 E.01877
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.11 Y115.639 E.00314
G1 X146.356 Y115.671 E.00515
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.545 E.01046
G1 X108.679 Y117.545 E.80277
M204 S10000
G1 X108.21 Y117.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6074
M204 S5000
G1 X108.21 Y117.014 E.01813
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.163 Y115.233 E.00344
G1 X146.463 Y115.273 E.00583
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.954 E.01813
G1 X108.27 Y117.954 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.3581
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.518 Y116.019 E-.04183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.334 Y116.707 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.628753
G1 F6074
M204 S6000
G1 X109.892 Y116.596 E.01676
; LINE_WIDTH: 0.678669
G1 X110.104 Y116.582 E.00679
G1 X145.896 Y116.582 E1.14259
G1 X146.108 Y116.596 E.00678
; LINE_WIDTH: 0.628741
G1 X146.666 Y116.707 E.01676
; CHANGE_LAYER
; Z_HEIGHT: 3.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9950.439
G1 X146.108 Y116.596 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/83
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.72 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.812 Z3.72
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5962
M204 S6000
G1 X146.957 Y119.812 E.78641
G1 X146.957 Y121.483 E.03466
G1 X109.043 Y121.483 E.78641
G1 X109.043 Y119.872 E.03342
M204 S10000
G1 X108.619 Y119.388 F42000
G1 F5962
M204 S6000
G1 X147.381 Y119.388 E.80401
G1 X147.381 Y121.908 E.05226
G1 X108.619 Y121.908 E.80401
G1 X108.619 Y119.448 E.05102
M204 S10000
G1 X108.21 Y118.979 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5962
M204 S5000
G1 X147.79 Y118.979 E.76293
G1 X147.79 Y122.317 E.06434
G1 X108.21 Y122.317 E.76293
G1 X108.21 Y119.039 E.06319
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.036 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.84
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.84 F4000
            G39.3 S1
            G0 Z3.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.521 Y121.006 F42000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.557192
G1 F5962
M204 S6000
G1 X146.419 Y121.006 E.95872
M204 S10000
G1 X146.418 Y120.528 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5962
M204 S6000
G1 X146.594 Y120.528 E.00364
G1 X146.594 Y120.175 E.00731
G1 X145.424 Y120.175 E.02425
G1 X145.072 Y120.528 E.01034
G1 X144.527 Y120.528 E.01131
G1 X144.174 Y120.175 E.01034
G1 X140.625 Y120.175 E.07363
G1 X140.272 Y120.528 E.01034
G1 X139.727 Y120.528 E.01131
G1 X139.374 Y120.175 E.01034
G1 X135.825 Y120.175 E.07363
G1 X135.472 Y120.528 E.01034
G1 X134.927 Y120.528 E.01131
G1 X134.575 Y120.175 E.01034
G1 X131.025 Y120.175 E.07363
G1 X130.672 Y120.528 E.01034
G1 X130.127 Y120.528 E.01131
G1 X129.775 Y120.175 E.01034
G1 X126.225 Y120.175 E.07363
G1 X125.873 Y120.528 E.01034
G1 X125.327 Y120.528 E.01131
G1 X124.975 Y120.175 E.01034
G1 X121.425 Y120.175 E.07363
G1 X121.073 Y120.528 E.01034
G1 X120.528 Y120.528 E.01131
G1 X120.175 Y120.175 E.01034
G1 X116.626 Y120.175 E.07363
G1 X116.273 Y120.528 E.01034
G1 X115.728 Y120.528 E.01131
G1 X115.375 Y120.175 E.01034
G1 X111.826 Y120.175 E.07363
G1 X111.473 Y120.528 E.01034
G1 X110.928 Y120.528 E.01131
G1 X110.576 Y120.175 E.01034
G1 X109.406 Y120.175 E.02425
G1 X109.406 Y120.528 E.00731
G1 X109.582 Y120.528 E.00364
; WIPE_START
G1 F14142.679
G1 X109.406 Y120.528 E-.0666
G1 X109.406 Y120.175 E-.13397
G1 X110.576 Y120.175 E-.4443
G1 X110.79 Y120.389 E-.11514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.036 Y117.125 Z3.84 F42000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5962
M204 S6000
G1 X109.085 Y116.755 E.00775
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.063 Y116.061 E.00274
G3 X146.915 Y116.755 I-.075 J.963 E.02426
G1 X146.964 Y117.125 E.00775
G1 X109.096 Y117.125 E.78548
M204 S10000
G1 X108.619 Y117.549 F42000
G1 F5962
M204 S6000
G3 X108.671 Y116.644 I3.464 J-.254 E.01886
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.118 Y115.64 E.00332
G1 X146.356 Y115.671 E.00498
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.549 E.01055
G1 X108.679 Y117.549 E.80277
M204 S10000
G1 X108.21 Y117.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5962
M204 S5000
G1 X108.21 Y117.014 E.01821
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.171 Y115.234 E.0036
M73 P60 R9
G1 X146.463 Y115.273 E.00567
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.958 E.01821
G1 X108.27 Y117.958 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.35969
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.516 Y116.022 E-.04024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.333 Y116.709 Z3.84 F42000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.633117
G1 F5962
M204 S6000
G1 X109.892 Y116.598 E.01693
; LINE_WIDTH: 0.68286
G1 X110.104 Y116.584 E.00682
G1 X145.896 Y116.584 E1.14992
G1 X146.108 Y116.598 E.00681
; LINE_WIDTH: 0.633127
G1 X146.667 Y116.709 E.01693
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9878.583
G1 X146.108 Y116.598 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/83
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.84 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.816 Z3.84
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6018
M204 S6000
G1 X146.957 Y119.816 E.78641
G1 X146.957 Y121.337 E.03154
G1 X109.043 Y121.337 E.78641
G1 X109.043 Y119.876 E.0303
M204 S10000
G1 X108.619 Y119.392 F42000
G1 F6018
M204 S6000
G1 X147.381 Y119.392 E.80401
G1 X147.381 Y121.761 E.04914
G1 X108.619 Y121.761 E.80401
G1 X108.619 Y119.452 E.0479
M204 S10000
G1 X108.21 Y118.983 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6018
M204 S5000
G1 X147.79 Y118.983 E.76293
G1 X147.79 Y122.171 E.06144
G1 X108.21 Y122.171 E.76293
G1 X108.21 Y119.043 E.06029
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.96
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.96 F4000
            G39.3 S1
            G0 Z3.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X146.47 Y120.577 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.573962
G1 F6018
M204 S6000
G1 X146.47 Y120.303 E.00735
G1 X109.53 Y120.303 E.99013
G1 X109.53 Y120.851 E.01469
M73 P60 R8
G1 X146.47 Y120.851 E.99013
G1 X146.47 Y120.637 E.00574
; WIPE_START
G1 F10944.711
G1 X146.47 Y120.851 E-.08136
G1 X144.684 Y120.851 E-.67864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.093 Y120.058 Z3.96 F42000
G1 X109.035 Y117.129 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6018
M204 S6000
G1 X109.085 Y116.755 E.00783
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.071 Y116.062 E.00291
G3 X146.915 Y116.755 I-.083 J.962 E.02408
G1 X146.965 Y117.129 E.00783
G1 X109.095 Y117.129 E.7855
M204 S10000
G1 X108.619 Y117.553 F42000
G1 F6018
M204 S6000
G3 X108.671 Y116.644 I3.48 J-.256 E.01895
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.126 Y115.641 E.00349
G1 X146.356 Y115.671 E.00481
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.553 E.01064
G1 X108.679 Y117.553 E.80277
M204 S10000
G1 X108.21 Y117.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6018
M204 S5000
G1 X108.21 Y117.014 E.01829
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.18 Y115.235 E.00376
G1 X146.463 Y115.273 E.00551
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.963 E.01829
G1 X108.27 Y117.963 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36128
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.513 Y116.025 E-.03865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.332 Y116.712 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.63748
G1 F6018
M204 S6000
G1 X109.893 Y116.6 E.01709
; LINE_WIDTH: 0.68705
G1 X110.104 Y116.586 E.00685
G1 X145.896 Y116.586 E1.15724
G1 X146.107 Y116.6 E.00684
; LINE_WIDTH: 0.637473
G1 X146.668 Y116.712 E.0171
; CHANGE_LAYER
; Z_HEIGHT: 3.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9808.391
G1 X146.107 Y116.6 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/83
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z3.96 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.821 Z3.96
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5911
M204 S6000
G1 X146.957 Y119.821 E.78641
G1 X146.957 Y121.191 E.02842
G1 X109.043 Y121.191 E.78641
G1 X109.043 Y119.881 E.02718
M204 S10000
G1 X108.619 Y119.396 F42000
G1 F5911
M204 S6000
G1 X147.381 Y119.396 E.80401
G1 X147.381 Y121.615 E.04602
G1 X108.619 Y121.615 E.80401
G1 X108.619 Y119.456 E.04478
M204 S10000
G1 X108.21 Y118.987 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5911
M204 S5000
G1 X147.79 Y118.987 E.76293
G1 X147.79 Y122.024 E.05854
G1 X108.21 Y122.024 E.76293
G1 X108.21 Y119.047 E.05739
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.08
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.08 F4000
            G39.3 S1
            G0 Z4.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.492 Y120.742 F42000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498757
G1 F5911
M204 S6000
G1 X146.508 Y120.742 E.85604
G1 X146.508 Y120.269 E.01094
G1 X109.492 Y120.269 E.85604
G1 X109.492 Y120.682 E.00955
; WIPE_START
G1 F12684.856
G1 X109.492 Y120.269 E-.15694
G1 X111.079 Y120.269 E-.60306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.035 Y117.133 Z4.08 F42000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5911
M204 S6000
G1 X109.085 Y116.755 E.00792
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.079 Y116.063 E.00309
G3 X146.915 Y116.755 I-.09 J.96 E.02391
G1 X146.965 Y117.133 E.00792
G1 X109.095 Y117.133 E.78552
M204 S10000
G1 X108.619 Y117.558 F42000
G1 F5911
M204 S6000
G3 X108.671 Y116.644 I3.496 J-.258 E.01904
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.135 Y115.642 E.00366
G1 X146.356 Y115.671 E.00463
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.558 E.01072
G1 X108.679 Y117.558 E.80277
M204 S10000
G1 X108.21 Y117.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5911
M204 S5000
G1 X108.21 Y117.014 E.01837
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.188 Y115.237 E.00392
G1 X146.463 Y115.273 E.00534
M73 P61 R8
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.967 E.01837
G1 X108.27 Y117.967 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36287
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.511 Y116.029 E-.03706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.331 Y116.714 Z4.08 F42000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641831
G1 F5911
M204 S6000
G1 X109.893 Y116.602 E.01726
; LINE_WIDTH: 0.691231
G1 X110.104 Y116.588 E.00688
G1 X145.896 Y116.588 E1.16455
G1 X146.107 Y116.602 E.00687
; LINE_WIDTH: 0.641817
G1 X146.669 Y116.714 E.01726
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9739.235
G1 X146.107 Y116.602 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/83
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.08 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.825 Z4.08
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5903
M204 S6000
G1 X146.957 Y119.825 E.78641
G1 X146.957 Y121.072 E.02587
G1 X109.043 Y121.072 E.78641
G1 X109.043 Y119.885 E.02462
M204 S10000
G1 X108.619 Y119.401 F42000
G1 F5903
M204 S6000
G1 X147.381 Y119.401 E.80401
G1 X147.381 Y121.496 E.04347
G1 X108.619 Y121.496 E.80401
G1 X108.619 Y119.461 E.04222
M204 S10000
G1 X108.21 Y118.991 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5903
M204 S5000
G1 X147.79 Y118.991 E.76293
G1 X147.79 Y121.905 E.05617
G1 X108.21 Y121.905 E.76293
G1 X108.21 Y119.051 E.05501
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.461 Y120.654 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437167
G1 F5903
M204 S6000
G1 X146.539 Y120.654 E.74581
G1 X146.539 Y120.243 E.00828
G1 X109.461 Y120.243 E.74581
G1 X109.461 Y120.594 E.00707
; WIPE_START
G1 F14583.815
G1 X109.461 Y120.243 E-.13354
G1 X111.11 Y120.243 E-.62646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.034 Y117.138 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5903
M204 S6000
G1 X109.085 Y116.755 E.00801
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.087 Y116.064 E.00326
G3 X146.915 Y116.755 I-.097 J.958 E.02374
G1 X146.966 Y117.138 E.00801
G1 X109.094 Y117.138 E.78554
M204 S10000
G1 X108.619 Y117.562 F42000
G1 F5903
M204 S6000
G3 X108.671 Y116.644 I3.512 J-.261 E.01912
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.143 Y115.643 E.00384
G1 X146.356 Y115.671 E.00446
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.562 E.01081
G1 X108.679 Y117.562 E.80277
M204 S10000
G1 X108.21 Y117.971 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5903
M204 S5000
G1 X108.21 Y117.014 E.01845
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.196 Y115.238 E.00408
G1 X146.463 Y115.273 E.00518
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.971 E.01845
G1 X108.27 Y117.971 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36446
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.508 Y116.032 E-.03547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.33 Y116.716 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.646185
G1 F5903
M204 S6000
G1 X109.894 Y116.604 E.01743
; LINE_WIDTH: 0.695432
G1 X110.104 Y116.591 E.00691
G1 X145.896 Y116.591 E1.17189
G1 X146.106 Y116.604 E.0069
; LINE_WIDTH: 0.646184
G1 X146.67 Y116.716 E.01743
; CHANGE_LAYER
; Z_HEIGHT: 3.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9670.688
G1 X146.106 Y116.604 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/83
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.2 I-.105 J-1.212 P1  F42000
G1 X109.043 Y119.829 Z4.2
G1 Z3.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5896
M204 S6000
G1 X146.957 Y119.829 E.78641
G1 X146.957 Y120.973 E.02374
G1 X109.043 Y120.973 E.78641
G1 X109.043 Y119.889 E.02249
M204 S10000
G1 X108.619 Y119.405 F42000
M73 P62 R8
G1 F5896
M204 S6000
G1 X147.381 Y119.405 E.80401
G1 X147.381 Y121.398 E.04134
G1 X108.619 Y121.398 E.80401
G1 X108.619 Y119.465 E.04009
M204 S10000
G1 X108.21 Y118.996 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5896
M204 S5000
G1 X147.79 Y118.996 E.76293
G1 X147.79 Y121.807 E.05419
G1 X108.21 Y121.807 E.76293
G1 X108.21 Y119.056 E.05303
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.053 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.32
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.32 F4000
            G39.3 S1
            G0 Z4.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.436 Y120.581 F42000
G1 Z3.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385827
G1 F5896
M204 S6000
G1 X146.564 Y120.581 E.65365
G1 X146.564 Y120.221 E.00634
G1 X109.436 Y120.221 E.65365
G1 X109.436 Y120.521 E.00528
; WIPE_START
G1 F16663.196
G1 X109.436 Y120.221 E-.11403
G1 X111.136 Y120.221 E-.64597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.034 Y117.142 Z4.32 F42000
G1 Z3.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5896
M204 S6000
G1 X109.085 Y116.755 E.0081
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.096 Y116.065 E.00343
G3 X146.915 Y116.755 I-.105 J.957 E.02356
G1 X146.966 Y117.142 E.0081
G1 X109.094 Y117.142 E.78557
M204 S10000
G1 X108.619 Y117.566 F42000
G1 F5896
M204 S6000
G3 X108.671 Y116.644 I3.528 J-.263 E.01921
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.151 Y115.644 E.00401
G1 X146.356 Y115.671 E.00429
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.566 E.0109
G1 X108.679 Y117.566 E.80277
M204 S10000
G1 X108.21 Y117.975 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5896
M204 S5000
G1 X108.21 Y117.014 E.01853
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.204 Y115.239 E.00424
G1 X146.463 Y115.273 E.00502
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.975 E.01853
G1 X108.27 Y117.975 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36605
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.506 Y116.035 E-.03388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.329 Y116.719 Z4.32 F42000
G1 Z3.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.650558
G1 F5896
M204 S6000
G1 X109.894 Y116.606 E.0176
; LINE_WIDTH: 0.699622
G1 X110.104 Y116.593 E.00693
G1 X145.896 Y116.593 E1.17921
G1 X146.106 Y116.606 E.00693
; LINE_WIDTH: 0.650547
G1 X146.671 Y116.719 E.0176
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9603.157
G1 X146.106 Y116.606 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/83
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.32 I-.106 J-1.212 P1  F42000
G1 X109.043 Y119.833 Z4.32
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5576
M204 S6000
G1 X146.957 Y119.833 E.78641
G1 X146.957 Y120.875 E.02161
G1 X109.043 Y120.875 E.78641
G1 X109.043 Y119.893 E.02036
M204 S10000
G1 X108.619 Y119.409 F42000
G1 F5576
M204 S6000
G1 X147.381 Y119.409 E.80401
G1 X147.381 Y121.299 E.03921
G1 X108.619 Y121.299 E.80401
G1 X108.619 Y119.469 E.03796
M204 S10000
G1 X108.21 Y119 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5576
M204 S5000
G1 X147.79 Y119 E.76293
G1 X147.79 Y121.708 E.05221
G1 X108.21 Y121.708 E.76293
G1 X108.21 Y119.06 E.05106
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.44
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.44 F4000
            G39.3 S1
            G0 Z4.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.354 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.643232
G1 F5576
M204 S6000
G1 X146.744 Y120.354 E1.13179
; WIPE_START
G1 F9716.914
G1 X144.744 Y120.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.143 Y119.671 Z4.44 F42000
G1 X109.033 Y117.146 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5576
M204 S6000
G1 X109.085 Y116.755 E.00818
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.104 Y116.066 E.00361
G3 X146.915 Y116.755 I-.113 J.955 E.02339
G1 X146.967 Y117.146 E.00818
G1 X109.093 Y117.146 E.78559
M204 S10000
G1 X108.619 Y117.57 F42000
G1 F5576
M204 S6000
G3 X108.671 Y116.644 I3.543 J-.265 E.0193
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.159 Y115.646 E.00418
G1 X146.356 Y115.671 E.00411
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.57 E.01098
M73 P63 R8
G1 X108.679 Y117.57 E.80277
M204 S10000
G1 X108.21 Y117.979 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5576
M204 S5000
G1 X108.21 Y117.014 E.01861
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.213 Y115.24 E.00441
G1 X146.463 Y115.273 E.00486
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.979 E.01861
G1 X108.27 Y117.979 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36764
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.503 Y116.038 E-.03229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.328 Y116.721 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.654912
G1 F5576
M204 S6000
G1 X109.895 Y116.608 E.01777
; LINE_WIDTH: 0.703813
G1 X110.105 Y116.595 E.00696
G1 X145.895 Y116.595 E1.18654
G1 X146.105 Y116.608 E.00696
; LINE_WIDTH: 0.654909
G1 X146.672 Y116.721 E.01777
; CHANGE_LAYER
; Z_HEIGHT: 4.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9536.57
G1 X146.105 Y116.608 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/83
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.44 I-.106 J-1.212 P1  F42000
G1 X109.043 Y119.837 Z4.44
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5932
M204 S6000
G1 X146.957 Y119.837 E.78641
G1 X146.957 Y120.776 E.01948
G1 X109.043 Y120.776 E.78641
G1 X109.043 Y119.897 E.01823
M204 S10000
G1 X108.619 Y119.413 F42000
G1 F5932
M204 S6000
G1 X147.381 Y119.413 E.80401
G1 X147.381 Y121.201 E.03708
G1 X108.619 Y121.201 E.80401
G1 X108.619 Y119.473 E.03583
M204 S10000
G1 X108.21 Y119.004 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5932
M204 S5000
G1 X147.79 Y119.004 E.76293
G1 X147.79 Y121.61 E.05023
G1 X108.21 Y121.61 E.76293
G1 X108.21 Y119.064 E.04908
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.56
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.56 F4000
            G39.3 S1
            G0 Z4.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.307 F42000
G1 Z4.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.540562
G1 F5932
M204 S6000
G1 X146.744 Y120.307 E.9436
; WIPE_START
G1 F11654.786
G1 X144.744 Y120.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.142 Y119.635 Z4.56 F42000
G1 X109.033 Y117.15 Z4.56
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5932
M204 S6000
G1 X109.085 Y116.755 E.00827
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.112 Y116.067 E.00378
G3 X146.915 Y116.755 I-.121 J.954 E.02321
G1 X146.967 Y117.15 E.00827
G1 X109.093 Y117.15 E.78561
M204 S10000
G1 X108.619 Y117.574 F42000
G1 F5932
M204 S6000
G3 X108.671 Y116.644 I3.559 J-.267 E.01938
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.168 Y115.647 E.00436
G1 X146.356 Y115.671 E.00394
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.574 E.01107
G1 X108.679 Y117.574 E.80277
M204 S10000
G1 X108.21 Y117.984 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5932
M204 S5000
G1 X108.21 Y117.014 E.01869
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.221 Y115.241 E.00457
G1 X146.463 Y115.273 E.0047
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.984 E.01869
G1 X108.27 Y117.984 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.36922
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.501 Y116.042 E-.0307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.105 Y116.767 Z4.56 F42000
G1 Z4.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.366627
G1 F5932
M204 S6000
G1 X145.895 Y116.767 E.59649
G2 X146.506 Y116.774 I.587 J-25.131 E.01018
G1 X146.493 Y116.728 E.0008
G1 X146.247 Y116.492 E.00567
G1 X145.895 Y116.426 E.00597
G1 X110.093 Y116.426 E.59668
G1 X109.753 Y116.492 E.00578
G1 X109.507 Y116.728 E.00567
G1 X109.494 Y116.774 E.0008
G1 X110.045 Y116.768 E.00918
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F17601.764
G1 X109.494 Y116.774 E-.20936
G1 X109.507 Y116.728 E-.0182
G1 X109.753 Y116.492 E-.12937
G1 X110.093 Y116.426 E-.13187
G1 X110.807 Y116.426 E-.2712
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/83
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.56 I-1.081 J-.558 P1  F42000
G1 X109.043 Y119.842 Z4.56
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5879
M204 S6000
G1 X146.957 Y119.842 E.78641
M73 P64 R8
G1 X146.957 Y120.678 E.01735
G1 X109.043 Y120.678 E.78641
G1 X109.043 Y119.902 E.0161
M204 S10000
G1 X108.619 Y119.417 F42000
G1 F5879
M204 S6000
G1 X147.381 Y119.417 E.80401
G1 X147.381 Y121.102 E.03495
G1 X108.619 Y121.102 E.80401
G1 X108.619 Y119.477 E.0337
M204 S10000
G1 X108.21 Y119.008 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5879
M204 S5000
G1 X147.79 Y119.008 E.76293
G1 X147.79 Y121.511 E.04825
G1 X108.21 Y121.511 E.76293
G1 X108.21 Y119.068 E.0471
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.065 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.68
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.68 F4000
            G39.3 S1
            G0 Z4.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.26 F42000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.437892
G1 F5879
M204 S6000
G1 X146.744 Y120.26 E.75542
; WIPE_START
G1 F14558.161
G1 X144.744 Y120.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.141 Y119.599 Z4.68 F42000
G1 X109.032 Y117.154 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5879
M204 S6000
G1 X109.085 Y116.755 E.00836
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.121 Y116.068 E.00395
G3 X146.915 Y116.755 I-.129 J.953 E.02304
G1 X146.968 Y117.154 E.00836
G1 X109.092 Y117.154 E.78564
M204 S10000
G1 X108.619 Y117.579 F42000
G1 F5879
M204 S6000
G3 X108.671 Y116.644 I3.575 J-.269 E.01947
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.176 Y115.648 E.00453
G1 X146.356 Y115.671 E.00377
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.579 E.01116
G1 X108.679 Y117.579 E.80277
M204 S10000
G1 X108.21 Y117.988 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5879
M204 S5000
G1 X108.21 Y117.014 E.01877
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.229 Y115.242 E.00473
G1 X146.463 Y115.273 E.00454
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.988 E.01877
G1 X108.27 Y117.988 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.37081
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.498 Y116.045 E-.02912
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.105 Y116.771 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.368727
G1 F5879
M204 S6000
G1 X145.895 Y116.771 E.60016
G2 X146.506 Y116.777 I.586 J-25.084 E.01024
G1 X146.492 Y116.729 E.00084
G1 X146.246 Y116.493 E.00571
G1 X145.895 Y116.427 E.00599
G1 X110.094 Y116.427 E.60035
G1 X109.754 Y116.493 E.0058
G1 X109.508 Y116.729 E.00571
G1 X109.494 Y116.777 E.00084
G1 X110.045 Y116.771 E.00923
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F17494.002
G1 X109.494 Y116.777 E-.20925
G1 X109.508 Y116.729 E-.01906
G1 X109.754 Y116.493 E-.12941
G1 X110.094 Y116.427 E-.13153
M73 P64 R7
G1 X110.806 Y116.427 E-.27075
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/83
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.68 I-1.082 J-.558 P1  F42000
G1 X109.043 Y119.846 Z4.68
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5871
M204 S6000
G1 X146.957 Y119.846 E.78641
G1 X146.957 Y120.597 E.01559
G1 X109.043 Y120.597 E.78641
G1 X109.043 Y119.906 E.01434
M204 S10000
G1 X108.619 Y119.422 F42000
G1 F5871
M204 S6000
G1 X147.381 Y119.422 E.80401
G1 X147.381 Y121.022 E.03319
G1 X108.619 Y121.022 E.80401
G1 X108.619 Y119.482 E.03194
M204 S10000
G1 X108.21 Y119.012 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5871
M204 S5000
G1 X147.79 Y119.012 E.76293
G1 X147.79 Y121.431 E.04662
G1 X108.21 Y121.431 E.76293
G1 X108.21 Y119.072 E.04546
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.069 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.222 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.353042
G1 F5871
M204 S6000
G1 X146.744 Y120.222 E.5999
; WIPE_START
G1 F18332.367
G1 X144.744 Y120.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.14 Y119.569 Z4.8 F42000
G1 X109.032 Y117.158 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5871
M204 S6000
G1 X109.085 Y116.755 E.00845
M73 P65 R7
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.129 Y116.069 E.00413
G3 X146.915 Y116.755 I-.138 J.952 E.02287
G1 X146.968 Y117.158 E.00845
G1 X109.092 Y117.158 E.78566
M204 S10000
G1 X108.619 Y117.583 F42000
G1 F5871
M204 S6000
G3 X108.671 Y116.644 I3.591 J-.271 E.01956
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.184 Y115.649 E.0047
G1 X146.356 Y115.671 E.00359
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.583 E.01124
G1 X108.679 Y117.583 E.80277
M204 S10000
G1 X108.21 Y117.992 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5871
M204 S5000
G1 X108.21 Y117.014 E.01885
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.238 Y115.243 E.00489
G1 X146.463 Y115.273 E.00438
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.992 E.01885
G1 X108.27 Y117.992 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.3724
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17737
G1 X108.495 Y116.048 E-.02754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.105 Y116.774 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.370817
G1 F5871
M204 S6000
G1 X145.895 Y116.774 E.60382
G2 X146.505 Y116.78 I.584 J-24.957 E.0103
G1 X146.491 Y116.73 E.00089
G1 X146.245 Y116.494 E.00574
G1 X145.895 Y116.428 E.00601
G1 X110.094 Y116.428 E.60401
G1 X109.754 Y116.494 E.00583
G1 X109.509 Y116.73 E.00574
G1 X109.495 Y116.78 E.00088
G1 X110.045 Y116.774 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F17388.045
G1 X109.495 Y116.78 E-.20915
G1 X109.509 Y116.73 E-.01992
G1 X109.754 Y116.494 E-.12937
G1 X110.094 Y116.428 E-.13127
G1 X110.805 Y116.428 E-.27029
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/83
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.8 I-1.082 J-.557 P1  F42000
G1 X109.043 Y119.85 Z4.8
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5866
M204 S6000
G1 X146.957 Y119.85 E.78641
G1 X146.957 Y120.533 E.01417
G1 X109.043 Y120.533 E.78641
G1 X109.043 Y119.91 E.01293
M204 S10000
G1 X108.619 Y119.426 F42000
G1 F5866
M204 S6000
G1 X147.381 Y119.426 E.80401
G1 X147.381 Y120.957 E.03177
G1 X108.619 Y120.957 E.80401
G1 X108.619 Y119.486 E.03053
M204 S10000
G1 X108.21 Y119.017 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5866
M204 S5000
G1 X147.79 Y119.017 E.76293
G1 X147.79 Y121.367 E.0453
G1 X108.21 Y121.367 E.76293
G1 X108.21 Y119.077 E.04414
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.073 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.92
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.92 F4000
            G39.3 S1
            G0 Z4.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.192 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.284712
G1 F5866
M204 S6000
G1 X146.744 Y120.192 E.47465
; WIPE_START
G1 F21000
G1 X144.744 Y120.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.139 Y119.547 Z4.92 F42000
G1 X109.031 Y117.163 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5866
M204 S6000
G1 X109.085 Y116.755 E.00853
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.137 Y116.071 E.0043
G3 X146.915 Y116.755 I-.147 J.951 E.0227
G1 X146.969 Y117.163 E.00853
G1 X109.091 Y117.163 E.78568
M204 S10000
G1 X108.619 Y117.587 F42000
G1 F5866
M204 S6000
G3 X108.671 Y116.644 I3.607 J-.273 E.01964
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.192 Y115.65 E.00488
G1 X146.356 Y115.671 E.00342
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.587 E.01133
G1 X108.679 Y117.587 E.80277
M204 S10000
G1 X108.21 Y117.996 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5866
M204 S5000
G1 X108.21 Y117.014 E.01894
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.246 Y115.244 E.00505
G1 X146.463 Y115.273 E.00422
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y117.996 E.01894
G1 X108.27 Y117.996 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.37399
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.493 Y116.052 E-.02593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.105 Y116.777 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372921
G1 F5866
M204 S6000
G1 X145.895 Y116.777 E.6075
G2 X146.504 Y116.783 I.576 J-27.188 E.01034
G2 X146.389 Y116.6 I-.274 J.045 E.00377
G1 X146.102 Y116.449 E.00551
G1 X145.895 Y116.429 E.00353
G1 X110.094 Y116.429 E.60769
G1 X109.755 Y116.495 E.00585
G1 X109.51 Y116.731 E.00578
G1 X109.495 Y116.784 E.00093
G1 X110.045 Y116.777 E.00934
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F17282.637
G1 X109.495 Y116.784 E-.20904
G1 X109.51 Y116.731 E-.02082
G1 X109.755 Y116.495 E-.12937
G1 X110.094 Y116.429 E-.13093
G1 X110.804 Y116.429 E-.26984
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/83
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z4.92 I-1.082 J-.556 P1  F42000
G1 X109.043 Y119.854 Z4.92
M73 P66 R7
G1 Z4.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5538
M204 S6000
G1 X146.957 Y119.854 E.78641
G1 X146.957 Y120.469 E.01275
G1 X109.043 Y120.469 E.78641
G1 X109.043 Y119.914 E.01151
M204 S10000
G1 X108.619 Y119.43 F42000
G1 F5538
M204 S6000
G1 X147.381 Y119.43 E.80401
G1 X147.381 Y120.893 E.03035
G1 X108.619 Y120.893 E.80401
G1 X108.619 Y119.49 E.02911
M204 S10000
G1 X108.21 Y119.021 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5538
M204 S5000
G1 X147.79 Y119.021 E.76293
G1 X147.79 Y121.303 E.04398
G1 X108.21 Y121.303 E.76293
G1 X108.21 Y119.081 E.04283
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.04
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.04 F4000
            G39.3 S1
            G0 Z5.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.162 F42000
G1 Z4.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216382
G1 F5538
M204 S6000
G1 X146.744 Y120.162 E.34941
; WIPE_START
G1 F21000
G1 X144.744 Y120.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.139 Y119.524 Z5.04 F42000
G1 X109.031 Y117.167 Z5.04
G1 Z4.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5538
M204 S6000
G1 X109.085 Y116.755 E.00862
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.145 Y116.072 E.00447
G3 X146.915 Y116.755 I-.156 J.951 E.02252
G1 X146.969 Y117.167 E.00862
G1 X109.091 Y117.167 E.7857
M204 S10000
G1 X108.619 Y117.591 F42000
G1 F5538
M204 S6000
G3 X108.671 Y116.644 I3.623 J-.275 E.01973
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.201 Y115.651 E.00505
G1 X146.356 Y115.671 E.00325
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.591 E.01142
G1 X108.679 Y117.591 E.80277
M204 S10000
G1 X108.21 Y118 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5538
M204 S5000
G1 X108.21 Y117.014 E.01902
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.254 Y115.245 E.00521
G1 X146.463 Y115.273 E.00406
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118 E.01902
G1 X108.27 Y118 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.37558
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.49 Y116.055 E-.02435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.047 Y116.412 Z5.04 F42000
G1 Z4.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5538
M204 S6000
G2 X109.457 Y116.804 I-.021 J.608 E.01567
G1 X110.397 Y116.804 E.0195
G1 X110.795 Y116.406 E.01167
G1 X111.607 Y116.406 E.01684
G1 X112.004 Y116.804 E.01167
G1 X115.197 Y116.804 E.06622
G1 X115.595 Y116.406 E.01167
G1 X116.406 Y116.406 E.01684
G1 X116.804 Y116.804 E.01167
G1 X119.997 Y116.804 E.06622
G1 X120.394 Y116.406 E.01167
G1 X121.206 Y116.406 E.01684
G1 X121.604 Y116.804 E.01167
G1 X124.797 Y116.804 E.06622
G1 X125.194 Y116.406 E.01167
G1 X126.006 Y116.406 E.01684
G1 X126.404 Y116.804 E.01167
G1 X129.596 Y116.804 E.06622
G1 X129.994 Y116.406 E.01167
G1 X130.806 Y116.406 E.01684
G1 X131.203 Y116.804 E.01167
G1 X134.396 Y116.804 E.06622
G1 X134.794 Y116.406 E.01167
G1 X135.606 Y116.406 E.01684
G1 X136.003 Y116.804 E.01167
G1 X139.196 Y116.804 E.06622
G1 X139.594 Y116.406 E.01167
G1 X140.405 Y116.406 E.01684
G1 X140.803 Y116.804 E.01167
G1 X143.996 Y116.804 E.06622
G1 X144.393 Y116.406 E.01167
G1 X145.205 Y116.406 E.01684
G1 X145.603 Y116.804 E.01167
G1 X146.543 Y116.804 E.0195
G2 X145.953 Y116.412 I-.624 J.299 E.01541
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.13217
G1 X146.543 Y116.804 E-.15116
G1 X145.603 Y116.804 E-.3572
G1 X145.381 Y116.582 E-.11948
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/83
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.04 I-.109 J-1.212 P1  F42000
G1 X109.043 Y119.858 Z5.04
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5626
M204 S6000
G1 X146.957 Y119.858 E.78641
G1 X146.957 Y120.405 E.01134
M73 P67 R7
G1 X109.043 Y120.405 E.78641
G1 X109.043 Y119.918 E.01009
M204 S10000
G1 X108.619 Y119.434 F42000
G1 F5626
M204 S6000
G1 X147.381 Y119.434 E.80401
G1 X147.381 Y120.829 E.02894
G1 X108.619 Y120.829 E.80401
G1 X108.619 Y119.494 E.02769
M204 S10000
G1 X108.21 Y119.025 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5626
M204 S5000
G1 X147.79 Y119.025 E.76293
G1 X147.79 Y121.238 E.04267
G1 X108.21 Y121.238 E.76293
G1 X108.21 Y119.085 E.04151
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.082 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.16
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.16 F4000
            G39.3 S1
            G0 Z5.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.256 Y120.132 F42000
G1 Z4.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.148052
G1 F5626
M204 S6000
G1 X146.744 Y120.132 E.22417
; WIPE_START
G1 F21000
G1 X144.744 Y120.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.138 Y119.501 Z5.16 F42000
G1 X109.03 Y117.171 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5626
M204 S6000
G1 X109.085 Y116.755 E.00871
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.154 Y116.073 E.00465
G3 X146.915 Y116.755 I-.165 J.95 E.02235
G1 X146.97 Y117.171 E.00871
G1 X109.09 Y117.171 E.78573
M204 S10000
G1 X108.619 Y117.595 F42000
G1 F5626
M204 S6000
G3 X108.671 Y116.644 I3.639 J-.277 E.01982
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.209 Y115.652 E.00522
G1 X146.356 Y115.671 E.00307
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.595 E.01151
G1 X108.679 Y117.595 E.80277
M204 S10000
G1 X108.21 Y118.005 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5626
M204 S5000
G1 X108.21 Y117.014 E.0191
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.262 Y115.246 E.00537
G1 X146.463 Y115.273 E.0039
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.005 E.0191
G1 X108.27 Y118.005 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.37717
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.488 Y116.058 E-.02276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.12 Y116.131 Z5.16 F42000
G1 X145.955 Y116.413 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5626
M204 S6000
G1 X146.106 Y116.432 E.00316
G3 X146.545 Y116.808 I-.111 J.572 E.01253
G1 X145.607 Y116.808 E.01945
G1 X145.205 Y116.406 E.01179
G1 X144.393 Y116.406 E.01684
G1 X143.992 Y116.808 E.01179
G1 X140.807 Y116.808 E.06605
G1 X140.405 Y116.406 E.01179
G1 X139.594 Y116.406 E.01684
G1 X139.192 Y116.808 E.01179
G1 X136.007 Y116.808 E.06605
G1 X135.606 Y116.406 E.01179
G1 X134.794 Y116.406 E.01684
G1 X134.392 Y116.808 E.01179
G1 X131.208 Y116.808 E.06605
G1 X130.806 Y116.406 E.01179
G1 X129.994 Y116.406 E.01684
G1 X129.592 Y116.808 E.01179
G1 X126.408 Y116.808 E.06605
G1 X126.006 Y116.406 E.01179
G1 X125.194 Y116.406 E.01684
G1 X124.792 Y116.808 E.01179
G1 X121.608 Y116.808 E.06605
G1 X121.206 Y116.406 E.01179
G1 X120.394 Y116.406 E.01684
G1 X119.993 Y116.808 E.01179
G1 X116.808 Y116.808 E.06605
G1 X116.406 Y116.406 E.01179
G1 X115.595 Y116.406 E.01684
G1 X115.193 Y116.808 E.01179
G1 X112.008 Y116.808 E.06605
G1 X111.607 Y116.406 E.01179
G1 X110.795 Y116.406 E.01684
G1 X110.393 Y116.808 E.01179
G1 X109.455 Y116.808 E.01945
G3 X110.045 Y116.413 I.57 J.212 E.01572
; CHANGE_LAYER
; Z_HEIGHT: 4.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.13138
G1 X109.455 Y116.808 E-.15281
G1 X110.393 Y116.808 E-.35627
G1 X110.615 Y116.586 E-.11955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/83
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.16 I-1.097 J-.526 P1  F42000
G1 X109.043 Y119.863 Z5.16
G1 Z4.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5084
M204 S6000
G1 X146.957 Y119.863 E.78641
G1 X146.957 Y120.341 E.00992
G1 X109.043 Y120.341 E.78641
G1 X109.043 Y119.923 E.00867
M204 S10000
G1 X108.619 Y119.438 F42000
G1 F5084
M204 S6000
G1 X147.381 Y119.438 E.80401
G1 X147.381 Y120.765 E.02752
G1 X108.619 Y120.765 E.80401
G1 X108.619 Y119.498 E.02627
M204 S10000
G1 X108.21 Y119.029 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5084
M204 S5000
G1 X147.79 Y119.029 E.76293
G1 X147.79 Y121.174 E.04135
G1 X108.21 Y121.174 E.76293
G1 X108.21 Y119.089 E.04019
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.086 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.029 Y117.175 Z5.28 F42000
G1 Z4.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5084
M204 S6000
G1 X109.085 Y116.755 E.0088
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.162 Y116.074 E.00482
G1 X146.245 Y116.085 E.00174
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.971 Y117.175 E.0088
G1 X109.089 Y117.175 E.78575
M204 S10000
G1 X108.619 Y117.6 F42000
G1 F5084
M204 S6000
G3 X108.671 Y116.644 I3.655 J-.279 E.01991
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.217 Y115.653 E.0054
G1 X146.356 Y115.671 E.0029
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.6 E.01159
G1 X108.679 Y117.6 E.80277
M204 S10000
G1 X108.21 Y118.009 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5084
M204 S5000
G1 X108.21 Y117.014 E.01918
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.271 Y115.247 E.00553
G1 X146.463 Y115.273 E.00373
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.009 E.01918
G1 X108.27 Y118.009 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.37876
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.485 Y116.062 E-.02116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.28
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.28 F4000
            G39.3 S1
            G0 Z5.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.043 Y116.413 F42000
G1 Z4.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5084
M204 S6000
G2 X109.454 Y116.812 I-.018 J.607 E.01577
G1 X110.389 Y116.812 E.0194
G1 X110.795 Y116.406 E.01191
G1 X111.607 Y116.406 E.01684
G1 X112.013 Y116.812 E.01191
G1 X115.189 Y116.812 E.06588
G1 X115.595 Y116.406 E.01191
G1 X116.406 Y116.406 E.01684
G1 X116.812 Y116.812 E.01191
G1 X119.988 Y116.812 E.06588
G1 X120.394 Y116.406 E.01191
G1 X121.206 Y116.406 E.01684
M73 P68 R7
G1 X121.612 Y116.812 E.01191
G1 X124.788 Y116.812 E.06588
G1 X125.194 Y116.406 E.01191
G1 X126.006 Y116.406 E.01684
G1 X126.412 Y116.812 E.01191
G1 X129.588 Y116.812 E.06588
G1 X129.994 Y116.406 E.01191
G1 X130.806 Y116.406 E.01684
G1 X131.212 Y116.812 E.01191
G1 X134.388 Y116.812 E.06588
G1 X134.794 Y116.406 E.01191
G1 X135.606 Y116.406 E.01684
G1 X136.012 Y116.812 E.01191
G1 X139.188 Y116.812 E.06588
G1 X139.594 Y116.406 E.01191
G1 X140.405 Y116.406 E.01684
G1 X140.811 Y116.812 E.01191
G1 X143.987 Y116.812 E.06588
G1 X144.393 Y116.406 E.01191
G1 X145.205 Y116.406 E.01684
G1 X145.611 Y116.812 E.01191
G1 X146.546 Y116.812 E.0194
G2 X145.957 Y116.413 I-.626 J.289 E.01551
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.13062
G1 X146.546 Y116.812 E-.15443
G1 X145.611 Y116.812 E-.35533
G1 X145.389 Y116.59 E-.11961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/83
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.28 I-.109 J-1.212 P1  F42000
G1 X109.043 Y119.867 Z5.28
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5162
M204 S6000
G1 X146.957 Y119.867 E.78641
G1 X146.957 Y120.277 E.0085
G1 X109.043 Y120.277 E.78641
G1 X109.043 Y119.927 E.00726
M204 S10000
G1 X108.619 Y119.443 F42000
G1 F5162
M204 S6000
G1 X147.381 Y119.443 E.80401
G1 X147.381 Y120.701 E.0261
G1 X108.619 Y120.701 E.80401
G1 X108.619 Y119.503 E.02486
M204 S10000
G1 X108.21 Y119.033 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
M204 S5000
G1 X147.79 Y119.033 E.76293
G1 X147.79 Y121.11 E.04003
G1 X108.21 Y121.11 E.76293
G1 X108.21 Y119.093 E.03888
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.09 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.029 Y117.179 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
M204 S6000
G1 X109.085 Y116.755 E.00889
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.17 Y116.075 E.00499
G1 X146.245 Y116.085 E.00157
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.971 Y117.179 E.00889
G1 X109.089 Y117.179 E.78577
M204 S10000
G1 X108.619 Y117.604 F42000
G1 F5162
M204 S6000
G3 X108.671 Y116.644 I3.671 J-.282 E.01999
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.226 Y115.654 E.00557
G1 X146.356 Y115.671 E.00273
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.604 E.01168
G1 X108.679 Y117.604 E.80277
M204 S10000
G1 X108.21 Y118.013 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
M204 S5000
G1 X108.21 Y117.014 E.01926
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.279 Y115.249 E.00569
G1 X146.463 Y115.273 E.00357
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.013 E.01926
G1 X108.27 Y118.013 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38035
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.483 Y116.065 E-.01957
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X145.959 Y116.413 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5162
M204 S6000
G1 X146.123 Y116.435 E.00342
G3 X146.548 Y116.817 I-.133 J.575 E.01238
G1 X145.615 Y116.817 E.01935
G1 X145.205 Y116.406 E.01203
G1 X144.393 Y116.406 E.01684
G1 X143.983 Y116.817 E.01203
G1 X140.816 Y116.817 E.0657
G1 X140.405 Y116.406 E.01203
G1 X139.594 Y116.406 E.01684
G1 X139.183 Y116.817 E.01204
G1 X136.016 Y116.817 E.0657
G1 X135.606 Y116.406 E.01203
G1 X134.794 Y116.406 E.01684
G1 X134.384 Y116.817 E.01203
G1 X131.216 Y116.817 E.0657
G1 X130.806 Y116.406 E.01203
G1 X129.994 Y116.406 E.01684
G1 X129.584 Y116.817 E.01203
G1 X126.416 Y116.817 E.0657
G1 X126.006 Y116.406 E.01203
G1 X125.194 Y116.406 E.01684
G1 X124.784 Y116.817 E.01203
G1 X121.616 Y116.817 E.0657
G1 X121.206 Y116.406 E.01203
G1 X120.394 Y116.406 E.01684
G1 X119.984 Y116.817 E.01203
G1 X116.817 Y116.817 E.0657
G1 X116.406 Y116.406 E.01203
G1 X115.595 Y116.406 E.01684
G1 X115.184 Y116.817 E.01204
G1 X112.017 Y116.817 E.0657
G1 X111.607 Y116.406 E.01203
G1 X110.795 Y116.406 E.01684
G1 X110.385 Y116.817 E.01203
G1 X109.452 Y116.817 E.01935
G3 X110.041 Y116.413 I.572 J.204 E.01582
; CHANGE_LAYER
; Z_HEIGHT: 5.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12978
G1 X109.452 Y116.817 E-.15614
G1 X110.385 Y116.817 E-.3544
G1 X110.607 Y116.594 E-.11968
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/83
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.4 I-1.098 J-.524 P1  F42000
G1 X109.043 Y119.871 Z5.4
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5078
M204 S6000
G1 X146.957 Y119.871 E.78641
G1 X146.957 Y120.233 E.00752
G1 X109.043 Y120.233 E.78641
G1 X109.043 Y119.931 E.00628
M204 S10000
G1 X108.619 Y119.447 F42000
G1 F5078
M204 S6000
G1 X147.381 Y119.447 E.80401
G1 X147.381 Y120.658 E.02512
G1 X108.619 Y120.658 E.80401
G1 X108.619 Y119.507 E.02387
M204 S10000
G1 X108.21 Y119.037 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P69 R7
G1 F5078
M204 S5000
G1 X147.79 Y119.037 E.76293
G1 X147.79 Y121.067 E.03912
G1 X108.21 Y121.067 E.76293
G1 X108.21 Y119.097 E.03796
; WIPE_START
M73 P69 R6
G1 F12000
M204 S6000
G1 X110.21 Y119.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.028 Y117.184 Z5.52 F42000
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5078
M204 S6000
G1 X109.085 Y116.755 E.00897
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.178 Y116.076 E.00517
G1 X146.245 Y116.085 E.0014
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.972 Y117.184 E.00897
G1 X109.088 Y117.184 E.7858
M204 S10000
G1 X108.619 Y117.608 F42000
G1 F5078
M204 S6000
G3 X108.671 Y116.644 I3.687 J-.284 E.02008
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.234 Y115.655 E.00574
G1 X146.356 Y115.671 E.00255
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.608 E.01177
G1 X108.679 Y117.608 E.80277
M204 S10000
G1 X108.21 Y118.017 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5078
M204 S5000
G1 X108.21 Y117.014 E.01934
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.287 Y115.25 E.00585
G1 X146.463 Y115.273 E.00341
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.017 E.01934
G1 X108.27 Y118.017 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38194
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.48 Y116.068 E-.01798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.52
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.52 F4000
            G39.3 S1
            G0 Z5.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.039 Y116.413 F42000
G1 Z5.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5078
M204 S6000
G2 X109.45 Y116.821 I-.015 J.607 E.01587
G1 X110.38 Y116.821 E.01929
G1 X110.795 Y116.406 E.01216
G1 X111.607 Y116.406 E.01684
G1 X112.021 Y116.821 E.01216
G1 X115.18 Y116.821 E.06553
G1 X115.595 Y116.406 E.01216
G1 X116.406 Y116.406 E.01684
G1 X116.821 Y116.821 E.01216
G1 X119.98 Y116.821 E.06553
G1 X120.394 Y116.406 E.01216
G1 X121.206 Y116.406 E.01684
G1 X121.621 Y116.821 E.01216
G1 X124.78 Y116.821 E.06553
G1 X125.194 Y116.406 E.01216
G1 X126.006 Y116.406 E.01684
G1 X126.42 Y116.821 E.01216
G1 X129.58 Y116.821 E.06553
G1 X129.994 Y116.406 E.01216
G1 X130.806 Y116.406 E.01684
G1 X131.22 Y116.821 E.01216
G1 X134.379 Y116.821 E.06553
G1 X134.794 Y116.406 E.01216
G1 X135.606 Y116.406 E.01684
G1 X136.02 Y116.821 E.01216
G1 X139.179 Y116.821 E.06553
G1 X139.594 Y116.406 E.01216
G1 X140.405 Y116.406 E.01684
G1 X140.82 Y116.821 E.01216
G1 X143.979 Y116.821 E.06553
G1 X144.393 Y116.406 E.01216
G1 X145.205 Y116.406 E.01684
G1 X145.62 Y116.821 E.01216
G1 X146.55 Y116.821 E.01929
G2 X145.961 Y116.413 I-.628 J.278 E.01561
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.12906
G1 X146.55 Y116.821 E-.15774
G1 X145.62 Y116.821 E-.35346
G1 X145.397 Y116.598 E-.11974
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/83
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.52 I-.109 J-1.212 P1  F42000
G1 X109.043 Y119.875 Z5.52
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5158
M204 S6000
G1 X146.957 Y119.875 E.78641
G1 X146.957 Y120.197 E.00668
G1 X109.043 Y120.197 E.78641
G1 X109.043 Y119.935 E.00543
M204 S10000
G1 X108.619 Y119.451 F42000
G1 F5158
M204 S6000
G1 X147.381 Y119.451 E.80401
G1 X147.381 Y120.621 E.02428
G1 X108.619 Y120.621 E.80401
G1 X108.619 Y119.511 E.02303
M204 S10000
G1 X108.21 Y119.042 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5158
M204 S5000
G1 X147.79 Y119.042 E.76293
G1 X147.79 Y121.031 E.03834
G1 X108.21 Y121.031 E.76293
G1 X108.21 Y119.102 E.03718
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.028 Y117.188 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5158
M204 S6000
G1 X109.085 Y116.755 E.00906
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.187 Y116.077 E.00534
G1 X146.245 Y116.085 E.00122
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.972 Y117.188 E.00906
G1 X109.088 Y117.188 E.78582
M204 S10000
G1 X108.619 Y117.612 F42000
G1 F5158
M204 S6000
G3 X108.671 Y116.644 I3.703 J-.286 E.02017
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.242 Y115.656 E.00592
G1 X146.356 Y115.671 E.00238
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.612 E.01185
G1 X108.679 Y117.612 E.80277
M204 S10000
G1 X108.21 Y118.021 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5158
M204 S5000
G1 X108.21 Y117.014 E.01942
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.296 Y115.251 E.00602
G1 X146.463 Y115.273 E.00325
M73 P70 R6
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.021 E.01942
G1 X108.27 Y118.021 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38353
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.478 Y116.072 E-.0164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.64
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.64 F4000
            G39.3 S1
            G0 Z5.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X145.964 Y116.414 F42000
G1 Z5.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5158
M204 S6000
G1 X146.139 Y116.437 E.00368
G3 X146.552 Y116.825 I-.158 J.581 E.01223
G1 X145.624 Y116.825 E.01924
G1 X145.205 Y116.406 E.01228
G1 X144.393 Y116.406 E.01684
G1 X143.975 Y116.825 E.01228
G1 X140.824 Y116.825 E.06536
G1 X140.405 Y116.406 E.01228
G1 X139.594 Y116.406 E.01684
G1 X139.175 Y116.825 E.01228
G1 X136.024 Y116.825 E.06536
G1 X135.606 Y116.406 E.01228
G1 X134.794 Y116.406 E.01684
G1 X134.375 Y116.825 E.01228
G1 X131.224 Y116.825 E.06536
G1 X130.806 Y116.406 E.01228
G1 X129.994 Y116.406 E.01684
G1 X129.575 Y116.825 E.01228
G1 X126.425 Y116.825 E.06536
G1 X126.006 Y116.406 E.01228
G1 X125.194 Y116.406 E.01684
G1 X124.776 Y116.825 E.01228
G1 X121.625 Y116.825 E.06536
G1 X121.206 Y116.406 E.01228
G1 X120.394 Y116.406 E.01684
G1 X119.976 Y116.825 E.01228
G1 X116.825 Y116.825 E.06536
G1 X116.406 Y116.406 E.01228
G1 X115.595 Y116.406 E.01684
G1 X115.176 Y116.825 E.01228
G1 X112.025 Y116.825 E.06536
G1 X111.607 Y116.406 E.01228
G1 X110.795 Y116.406 E.01684
G1 X110.376 Y116.825 E.01228
G1 X109.448 Y116.825 E.01924
G3 X110.036 Y116.414 I.575 J.196 E.01592
; CHANGE_LAYER
; Z_HEIGHT: 5.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12825
G1 X109.448 Y116.825 E-.15942
G1 X110.376 Y116.825 E-.35252
G1 X110.599 Y116.602 E-.11981
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/83
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.64 I-1.099 J-.522 P1  F42000
G1 X109.043 Y119.879 Z5.64
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5075
M204 S6000
G1 X146.957 Y119.879 E.78641
G1 X146.957 Y120.161 E.00584
G1 X109.043 Y120.161 E.78641
G1 X109.043 Y119.939 E.00459
M204 S10000
G1 X108.619 Y119.455 F42000
G1 F5075
M204 S6000
G1 X147.381 Y119.455 E.80401
G1 X147.381 Y120.585 E.02344
G1 X108.619 Y120.585 E.80401
G1 X108.619 Y119.515 E.02219
M204 S10000
G1 X108.21 Y119.046 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5075
M204 S5000
G1 X147.79 Y119.046 E.76293
G1 X147.79 Y120.994 E.03755
G1 X108.21 Y120.994 E.76293
G1 X108.21 Y119.106 E.0364
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.103 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.027 Y117.192 Z5.76 F42000
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5075
M204 S6000
G1 X109.085 Y116.755 E.00915
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.195 Y116.078 E.00551
G1 X146.245 Y116.085 E.00105
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.973 Y117.192 E.00915
G1 X109.087 Y117.192 E.78584
M204 S10000
G1 X108.619 Y117.616 F42000
G1 F5075
M204 S6000
G3 X108.671 Y116.644 I3.719 J-.288 E.02025
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.25 Y115.658 E.00609
G1 X146.356 Y115.671 E.00221
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.616 E.01194
G1 X108.679 Y117.616 E.80277
M204 S10000
G1 X108.21 Y118.026 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5075
M204 S5000
G1 X108.21 Y117.014 E.0195
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.304 Y115.252 E.00618
G1 X146.463 Y115.273 E.00309
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.026 E.0195
G1 X108.27 Y118.026 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38512
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.475 Y116.075 E-.01481
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.76
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.76 F4000
            G39.3 S1
            G0 Z5.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.034 Y116.414 F42000
G1 Z5.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5075
M204 S6000
G2 X109.447 Y116.829 I-.011 J.607 E.01597
G1 X110.372 Y116.829 E.01919
G1 X110.795 Y116.406 E.0124
G1 X111.607 Y116.406 E.01684
G1 X112.029 Y116.829 E.0124
G1 X115.172 Y116.829 E.06518
G1 X115.595 Y116.406 E.0124
G1 X116.406 Y116.406 E.01684
G1 X116.829 Y116.829 E.0124
G1 X119.972 Y116.829 E.06518
G1 X120.394 Y116.406 E.0124
G1 X121.206 Y116.406 E.01684
G1 X121.629 Y116.829 E.0124
G1 X124.771 Y116.829 E.06518
G1 X125.194 Y116.406 E.0124
G1 X126.006 Y116.406 E.01684
G1 X126.429 Y116.829 E.0124
G1 X129.571 Y116.829 E.06518
G1 X129.994 Y116.406 E.0124
G1 X130.806 Y116.406 E.01684
G1 X131.229 Y116.829 E.0124
G1 X134.371 Y116.829 E.06518
G1 X134.794 Y116.406 E.0124
G1 X135.606 Y116.406 E.01684
G1 X136.028 Y116.829 E.0124
G1 X139.171 Y116.829 E.06518
G1 X139.594 Y116.406 E.0124
G1 X140.405 Y116.406 E.01684
G1 X140.828 Y116.829 E.0124
G1 X143.971 Y116.829 E.06518
G1 X144.393 Y116.406 E.0124
G1 X145.205 Y116.406 E.01684
G1 X145.628 Y116.829 E.0124
G1 X146.553 Y116.829 E.01919
G2 X145.964 Y116.414 I-.577 J.192 E.01601
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.297 Y116.501 E-.13091
G1 X146.553 Y116.829 E-.15805
G1 X145.628 Y116.829 E-.3516
G1 X145.406 Y116.607 E-.11943
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/83
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.76 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.459 Z5.76
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
M73 P71 R6
G1 F4872
M204 S6000
G1 X147.381 Y119.459 E.80401
G1 X147.381 Y120.549 E.02259
G1 X108.619 Y120.549 E.80401
G1 X108.619 Y119.519 E.02135
M204 S10000
G1 X108.21 Y119.05 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4872
M204 S5000
G1 X147.79 Y119.05 E.76293
G1 X147.79 Y120.958 E.03677
G1 X108.21 Y120.958 E.76293
G1 X108.21 Y119.11 E.03562
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.107 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.88
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.88 F4000
            G39.3 S1
            G0 Z5.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y120.004 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.690732
G1 F4872
M204 S6000
G1 X147.169 Y120.004 E1.24644
; WIPE_START
G1 F9022.827
G1 X145.169 Y120.004 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.559 Y119.413 Z5.88 F42000
G1 X109.027 Y117.196 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4872
M204 S6000
G1 X109.085 Y116.755 E.00924
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.203 Y116.079 E.00569
G1 X146.245 Y116.085 E.00088
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.973 Y117.196 E.00924
G1 X109.087 Y117.196 E.78586
M204 S10000
G1 X108.619 Y117.62 F42000
G1 F4872
M204 S6000
G3 X108.671 Y116.644 I3.734 J-.29 E.02034
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.259 Y115.659 E.00626
G1 X146.356 Y115.671 E.00204
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.62 E.01203
G1 X108.679 Y117.62 E.80277
M204 S10000
G1 X108.21 Y118.03 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4872
M204 S5000
G1 X108.21 Y117.014 E.01958
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.312 Y115.253 E.00634
G1 X146.463 Y115.273 E.00293
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.03 E.01958
G1 X108.27 Y118.03 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38671
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17737
G1 X108.473 Y116.078 E-.01323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.105 Y116.147 Z5.88 F42000
G1 X145.966 Y116.414 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4872
M204 S6000
G3 X146.555 Y116.833 I.011 J.608 E.01605
G1 X145.632 Y116.833 E.01914
G1 X145.205 Y116.406 E.01253
G1 X144.393 Y116.406 E.01684
G1 X143.966 Y116.833 E.01253
G1 X140.832 Y116.833 E.06501
G1 X140.405 Y116.406 E.01253
G1 X139.594 Y116.406 E.01684
G1 X139.167 Y116.833 E.01253
G1 X136.033 Y116.833 E.06501
G1 X135.606 Y116.406 E.01253
G1 X134.794 Y116.406 E.01684
G1 X134.367 Y116.833 E.01253
G1 X131.233 Y116.833 E.06501
G1 X130.806 Y116.406 E.01253
G1 X129.994 Y116.406 E.01684
G1 X129.567 Y116.833 E.01253
G1 X126.433 Y116.833 E.06501
G1 X126.006 Y116.406 E.01253
G1 X125.194 Y116.406 E.01684
G1 X124.767 Y116.833 E.01253
G1 X121.633 Y116.833 E.06501
G1 X121.206 Y116.406 E.01253
G1 X120.394 Y116.406 E.01684
G1 X119.967 Y116.833 E.01253
G1 X116.833 Y116.833 E.06501
G1 X116.406 Y116.406 E.01253
G1 X115.595 Y116.406 E.01684
G1 X115.168 Y116.833 E.01253
G1 X112.034 Y116.833 E.06501
G1 X111.607 Y116.406 E.01253
G1 X110.795 Y116.406 E.01684
G1 X110.368 Y116.833 E.01253
G1 X109.445 Y116.833 E.01914
G3 X110.032 Y116.414 I.578 J.188 E.01603
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12671
G1 X109.445 Y116.833 E-.16271
G1 X110.368 Y116.833 E-.35067
G1 X110.591 Y116.61 E-.11991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/83
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z5.88 I-1.001 J-.692 P1  F42000
G1 X108.619 Y119.463 Z5.88
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4791
M204 S6000
G1 X147.381 Y119.463 E.80401
G1 X147.381 Y120.512 E.02175
G1 X108.619 Y120.512 E.80401
G1 X108.619 Y119.523 E.02051
M204 S10000
G1 X108.21 Y119.054 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G1 X147.79 Y119.054 E.76293
G1 X147.79 Y120.921 E.03599
G1 X108.21 Y120.921 E.76293
G1 X108.21 Y119.114 E.03483
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.111 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.988 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.650142
G1 F4791
M204 S6000
G1 X147.169 Y119.988 E1.17036
; WIPE_START
G1 F9609.379
G1 X145.169 Y119.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.559 Y119.401 Z6 F42000
G1 X109.026 Y117.2 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4791
M204 S6000
M73 P72 R6
G1 X109.085 Y116.755 E.00932
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.212 Y116.08 E.00586
G1 X146.245 Y116.085 E.0007
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.974 Y117.2 E.00932
G1 X109.086 Y117.2 E.78589
M204 S10000
G1 X108.619 Y117.625 F42000
G1 F4791
M204 S6000
G3 X108.671 Y116.644 I3.75 J-.292 E.02043
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.267 Y115.66 E.00644
G1 X146.356 Y115.671 E.00186
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.625 E.01211
G1 X108.679 Y117.625 E.80277
M204 S10000
G1 X108.21 Y118.034 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4791
M204 S5000
G1 X108.21 Y117.014 E.01966
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.32 Y115.254 E.0065
G1 X146.463 Y115.273 E.00277
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.034 E.01966
G1 X108.27 Y118.034 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.3883
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.47 Y116.082 E-.01163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.03 Y116.414 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4791
M204 S6000
G2 X109.443 Y116.838 I-.008 J.608 E.01608
G1 X110.364 Y116.838 E.01909
G1 X110.795 Y116.406 E.01265
G1 X111.607 Y116.406 E.01684
G1 X112.038 Y116.838 E.01265
G1 X115.163 Y116.838 E.06483
G1 X115.595 Y116.406 E.01265
G1 X116.406 Y116.406 E.01684
G1 X116.838 Y116.838 E.01265
G1 X119.963 Y116.838 E.06483
G1 X120.394 Y116.406 E.01265
G1 X121.206 Y116.406 E.01684
G1 X121.637 Y116.838 E.01265
G1 X124.763 Y116.838 E.06483
G1 X125.194 Y116.406 E.01265
G1 X126.006 Y116.406 E.01684
G1 X126.437 Y116.838 E.01265
G1 X129.563 Y116.838 E.06483
G1 X129.994 Y116.406 E.01265
G1 X130.806 Y116.406 E.01684
G1 X131.237 Y116.838 E.01265
G1 X134.363 Y116.838 E.06483
G1 X134.794 Y116.406 E.01265
G1 X135.606 Y116.406 E.01684
G1 X136.037 Y116.838 E.01265
G1 X139.162 Y116.838 E.06483
G1 X139.594 Y116.406 E.01265
G1 X140.405 Y116.406 E.01684
G1 X140.837 Y116.838 E.01265
G1 X143.962 Y116.838 E.06483
G1 X144.393 Y116.406 E.01265
G1 X145.205 Y116.406 E.01684
G1 X145.636 Y116.838 E.01265
G1 X146.557 Y116.838 E.01909
G2 X145.969 Y116.414 I-.579 J.185 E.0161
; CHANGE_LAYER
; Z_HEIGHT: 5.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.295 Y116.5 E-.12833
G1 X146.557 Y116.838 E-.16226
G1 X145.636 Y116.838 E-.34974
G1 X145.414 Y116.615 E-.11968
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/83
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.468 Z6
G1 Z5.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4867
M204 S6000
G1 X147.381 Y119.468 E.80401
G1 X147.381 Y120.476 E.02091
G1 X108.619 Y120.476 E.80401
G1 X108.619 Y119.528 E.01966
M204 S10000
G1 X108.21 Y119.058 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4867
M204 S5000
G1 X147.79 Y119.058 E.76293
G1 X147.79 Y120.885 E.03521
G1 X108.21 Y120.885 E.76293
G1 X108.21 Y119.118 E.03405
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.12
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.12 F4000
            G39.3 S1
            G0 Z6.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.972 F42000
G1 Z5.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.609552
G1 F4867
M204 S6000
G1 X147.169 Y119.972 E1.09428
; WIPE_START
G1 F10277.492
G1 X145.169 Y119.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.389 Z6.12 F42000
G1 X109.026 Y117.205 Z6.12
G1 Z5.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4867
M204 S6000
G1 X109.085 Y116.755 E.00941
G3 X109.755 Y116.085 I.915 J.245 E.02058
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.22 Y116.081 E.00603
G1 X146.245 Y116.085 E.00053
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G1 X146.974 Y117.204 E.0094
G1 X109.086 Y117.205 E.78591
M204 S10000
G1 X108.619 Y117.629 F42000
G1 F4867
M204 S6000
G3 X108.671 Y116.644 I3.766 J-.294 E.02052
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.275 Y115.661 E.00661
G1 X146.356 Y115.671 E.00169
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.629 E.0122
G1 X108.679 Y117.629 E.80277
M204 S10000
G1 X108.21 Y118.038 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4867
M204 S5000
G1 X108.21 Y117.014 E.01974
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.329 Y115.255 E.00666
G1 X146.463 Y115.273 E.00261
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.038 E.01974
G1 X108.27 Y118.038 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.38989
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.467 Y116.085 E-.01004
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.1 Y116.152 Z6.12 F42000
G1 X145.971 Y116.415 Z6.12
G1 Z5.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4867
M204 S6000
G3 X146.558 Y116.841 I.007 J.608 E.01614
G1 X145.64 Y116.841 E.01905
G1 X145.205 Y116.406 E.01276
G1 X144.393 Y116.406 E.01684
G1 X143.959 Y116.841 E.01276
G1 X140.84 Y116.841 E.06468
G1 X140.405 Y116.406 E.01276
G1 X139.594 Y116.406 E.01684
G1 X139.159 Y116.841 E.01276
G1 X136.041 Y116.841 E.06468
G1 X135.606 Y116.406 E.01276
G1 X134.794 Y116.406 E.01684
G1 X134.359 Y116.841 E.01276
G1 X131.241 Y116.841 E.06467
G1 X130.806 Y116.406 E.01276
G1 X129.994 Y116.406 E.01684
G1 X129.559 Y116.841 E.01276
G1 X126.441 Y116.841 E.06467
G1 X126.006 Y116.406 E.01276
G1 X125.194 Y116.406 E.01684
G1 X124.759 Y116.842 E.01277
G1 X121.641 Y116.842 E.06467
G1 X121.206 Y116.406 E.01277
G1 X120.394 Y116.406 E.01684
G1 X119.959 Y116.842 E.01277
G1 X116.842 Y116.842 E.06467
G1 X116.406 Y116.406 E.01277
G1 X115.595 Y116.406 E.01684
G1 X115.159 Y116.842 E.01277
G1 X112.042 Y116.842 E.06466
G1 X111.607 Y116.406 E.01277
G1 X110.795 Y116.406 E.01684
G1 X110.359 Y116.842 E.01277
G1 X109.441 Y116.842 E.01904
G3 X110.028 Y116.415 I.581 J.181 E.01613
; CHANGE_LAYER
; Z_HEIGHT: 5.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12509
M73 P73 R6
G1 X109.441 Y116.842 E-.16607
G1 X110.359 Y116.842 E-.34881
G1 X110.583 Y116.618 E-.12004
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/83
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.12 I-1.003 J-.69 P1  F42000
G1 X108.619 Y119.472 Z6.12
G1 Z5.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4787
M204 S6000
G1 X147.381 Y119.472 E.80401
G1 X147.381 Y120.452 E.02032
G1 X108.619 Y120.452 E.80401
G1 X108.619 Y119.532 E.01908
M204 S10000
G1 X108.21 Y119.063 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X147.79 Y119.063 E.76293
G1 X147.79 Y120.861 E.03466
G1 X108.21 Y120.861 E.76293
G1 X108.21 Y119.123 E.03351
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.12 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.24
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.24 F4000
            G39.3 S1
            G0 Z6.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.962 F42000
G1 Z5.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.581322
G1 F4787
M204 S6000
G1 X147.169 Y119.962 E1.04136
; WIPE_START
G1 F10799.718
G1 X145.169 Y119.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.382 Z6.24 F42000
G1 X109.043 Y117.209 Z6.24
G1 Z5.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G3 X109.179 Y116.526 I1.429 J-.07 E.01458
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00655
G3 X146.915 Y116.755 I-.245 J.915 E.02059
G3 X146.957 Y117.209 I-1.704 J.384 E.00948
G1 X109.103 Y117.209 E.78517
M204 S10000
G1 X108.619 Y117.633 F42000
M73 P73 R5
G1 F4787
M204 S6000
G3 X108.671 Y116.644 I3.782 J-.296 E.0206
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.284 Y115.662 E.00678
G1 X146.356 Y115.671 E.00151
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.633 E.01229
G1 X108.679 Y117.633 E.80277
M204 S10000
G1 X108.21 Y118.042 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X108.21 Y117.014 E.01982
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.337 Y115.256 E.00682
G1 X146.463 Y115.273 E.00245
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.042 E.01982
G1 X108.27 Y118.042 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39148
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.465 Y116.088 E-.00845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.026 Y116.415 Z6.24 F42000
G1 Z5.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G2 X109.44 Y116.846 I-.004 J.609 E.01618
G1 X110.355 Y116.846 E.01899
G1 X110.795 Y116.406 E.0129
G1 X111.607 Y116.406 E.01684
G1 X112.046 Y116.846 E.0129
G1 X115.155 Y116.846 E.06449
G1 X115.595 Y116.406 E.0129
G1 X116.406 Y116.406 E.01684
G1 X116.846 Y116.846 E.0129
G1 X119.955 Y116.846 E.06449
G1 X120.394 Y116.406 E.0129
G1 X121.206 Y116.406 E.01684
G1 X121.646 Y116.846 E.0129
G1 X124.755 Y116.846 E.06449
G1 X125.194 Y116.406 E.0129
G1 X126.006 Y116.406 E.01684
G1 X126.446 Y116.846 E.0129
G1 X129.554 Y116.846 E.06449
G1 X129.994 Y116.406 E.0129
G1 X130.806 Y116.406 E.01684
G1 X131.245 Y116.846 E.0129
G1 X134.354 Y116.846 E.06449
G1 X134.794 Y116.406 E.0129
G1 X135.606 Y116.406 E.01684
G1 X136.045 Y116.846 E.0129
G1 X139.154 Y116.846 E.06449
G1 X139.594 Y116.406 E.0129
G1 X140.405 Y116.406 E.01684
G1 X140.845 Y116.846 E.0129
G1 X143.954 Y116.846 E.06449
G1 X144.393 Y116.406 E.0129
G1 X145.205 Y116.406 E.01684
G1 X145.645 Y116.846 E.0129
G1 X146.56 Y116.846 E.01899
G2 X145.974 Y116.415 I-.582 J.178 E.01618
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.12436
G1 X146.56 Y116.846 E-.16769
G1 X145.645 Y116.846 E-.34786
G1 X145.421 Y116.622 E-.12009
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/83
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.24 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.476 Z6.24
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4865
M204 S6000
G1 X147.381 Y119.476 E.80401
G1 X147.381 Y120.44 E.01999
G1 X108.619 Y120.44 E.80401
G1 X108.619 Y119.536 E.01875
M204 S10000
G1 X108.21 Y119.067 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X147.79 Y119.067 E.76293
G1 X147.79 Y120.849 E.03435
G1 X108.21 Y120.849 E.76293
G1 X108.21 Y119.127 E.0332
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.124 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.36
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P74 R5
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.36 F4000
            G39.3 S1
            G0 Z6.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.958 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565302
G1 F4865
M204 S6000
G1 X147.169 Y119.958 E1.01133
; WIPE_START
G1 F11120.378
G1 X145.169 Y119.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.38 Z6.36 F42000
G1 X109.043 Y117.213 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G3 X109.179 Y116.526 I1.437 J-.072 E.01467
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.213 I-1.719 J.386 E.00957
G1 X109.103 Y117.213 E.78517
M204 S10000
G1 X108.619 Y117.637 F42000
G1 F4865
M204 S6000
G3 X108.671 Y116.644 I3.798 J-.298 E.02069
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.292 Y115.663 E.00696
G1 X146.356 Y115.671 E.00134
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.637 E.01237
G1 X108.679 Y117.637 E.80277
M204 S10000
G1 X108.21 Y118.046 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X108.21 Y117.014 E.01991
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.345 Y115.257 E.00698
G1 X146.463 Y115.273 E.00229
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.046 E.01991
G1 X108.27 Y118.046 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39307
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17737
G1 X108.462 Y116.092 E-.00687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.095 Y116.157 Z6.36 F42000
G1 X145.976 Y116.415 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G3 X146.562 Y116.85 I-.05 J.68 E.01597
G1 X145.649 Y116.85 E.01893
G1 X145.205 Y116.406 E.01302
G1 X144.393 Y116.406 E.01684
G1 X143.95 Y116.85 E.01302
G1 X140.849 Y116.85 E.06431
G1 X140.405 Y116.406 E.01302
G1 X139.594 Y116.406 E.01684
G1 X139.15 Y116.85 E.01302
G1 X136.049 Y116.85 E.06431
G1 X135.606 Y116.406 E.01302
G1 X134.794 Y116.406 E.01684
G1 X134.35 Y116.85 E.01302
G1 X131.25 Y116.85 E.06431
G1 X130.806 Y116.406 E.01302
G1 X129.994 Y116.406 E.01684
G1 X129.55 Y116.85 E.01302
G1 X126.45 Y116.85 E.06431
G1 X126.006 Y116.406 E.01302
G1 X125.194 Y116.406 E.01684
G1 X124.75 Y116.85 E.01302
G1 X121.65 Y116.85 E.06431
G1 X121.206 Y116.406 E.01302
G1 X120.394 Y116.406 E.01684
G1 X119.951 Y116.85 E.01302
G1 X116.85 Y116.85 E.06431
G1 X116.406 Y116.406 E.01302
G1 X115.595 Y116.406 E.01684
G1 X115.151 Y116.85 E.01302
G1 X112.05 Y116.85 E.06431
G1 X111.607 Y116.406 E.01302
G1 X110.795 Y116.406 E.01684
G1 X110.351 Y116.85 E.01302
G1 X109.438 Y116.849 E.01893
G3 X110.024 Y116.415 I.583 J.175 E.01622
; CHANGE_LAYER
; Z_HEIGHT: 6.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12366
G1 X109.438 Y116.849 E-.16908
G1 X110.351 Y116.85 E-.34683
G1 X110.575 Y116.626 E-.12043
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/83
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.36 I-1.004 J-.688 P1  F42000
G1 X108.619 Y119.48 Z6.36
G1 Z6.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4785
M204 S6000
G1 X147.381 Y119.48 E.80401
G1 X147.381 Y120.428 E.01966
G1 X108.619 Y120.428 E.80401
G1 X108.619 Y119.54 E.01841
M204 S10000
G1 X108.21 Y119.071 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X147.79 Y119.071 E.76293
G1 X147.79 Y120.837 E.03405
G1 X108.21 Y120.837 E.76293
G1 X108.21 Y119.131 E.03289
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.48
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.48 F4000
            G39.3 S1
            G0 Z6.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.954 F42000
G1 Z6.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.549302
G1 F4785
M204 S6000
G1 X147.169 Y119.954 E.98134
; WIPE_START
G1 F11460.223
G1 X145.169 Y119.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.378 Z6.48 F42000
G1 X109.043 Y117.217 Z6.48
G1 Z6.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4785
M204 S6000
G3 X109.179 Y116.526 I1.446 J-.074 E.01476
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.217 I-1.735 J.388 E.00966
G1 X109.103 Y117.217 E.78517
M204 S10000
G1 X108.619 Y117.641 F42000
G1 F4785
M204 S6000
G3 X108.671 Y116.644 I3.814 J-.3 E.02078
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.3 Y115.664 E.00713
G1 X146.356 Y115.671 E.00117
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.641 E.01246
G1 X108.679 Y117.641 E.80277
M204 S10000
G1 X108.21 Y118.051 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X108.21 Y117.014 E.01999
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.354 Y115.258 E.00714
G1 X146.463 Y115.273 E.00212
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.051 E.01999
G1 X108.27 Y118.051 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39466
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.46 Y116.095 E-.00527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.024 Y116.415 Z6.48 F42000
G1 Z6.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4785
M204 S6000
G2 X109.438 Y116.854 I.049 J.676 E.01604
G1 X110.347 Y116.854 E.01886
G1 X110.795 Y116.406 E.01314
G1 X111.607 Y116.406 E.01684
G1 X112.054 Y116.854 E.01314
M73 P75 R5
G1 X115.147 Y116.854 E.06414
G1 X115.595 Y116.406 E.01314
G1 X116.406 Y116.406 E.01684
G1 X116.854 Y116.854 E.01314
G1 X119.946 Y116.854 E.06414
G1 X120.394 Y116.406 E.01314
G1 X121.206 Y116.406 E.01684
G1 X121.654 Y116.854 E.01314
G1 X124.746 Y116.854 E.06414
G1 X125.194 Y116.406 E.01314
G1 X126.006 Y116.406 E.01684
G1 X126.454 Y116.854 E.01314
G1 X129.546 Y116.854 E.06414
G1 X129.994 Y116.406 E.01314
G1 X130.806 Y116.406 E.01684
G1 X131.254 Y116.854 E.01314
G1 X134.346 Y116.854 E.06414
G1 X134.794 Y116.406 E.01314
G1 X135.606 Y116.406 E.01684
G1 X136.054 Y116.854 E.01314
G1 X139.146 Y116.854 E.06414
G1 X139.594 Y116.406 E.01314
G1 X140.405 Y116.406 E.01684
G1 X140.853 Y116.854 E.01314
G1 X143.946 Y116.854 E.06414
G1 X144.393 Y116.406 E.01314
G1 X145.205 Y116.406 E.01684
G1 X145.653 Y116.854 E.01314
G1 X146.562 Y116.854 E.01886
G2 X145.976 Y116.415 I-.635 J.237 E.01605
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.12341
G1 X146.504 Y116.709 E-.11443
G1 X146.562 Y116.854 E-.05944
G1 X145.653 Y116.854 E-.34548
G1 X145.435 Y116.636 E-.11725
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/83
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.48 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.484 Z6.48
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4864
M204 S6000
G1 X147.381 Y119.484 E.80401
G1 X147.381 Y120.416 E.01933
G1 X108.619 Y120.416 E.80401
G1 X108.619 Y119.544 E.01808
M204 S10000
G1 X108.21 Y119.075 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X147.79 Y119.075 E.76293
G1 X147.79 Y120.825 E.03374
G1 X108.21 Y120.825 E.76293
G1 X108.21 Y119.135 E.03258
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.95 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533292
G1 F4864
M204 S6000
G1 X147.169 Y119.95 E.95133
; WIPE_START
G1 F11821.728
G1 X145.169 Y119.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.375 Z6.6 F42000
G1 X109.043 Y117.221 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X109.179 Y116.526 I1.454 J-.076 E.01484
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.221 I-1.751 J.39 E.00974
G1 X109.103 Y117.221 E.78517
M204 S10000
G1 X108.619 Y117.646 F42000
G1 F4864
M204 S6000
G3 X108.671 Y116.644 I3.83 J-.302 E.02086
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.308 Y115.665 E.0073
G1 X146.356 Y115.671 E.00099
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.646 E.01255
G1 X108.679 Y117.646 E.80277
M204 S10000
G1 X108.21 Y118.055 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X108.21 Y117.014 E.02007
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.362 Y115.259 E.0073
G1 X146.463 Y115.273 E.00196
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.055 E.02007
G1 X108.27 Y118.055 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39625
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17737
G1 X108.457 Y116.098 E-.00369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.089 Y116.163 Z6.6 F42000
G1 X145.977 Y116.415 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X146.563 Y116.858 I-.048 J.672 E.01612
G1 X145.657 Y116.858 E.01878
G1 X145.205 Y116.406 E.01326
G1 X144.393 Y116.406 E.01684
G1 X143.941 Y116.858 E.01326
G1 X140.858 Y116.858 E.06396
G1 X140.405 Y116.406 E.01326
G1 X139.594 Y116.406 E.01684
G1 X139.142 Y116.858 E.01326
G1 X136.058 Y116.858 E.06396
G1 X135.606 Y116.406 E.01326
G1 X134.794 Y116.406 E.01684
G1 X134.342 Y116.858 E.01326
G1 X131.258 Y116.858 E.06396
G1 X130.806 Y116.406 E.01326
G1 X129.994 Y116.406 E.01684
G1 X129.542 Y116.858 E.01326
G1 X126.458 Y116.858 E.06396
G1 X126.006 Y116.406 E.01326
G1 X125.194 Y116.406 E.01684
G1 X124.742 Y116.858 E.01326
G1 X121.658 Y116.858 E.06396
G1 X121.206 Y116.406 E.01326
G1 X120.394 Y116.406 E.01684
G1 X119.942 Y116.858 E.01326
G1 X116.858 Y116.858 E.06396
G1 X116.406 Y116.406 E.01326
G1 X115.595 Y116.406 E.01684
G1 X115.142 Y116.859 E.01326
G1 X112.059 Y116.858 E.06396
G1 X111.607 Y116.406 E.01326
G1 X110.795 Y116.406 E.01684
G1 X110.343 Y116.858 E.01326
G1 X109.437 Y116.858 E.01878
G3 X110.023 Y116.415 I.634 J.229 E.01612
; CHANGE_LAYER
; Z_HEIGHT: 6.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.709 Y116.496 E-.12322
G1 X109.496 Y116.709 E-.1144
G1 X109.437 Y116.858 E-.06099
G1 X110.343 Y116.858 E-.34409
G1 X110.561 Y116.64 E-.1173
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/83
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.6 I-1.006 J-.685 P1  F42000
G1 X108.619 Y119.489 Z6.6
G1 Z6.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4784
M204 S6000
G1 X147.381 Y119.489 E.80401
G1 X147.381 Y120.404 E.019
G1 X108.619 Y120.404 E.80401
G1 X108.619 Y119.549 E.01775
M204 S10000
G1 X108.21 Y119.079 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4784
M204 S5000
G1 X147.79 Y119.079 E.76293
G1 X147.79 Y120.814 E.03343
G1 X108.21 Y120.814 E.76293
G1 X108.21 Y119.139 E.03227
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P76 R5
G3 Z6.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.72
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.72 F4000
            G39.3 S1
            G0 Z6.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.947 F42000
G1 Z6.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.517282
G1 F4784
M204 S6000
G1 X147.169 Y119.947 E.92133
; WIPE_START
G1 F12206.783
G1 X145.169 Y119.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.373 Z6.72 F42000
G1 X109.043 Y117.226 Z6.72
G1 Z6.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4784
M204 S6000
G3 X109.179 Y116.526 I1.463 J-.079 E.01493
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.226 I-1.767 J.392 E.00983
G1 X109.103 Y117.226 E.78517
M204 S10000
G1 X108.619 Y117.65 F42000
G1 F4784
M204 S6000
G1 X108.619 Y117.041 E.01264
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.317 Y115.666 E.00748
G1 X146.356 Y115.671 E.00082
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.65 E.01264
G1 X108.679 Y117.65 E.80277
M204 S10000
G1 X108.21 Y118.059 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4784
M204 S5000
G1 X108.21 Y117.014 E.02015
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.37 Y115.261 E.00746
G1 X146.463 Y115.273 E.0018
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.059 E.02015
G1 X108.27 Y118.059 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39784
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.455 Y116.102 E-.00209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.023 Y116.416 Z6.72 F42000
G1 Z6.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4784
M204 S6000
G2 X109.437 Y116.863 I.047 J.669 E.01619
G1 X110.338 Y116.863 E.01871
G1 X110.795 Y116.406 E.01339
G1 X111.607 Y116.406 E.01684
G1 X112.063 Y116.863 E.01339
G1 X115.138 Y116.863 E.06379
G1 X115.595 Y116.406 E.01339
G1 X116.406 Y116.406 E.01684
G1 X116.863 Y116.863 E.01339
G1 X119.938 Y116.863 E.06379
G1 X120.394 Y116.406 E.01339
G1 X121.206 Y116.406 E.01684
G1 X121.662 Y116.863 E.01339
G1 X124.738 Y116.863 E.06379
G1 X125.194 Y116.406 E.01339
G1 X126.006 Y116.406 E.01684
G1 X126.462 Y116.863 E.01339
G1 X129.538 Y116.863 E.06379
G1 X129.994 Y116.406 E.01339
G1 X130.806 Y116.406 E.01684
G1 X131.262 Y116.863 E.01339
G1 X134.337 Y116.863 E.06379
G1 X134.794 Y116.406 E.01339
G1 X135.606 Y116.406 E.01684
G1 X136.062 Y116.863 E.01339
G1 X139.137 Y116.863 E.06379
G1 X139.594 Y116.406 E.01339
G1 X140.405 Y116.406 E.01684
G1 X140.862 Y116.863 E.01339
G1 X143.937 Y116.863 E.06379
G1 X144.393 Y116.406 E.01339
G1 X145.205 Y116.406 E.01684
G1 X145.662 Y116.863 E.01339
G1 X146.563 Y116.863 E.01871
G2 X145.977 Y116.416 I-.633 J.222 E.01619
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.291 Y116.496 E-.12295
G1 X146.504 Y116.709 E-.11441
G1 X146.563 Y116.863 E-.06258
G1 X145.662 Y116.863 E-.34272
G1 X145.443 Y116.644 E-.11734
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/83
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.72 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.493 Z6.72
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4863
M204 S6000
G1 X147.381 Y119.493 E.80401
G1 X147.381 Y120.393 E.01866
G1 X108.619 Y120.393 E.80401
G1 X108.619 Y119.553 E.01742
M204 S10000
G1 X108.21 Y119.084 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4863
M204 S5000
G1 X147.79 Y119.084 E.76293
G1 X147.79 Y120.802 E.03312
G1 X108.21 Y120.802 E.76293
G1 X108.21 Y119.144 E.03196
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.84
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.84 F4000
            G39.3 S1
            G0 Z6.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.943 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.501272
G1 F4863
M204 S6000
G1 X147.169 Y119.943 E.89132
; WIPE_START
G1 F12617.767
G1 X145.169 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.558 Y119.371 Z6.84 F42000
G1 X109.043 Y117.23 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4863
M204 S6000
G3 X109.179 Y116.526 I1.471 J-.081 E.01501
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.23 I-1.783 J.394 E.00992
G1 X109.103 Y117.23 E.78517
M204 S10000
G1 X108.619 Y117.654 F42000
G1 F4863
M204 S6000
G1 X108.619 Y117.041 E.01272
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.325 Y115.667 E.00765
G1 X146.356 Y115.671 E.00065
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.654 E.01272
G1 X108.679 Y117.654 E.80277
M204 S10000
M73 P77 R5
G1 X108.21 Y118.063 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4863
M204 S5000
G1 X108.21 Y117.014 E.02023
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.378 Y115.262 E.00763
G1 X146.463 Y115.273 E.00164
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.063 E.02023
G1 X108.27 Y118.063 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.39943
G1 X108.273 Y116.537 E-.18269
G1 X108.451 Y116.106 E-.17739
G1 X108.452 Y116.105 E-.0005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.084 Y116.168 Z6.84 F42000
G1 X145.978 Y116.416 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4863
M204 S6000
G3 X146.564 Y116.867 I-.046 J.666 E.01626
G1 X145.666 Y116.867 E.01863
G1 X145.205 Y116.406 E.01351
G1 X144.393 Y116.406 E.01684
G1 X143.933 Y116.867 E.01351
G1 X140.866 Y116.867 E.06362
G1 X140.405 Y116.406 E.01351
G1 X139.594 Y116.406 E.01684
G1 X139.133 Y116.867 E.01351
G1 X136.066 Y116.867 E.06362
G1 X135.606 Y116.406 E.01351
G1 X134.794 Y116.406 E.01684
G1 X134.333 Y116.867 E.01351
G1 X131.266 Y116.867 E.06362
G1 X130.806 Y116.406 E.01351
G1 X129.994 Y116.406 E.01684
G1 X129.533 Y116.867 E.01351
G1 X126.467 Y116.867 E.06362
G1 X126.006 Y116.406 E.01351
G1 X125.194 Y116.406 E.01684
G1 X124.734 Y116.867 E.01351
G1 X121.667 Y116.867 E.06362
G1 X121.206 Y116.406 E.01351
G1 X120.394 Y116.406 E.01684
G1 X119.934 Y116.867 E.01351
G1 X116.867 Y116.867 E.06362
G1 X116.406 Y116.406 E.01351
G1 X115.595 Y116.406 E.01684
G1 X115.134 Y116.867 E.01351
G1 X112.067 Y116.867 E.06362
G1 X111.607 Y116.406 E.01351
G1 X110.795 Y116.406 E.01684
G1 X110.334 Y116.867 E.01351
G1 X109.436 Y116.867 E.01863
G3 X110.022 Y116.416 I.632 J.214 E.01626
; CHANGE_LAYER
; Z_HEIGHT: 6.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.849 Y116.438 E-.06611
G1 X109.589 Y116.589 E-.11437
G1 X109.436 Y116.867 E-.12059
G1 X110.334 Y116.867 E-.34133
G1 X110.553 Y116.648 E-.1176
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/83
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.84 I-1.007 J-.683 P1  F42000
G1 X108.619 Y119.497 Z6.84
G1 Z6.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4783
M204 S6000
G1 X147.381 Y119.497 E.80401
G1 X147.381 Y120.381 E.01833
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.557 E.01709
M204 S10000
G1 X108.21 Y119.088 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4783
M204 S5000
G1 X147.79 Y119.088 E.76293
G1 X147.79 Y120.79 E.03281
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.148 E.03166
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.145 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.96
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.96 F4000
            G39.3 S1
            G0 Z6.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.939 F42000
G1 Z6.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.485262
G1 F4783
M204 S6000
G1 X147.169 Y119.939 E.86131
; WIPE_START
G1 F13057.387
G1 X145.169 Y119.939 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.369 Z6.96 F42000
G1 X109.043 Y117.234 Z6.96
G1 Z6.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4783
M204 S6000
G3 X109.179 Y116.526 I1.479 J-.083 E.0151
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.234 I-1.799 J.396 E.01
G1 X109.103 Y117.234 E.78517
M204 S10000
G1 X108.619 Y117.658 F42000
G1 F4783
M204 S6000
G1 X108.619 Y117.041 E.01281
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.333 Y115.668 E.00782
G1 X146.356 Y115.671 E.00048
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.658 E.01281
G1 X108.679 Y117.658 E.80277
M204 S10000
G1 X108.21 Y118.067 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4783
M204 S5000
G1 X108.21 Y117.014 E.02031
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.387 Y115.263 E.00779
G1 X146.463 Y115.273 E.00148
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.067 E.02031
G1 X108.27 Y118.067 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.40102
G1 X108.273 Y116.537 E-.18269
G1 X108.45 Y116.109 E-.1763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.021 Y116.416 Z6.96 F42000
G1 Z6.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4783
M204 S6000
G2 X109.435 Y116.871 I.045 J.663 E.01633
G1 X110.33 Y116.871 E.01856
G1 X110.795 Y116.406 E.01363
G1 X111.607 Y116.406 E.01684
G1 X112.071 Y116.871 E.01363
G1 X115.13 Y116.871 E.06344
G1 X115.595 Y116.406 E.01363
G1 X116.406 Y116.406 E.01684
G1 X116.871 Y116.871 E.01363
G1 X119.93 Y116.871 E.06344
G1 X120.394 Y116.406 E.01363
G1 X121.206 Y116.406 E.01684
G1 X121.671 Y116.871 E.01363
G1 X124.729 Y116.871 E.06344
G1 X125.194 Y116.406 E.01363
G1 X126.006 Y116.406 E.01684
G1 X126.471 Y116.871 E.01363
G1 X129.529 Y116.871 E.06344
G1 X129.994 Y116.406 E.01363
G1 X130.806 Y116.406 E.01684
G1 X131.271 Y116.871 E.01363
G1 X134.329 Y116.871 E.06344
G1 X134.794 Y116.406 E.01363
G1 X135.606 Y116.406 E.01684
G1 X136.07 Y116.871 E.01363
G1 X139.129 Y116.871 E.06344
G1 X139.594 Y116.406 E.01363
G1 X140.405 Y116.406 E.01684
G1 X140.87 Y116.871 E.01363
G1 X143.929 Y116.871 E.06344
G1 X144.393 Y116.406 E.01363
G1 X145.205 Y116.406 E.01684
G1 X145.67 Y116.871 E.01363
G1 X146.565 Y116.871 E.01856
G2 X145.979 Y116.416 I-.631 J.207 E.01633
; CHANGE_LAYER
; Z_HEIGHT: 6.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.151 Y116.438 E-.06591
G1 X146.411 Y116.589 E-.11434
G1 X146.565 Y116.871 E-.1221
G1 X145.67 Y116.871 E-.33995
G1 X145.451 Y116.652 E-.1177
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/83
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z6.96 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.501 Z6.96
G1 Z6.68
G1 E.8 F1800
; FEATURE: Inner wall
M73 P77 R4
G1 F4862
M204 S6000
G1 X147.381 Y119.501 E.80401
G1 X147.381 Y120.381 E.01824
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.561 E.017
M204 S10000
G1 X108.21 Y119.092 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4862
M204 S5000
G1 X147.79 Y119.092 E.76293
G1 X147.79 Y120.79 E.03273
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.152 E.03157
; WIPE_START
M73 P78 R4
G1 F12000
M204 S6000
G1 X110.21 Y119.149 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.08
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.08 F4000
            G39.3 S1
            G0 Z7.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.941 F42000
G1 Z6.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.481072
G1 F4862
M204 S6000
G1 X147.169 Y119.941 E.85345
; WIPE_START
G1 F13177.546
G1 X145.169 Y119.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.372 Z7.08 F42000
G1 X109.043 Y117.238 Z7.08
G1 Z6.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4862
M204 S6000
G3 X109.179 Y116.526 I1.487 J-.085 E.01519
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.238 I-1.815 J.399 E.01009
G1 X109.103 Y117.238 E.78517
M204 S10000
G1 X108.619 Y117.662 F42000
G1 F4862
M204 S6000
G1 X108.619 Y117.041 E.0129
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.662 E.0129
G1 X108.679 Y117.662 E.80277
M204 S10000
G1 X108.21 Y118.072 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4862
M204 S5000
G1 X108.21 Y117.014 E.02039
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.395 Y115.264 E.00795
G1 X146.463 Y115.273 E.00132
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.072 E.02039
G1 X108.27 Y118.072 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.40261
G1 X108.273 Y116.537 E-.18269
G1 X108.449 Y116.112 E-.17471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.081 Y116.174 Z7.08 F42000
G1 X145.979 Y116.416 Z7.08
G1 Z6.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4862
M204 S6000
G3 X146.565 Y116.875 I-.045 J.66 E.0164
G1 X145.674 Y116.875 E.01848
G1 X145.205 Y116.406 E.01376
G1 X144.393 Y116.406 E.01684
G1 X143.925 Y116.875 E.01376
G1 X140.874 Y116.875 E.06327
G1 X140.405 Y116.406 E.01376
G1 X139.594 Y116.406 E.01684
G1 X139.125 Y116.875 E.01376
G1 X136.075 Y116.875 E.06327
G1 X135.606 Y116.406 E.01376
G1 X134.794 Y116.406 E.01684
G1 X134.325 Y116.875 E.01376
G1 X131.275 Y116.875 E.06327
G1 X130.806 Y116.406 E.01376
G1 X129.994 Y116.406 E.01684
G1 X129.525 Y116.875 E.01376
G1 X126.475 Y116.875 E.06327
G1 X126.006 Y116.406 E.01376
G1 X125.194 Y116.406 E.01684
G1 X124.725 Y116.875 E.01376
G1 X121.675 Y116.875 E.06327
G1 X121.206 Y116.406 E.01376
G1 X120.394 Y116.406 E.01684
G1 X119.925 Y116.875 E.01376
G1 X116.875 Y116.875 E.06327
G1 X116.406 Y116.406 E.01376
G1 X115.595 Y116.406 E.01684
G1 X115.126 Y116.875 E.01376
G1 X112.075 Y116.875 E.06327
G1 X111.607 Y116.406 E.01376
G1 X110.795 Y116.406 E.01684
G1 X110.326 Y116.875 E.01376
G1 X109.435 Y116.875 E.01848
G3 X110.021 Y116.416 I.63 J.201 E.0164
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.849 Y116.438 E-.06569
G1 X109.589 Y116.589 E-.11437
G1 X109.435 Y116.875 E-.12356
G1 X110.326 Y116.875 E-.33857
G1 X110.545 Y116.656 E-.11781
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/83
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.08 I-1.008 J-.681 P1  F42000
G1 X108.619 Y119.505 Z7.08
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4784
M204 S6000
G1 X147.381 Y119.505 E.80401
G1 X147.381 Y120.381 E.01816
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.565 E.01691
M204 S10000
G1 X108.21 Y119.096 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4784
M204 S5000
G1 X147.79 Y119.096 E.76293
G1 X147.79 Y120.79 E.03265
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.156 E.03149
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.943 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.476882
G1 F4784
M204 S6000
G1 X147.169 Y119.943 E.8456
; WIPE_START
G1 F13299.936
G1 X145.169 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.374 Z7.2 F42000
G1 X109.043 Y117.242 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4784
M204 S6000
G3 X109.179 Y116.526 I1.496 J-.087 E.01527
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.242 I-1.831 J.401 E.01018
G1 X109.103 Y117.242 E.78517
M204 S10000
G1 X108.619 Y117.667 F42000
G1 F4784
M204 S6000
G1 X108.619 Y117.041 E.01298
M73 P79 R4
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.667 E.01298
G1 X108.679 Y117.667 E.80277
M204 S10000
G1 X108.21 Y118.076 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4784
M204 S5000
G1 X108.21 Y117.014 E.02047
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.403 Y115.265 E.00811
G1 X146.463 Y115.273 E.00116
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.076 E.02047
G1 X108.27 Y118.076 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.4042
G1 X108.273 Y116.537 E-.18269
G1 X108.447 Y116.116 E-.17312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.02 Y116.416 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4784
M204 S6000
G2 X109.434 Y116.879 I.044 J.658 E.01648
G1 X110.322 Y116.879 E.01841
G1 X110.795 Y116.406 E.01388
G1 X111.607 Y116.406 E.01684
G1 X112.08 Y116.879 E.01388
G1 X115.121 Y116.879 E.0631
G1 X115.595 Y116.406 E.01388
G1 X116.406 Y116.406 E.01684
G1 X116.879 Y116.879 E.01388
G1 X119.921 Y116.879 E.0631
G1 X120.394 Y116.406 E.01388
G1 X121.206 Y116.406 E.01684
G1 X121.679 Y116.879 E.01388
G1 X124.721 Y116.879 E.0631
G1 X125.194 Y116.406 E.01388
G1 X126.006 Y116.406 E.01684
G1 X126.479 Y116.879 E.01388
G1 X129.521 Y116.879 E.0631
G1 X129.994 Y116.406 E.01388
G1 X130.806 Y116.406 E.01684
G1 X131.279 Y116.879 E.01388
G1 X134.321 Y116.879 E.0631
G1 X134.794 Y116.406 E.01388
G1 X135.606 Y116.406 E.01684
G1 X136.079 Y116.879 E.01388
G1 X139.121 Y116.879 E.0631
G1 X139.594 Y116.406 E.01388
G1 X140.405 Y116.406 E.01684
G1 X140.879 Y116.879 E.01388
G1 X143.92 Y116.879 E.0631
G1 X144.393 Y116.406 E.01388
G1 X145.205 Y116.406 E.01684
G1 X145.678 Y116.879 E.01388
G1 X146.566 Y116.879 E.01841
G2 X145.98 Y116.416 I-.63 J.194 E.01648
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.15 Y116.438 E-.06542
G1 X146.411 Y116.589 E-.11439
G1 X146.566 Y116.879 E-.12509
G1 X145.678 Y116.879 E-.33719
G1 X145.459 Y116.66 E-.11792
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/83
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.2 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.51 Z7.2
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4863
M204 S6000
G1 X147.381 Y119.51 E.80401
G1 X147.381 Y120.381 E.01807
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.57 E.01683
M204 S10000
G1 X108.21 Y119.1 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4863
M204 S5000
G1 X147.79 Y119.1 E.76293
G1 X147.79 Y120.79 E.03257
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.16 E.03141
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.32
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.32 F4000
            G39.3 S1
            G0 Z7.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.945 F42000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.472692
G1 F4863
M204 S6000
G1 X147.169 Y119.945 E.83775
; WIPE_START
G1 F13424.622
G1 X145.169 Y119.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.377 Z7.32 F42000
G1 X109.043 Y117.246 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4863
M204 S6000
G3 X109.179 Y116.526 I1.504 J-.089 E.01536
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.246 I-1.847 J.403 E.01027
G1 X109.103 Y117.246 E.78517
M204 S10000
G1 X108.619 Y117.671 F42000
G1 F4863
M204 S6000
G1 X108.619 Y117.041 E.01307
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.671 E.01307
G1 X108.679 Y117.671 E.80277
M204 S10000
G1 X108.21 Y118.08 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4863
M204 S5000
G1 X108.21 Y117.014 E.02055
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.412 Y115.266 E.00827
G1 X146.463 Y115.273 E.001
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.08 E.02055
G1 X108.27 Y118.08 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.40579
G1 X108.273 Y116.537 E-.18269
G1 X108.445 Y116.12 E-.17153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.078 Y116.18 Z7.32 F42000
G1 X145.98 Y116.416 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4863
M204 S6000
G3 X146.566 Y116.884 I-.043 J.655 E.01655
G1 X145.683 Y116.884 E.01833
G1 X145.205 Y116.406 E.014
G1 X144.393 Y116.406 E.01684
G1 X143.916 Y116.884 E.014
G1 X140.883 Y116.884 E.06292
G1 X140.405 Y116.406 E.014
G1 X139.594 Y116.406 E.01684
G1 X139.116 Y116.884 E.014
G1 X136.083 Y116.884 E.06292
G1 X135.606 Y116.406 E.014
G1 X134.794 Y116.406 E.01684
G1 X134.317 Y116.884 E.014
G1 X131.283 Y116.884 E.06292
G1 X130.806 Y116.406 E.014
G1 X129.994 Y116.406 E.01684
G1 X129.517 Y116.884 E.014
G1 X126.483 Y116.884 E.06292
G1 X126.006 Y116.406 E.014
G1 X125.194 Y116.406 E.01684
G1 X124.717 Y116.884 E.014
G1 X121.683 Y116.884 E.06292
G1 X121.206 Y116.406 E.014
G1 X120.394 Y116.406 E.01684
G1 X119.917 Y116.884 E.014
G1 X116.884 Y116.884 E.06292
G1 X116.406 Y116.406 E.014
G1 X115.595 Y116.406 E.01684
G1 X115.117 Y116.884 E.014
G1 X112.084 Y116.884 E.06292
G1 X111.607 Y116.406 E.014
G1 X110.795 Y116.406 E.01684
G1 X110.317 Y116.884 E.014
G1 X109.434 Y116.884 E.01833
G3 X110.02 Y116.416 I.629 J.187 E.01655
; CHANGE_LAYER
; Z_HEIGHT: 7.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.849 Y116.438 E-.06524
G1 X109.589 Y116.589 E-.11439
G1 X109.434 Y116.884 E-.12656
G1 X110.317 Y116.884 E-.3358
G1 X110.537 Y116.664 E-.11802
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/83
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.32 I-1.01 J-.679 P1  F42000
G1 X108.619 Y119.514 Z7.32
G1 Z7.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4785
M204 S6000
M73 P80 R4
G1 X147.381 Y119.514 E.80401
G1 X147.381 Y120.381 E.01798
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.574 E.01674
M204 S10000
G1 X108.21 Y119.105 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X147.79 Y119.105 E.76293
G1 X147.79 Y120.79 E.03249
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.165 E.03133
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.44
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.44 F4000
            G39.3 S1
            G0 Z7.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.947 F42000
G1 Z7.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.468502
G1 F4785
M204 S6000
G1 X147.169 Y119.947 E.82989
; WIPE_START
G1 F13551.666
G1 X145.169 Y119.947 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.379 Z7.44 F42000
G1 X109.043 Y117.251 Z7.44
G1 Z7.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4785
M204 S6000
G3 X109.179 Y116.526 I1.513 J-.091 E.01544
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.251 I-1.863 J.405 E.01035
G1 X109.103 Y117.251 E.78517
M204 S10000
G1 X108.619 Y117.675 F42000
G1 F4785
M204 S6000
G1 X108.619 Y117.041 E.01316
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.675 E.01316
G1 X108.679 Y117.675 E.80277
M204 S10000
G1 X108.21 Y118.084 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X108.21 Y117.014 E.02063
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.42 Y115.267 E.00843
G1 X146.894 Y115.451 E.00981
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.084 E.02063
G1 X108.27 Y118.084 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.40738
G1 X108.273 Y116.537 E-.18269
G1 X108.444 Y116.124 E-.16994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.019 Y116.416 Z7.44 F42000
G1 Z7.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4785
M204 S6000
G2 X109.433 Y116.888 I.043 J.653 E.01662
G1 X110.313 Y116.888 E.01825
G1 X110.795 Y116.406 E.01412
G1 X111.607 Y116.406 E.01684
G1 X112.088 Y116.888 E.01412
G1 X115.113 Y116.888 E.06275
G1 X115.595 Y116.406 E.01412
G1 X116.406 Y116.406 E.01684
G1 X116.888 Y116.888 E.01412
G1 X119.913 Y116.888 E.06275
G1 X120.394 Y116.406 E.01412
G1 X121.206 Y116.406 E.01684
G1 X121.688 Y116.888 E.01412
G1 X124.713 Y116.888 E.06275
G1 X125.194 Y116.406 E.01412
G1 X126.006 Y116.406 E.01684
G1 X126.487 Y116.888 E.01412
G1 X129.513 Y116.888 E.06275
G1 X129.994 Y116.406 E.01412
G1 X130.806 Y116.406 E.01684
G1 X131.287 Y116.888 E.01412
G1 X134.312 Y116.888 E.06275
G1 X134.794 Y116.406 E.01412
G1 X135.606 Y116.406 E.01684
G1 X136.087 Y116.888 E.01412
G1 X139.112 Y116.888 E.06275
G1 X139.594 Y116.406 E.01412
G1 X140.405 Y116.406 E.01684
G1 X140.887 Y116.888 E.01412
G1 X143.912 Y116.888 E.06275
G1 X144.393 Y116.406 E.01412
G1 X145.205 Y116.406 E.01684
G1 X145.687 Y116.888 E.01412
G1 X146.567 Y116.888 E.01825
G2 X145.981 Y116.416 I-.629 J.181 E.01662
; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.15 Y116.438 E-.06498
G1 X146.411 Y116.589 E-.11439
G1 X146.567 Y116.888 E-.12809
G1 X145.687 Y116.888 E-.33442
G1 X145.467 Y116.668 E-.11811
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/83
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.44 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.518 Z7.44
G1 Z7.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4864
M204 S6000
G1 X147.381 Y119.518 E.80401
G1 X147.381 Y120.381 E.0179
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.578 E.01665
M204 S10000
G1 X108.21 Y119.109 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X147.79 Y119.109 E.76293
G1 X147.79 Y120.79 E.03241
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.169 E.03125
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.166 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.56
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.56 F4000
            G39.3 S1
            G0 Z7.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.949 F42000
G1 Z7.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.464312
G1 F4864
M204 S6000
G1 X147.169 Y119.949 E.82204
; WIPE_START
G1 F13681.14
G1 X145.169 Y119.949 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.382 Z7.56 F42000
G1 X109.043 Y117.255 Z7.56
G1 Z7.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
M73 P81 R4
G3 X109.179 Y116.526 I1.521 J-.093 E.01553
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.255 I-1.878 J.407 E.01044
G1 X109.103 Y117.255 E.78517
M204 S10000
G1 X108.619 Y117.679 F42000
G1 F4864
M204 S6000
G1 X108.619 Y117.041 E.01324
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.679 E.01324
G1 X108.679 Y117.679 E.80277
M204 S10000
G1 X108.21 Y118.088 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X108.21 Y117.014 E.02071
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.428 Y115.268 E.00859
G1 X146.894 Y115.451 E.00965
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.088 E.02071
G1 X108.27 Y118.088 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.40897
G1 X108.273 Y116.537 E-.18269
G1 X108.442 Y116.128 E-.16835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.075 Y116.186 Z7.56 F42000
G1 X145.981 Y116.416 Z7.56
G1 Z7.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X146.567 Y116.892 I-.043 J.651 E.0167
G1 X145.691 Y116.892 E.01818
G1 X145.205 Y116.406 E.01425
G1 X144.393 Y116.406 E.01684
G1 X143.908 Y116.892 E.01425
G1 X140.891 Y116.892 E.06257
G1 X140.405 Y116.406 E.01425
G1 X139.594 Y116.406 E.01684
G1 X139.108 Y116.892 E.01425
G1 X136.091 Y116.892 E.06257
G1 X135.606 Y116.406 E.01425
G1 X134.794 Y116.406 E.01684
G1 X134.308 Y116.892 E.01425
G1 X131.291 Y116.892 E.06257
G1 X130.806 Y116.406 E.01425
G1 X129.994 Y116.406 E.01684
G1 X129.508 Y116.892 E.01425
G1 X126.492 Y116.892 E.06257
G1 X126.006 Y116.406 E.01425
G1 X125.194 Y116.406 E.01684
G1 X124.709 Y116.892 E.01425
G1 X121.692 Y116.892 E.06257
G1 X121.206 Y116.406 E.01425
G1 X120.394 Y116.406 E.01684
G1 X119.909 Y116.892 E.01425
G1 X116.892 Y116.892 E.06257
G1 X116.406 Y116.406 E.01425
G1 X115.595 Y116.406 E.01684
G1 X115.109 Y116.892 E.01425
G1 X112.092 Y116.892 E.06257
G1 X111.607 Y116.406 E.01425
G1 X110.795 Y116.406 E.01684
G1 X110.309 Y116.892 E.01425
G1 X109.433 Y116.892 E.01818
G3 X110.019 Y116.416 I.629 J.175 E.0167
; CHANGE_LAYER
; Z_HEIGHT: 7.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.85 Y116.438 E-.06475
G1 X109.589 Y116.589 E-.11442
G1 X109.433 Y116.892 E-.12958
G1 X110.309 Y116.892 E-.33303
G1 X110.529 Y116.672 E-.11821
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/83
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.56 I-1.011 J-.677 P1  F42000
G1 X108.619 Y119.522 Z7.56
G1 Z7.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4785
M204 S6000
G1 X147.381 Y119.522 E.80401
G1 X147.381 Y120.381 E.01781
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.582 E.01657
M204 S10000
G1 X108.21 Y119.113 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X147.79 Y119.113 E.76293
G1 X147.79 Y120.79 E.03233
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.173 E.03117
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.17 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.68
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.68 F4000
            G39.3 S1
            G0 Z7.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.951 F42000
G1 Z7.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.460122
G1 F4785
M204 S6000
G1 X147.169 Y119.951 E.81418
; WIPE_START
G1 F13813.11
G1 X145.169 Y119.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.384 Z7.68 F42000
G1 X109.043 Y117.259 Z7.68
G1 Z7.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4785
M204 S6000
G3 X109.179 Y116.526 I1.529 J-.095 E.01562
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.259 I-1.895 J.409 E.01053
G1 X109.103 Y117.259 E.78517
M204 S10000
G1 X108.619 Y117.683 F42000
G1 F4785
M204 S6000
G1 X108.619 Y117.041 E.01333
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.683 E.01333
G1 X108.679 Y117.683 E.80277
M204 S10000
G1 X108.21 Y118.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4785
M204 S5000
G1 X108.21 Y117.014 E.02079
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.436 Y115.269 E.00875
G1 X146.894 Y115.451 E.0095
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.093 E.02079
G1 X108.27 Y118.093 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41056
G1 X108.273 Y116.537 E-.18269
G1 X108.441 Y116.132 E-.16676
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.018 Y116.416 Z7.68 F42000
G1 Z7.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P82 R4
G1 F4785
M204 S6000
G2 X109.432 Y116.896 I.042 J.649 E.01677
G1 X110.305 Y116.896 E.0181
G1 X110.795 Y116.406 E.01437
G1 X111.607 Y116.406 E.01684
G1 X112.096 Y116.896 E.01437
G1 X115.105 Y116.896 E.0624
G1 X115.595 Y116.406 E.01437
G1 X116.406 Y116.406 E.01684
G1 X116.896 Y116.896 E.01437
G1 X119.905 Y116.896 E.0624
G1 X120.394 Y116.406 E.01437
G1 X121.206 Y116.406 E.01684
G1 X121.696 Y116.896 E.01437
G1 X124.704 Y116.896 E.0624
G1 X125.194 Y116.406 E.01437
G1 X126.006 Y116.406 E.01684
G1 X126.496 Y116.896 E.01437
G1 X129.504 Y116.896 E.0624
G1 X129.994 Y116.406 E.01437
G1 X130.806 Y116.406 E.01684
G1 X131.296 Y116.896 E.01437
G1 X134.304 Y116.896 E.0624
G1 X134.794 Y116.406 E.01437
G1 X135.606 Y116.406 E.01684
G1 X136.095 Y116.896 E.01437
G1 X139.104 Y116.896 E.0624
G1 X139.594 Y116.406 E.01437
G1 X140.405 Y116.406 E.01684
G1 X140.895 Y116.896 E.01437
G1 X143.904 Y116.896 E.0624
G1 X144.393 Y116.406 E.01437
G1 X145.205 Y116.406 E.01684
G1 X145.695 Y116.896 E.01437
G1 X146.568 Y116.896 E.0181
G2 X145.982 Y116.416 I-.628 J.169 E.01677
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.15 Y116.438 E-.06454
G1 X146.411 Y116.589 E-.11439
G1 X146.568 Y116.896 E-.13112
G1 X145.695 Y116.896 E-.33165
G1 X145.475 Y116.676 E-.1183
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/83
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.68 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.526 Z7.68
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4864
M204 S6000
G1 X147.381 Y119.526 E.80401
G1 X147.381 Y120.381 E.01772
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.586 E.01648
M204 S10000
G1 X108.21 Y119.117 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X147.79 Y119.117 E.76293
G1 X147.79 Y120.79 E.03225
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.177 E.03109
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.954 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.455932
G1 F4864
M204 S6000
G1 X147.169 Y119.954 E.80633
; WIPE_START
G1 F13947.651
G1 X145.169 Y119.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.387 Z7.8 F42000
G1 X109.043 Y117.263 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X109.179 Y116.526 I1.538 J-.097 E.0157
G3 X109.755 Y116.085 I.893 J.569 E.01535
M73 P82 R3
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.263 I-1.91 J.411 E.01061
G1 X109.103 Y117.263 E.78517
M204 S10000
G1 X108.619 Y117.688 F42000
G1 F4864
M204 S6000
G1 X108.619 Y117.041 E.01342
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.688 E.01342
G1 X108.679 Y117.688 E.80277
M204 S10000
G1 X108.21 Y118.097 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X108.21 Y117.014 E.02087
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.445 Y115.27 E.00891
G1 X146.894 Y115.451 E.00934
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.097 E.02087
G1 X108.27 Y118.097 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41215
G1 X108.273 Y116.537 E-.18269
G1 X108.439 Y116.136 E-.16517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.071 Y116.193 Z7.8 F42000
G1 X145.983 Y116.416 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X146.568 Y116.9 I-.042 J.647 E.01684
G1 X145.699 Y116.9 E.01803
G1 X145.205 Y116.406 E.01449
G1 X144.393 Y116.406 E.01684
G1 X143.899 Y116.9 E.01449
G1 X140.899 Y116.9 E.06223
G1 X140.405 Y116.406 E.01449
G1 X139.594 Y116.406 E.01684
G1 X139.1 Y116.9 E.01449
G1 X136.1 Y116.9 E.06223
G1 X135.606 Y116.406 E.01449
G1 X134.794 Y116.406 E.01684
G1 X134.3 Y116.9 E.01449
G1 X131.3 Y116.9 E.06223
G1 X130.806 Y116.406 E.01449
G1 X129.994 Y116.406 E.01684
G1 X129.5 Y116.9 E.01449
G1 X126.5 Y116.9 E.06223
G1 X126.006 Y116.406 E.01449
G1 X125.194 Y116.406 E.01684
G1 X124.7 Y116.9 E.01449
G1 X121.7 Y116.9 E.06223
G1 X121.206 Y116.406 E.01449
G1 X120.394 Y116.406 E.01684
G1 X119.9 Y116.9 E.01449
G1 X116.9 Y116.9 E.06223
G1 X116.406 Y116.406 E.01449
G1 X115.595 Y116.406 E.01684
G1 X115.101 Y116.9 E.01449
G1 X112.101 Y116.9 E.06223
G1 X111.607 Y116.406 E.01449
G1 X110.795 Y116.406 E.01684
G1 X110.301 Y116.9 E.01449
G1 X109.432 Y116.9 E.01803
G3 X110.017 Y116.416 I.628 J.163 E.01684
; CHANGE_LAYER
; Z_HEIGHT: 7.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.85 Y116.438 E-.0643
G1 X109.589 Y116.589 E-.11441
G1 X109.432 Y116.9 E-.13263
G1 X110.301 Y116.9 E-.33027
G1 X110.521 Y116.68 E-.1184
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/83
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.8 I-1.012 J-.675 P1  F42000
G1 X108.619 Y119.531 Z7.8
G1 Z7.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4786
M204 S6000
G1 X147.381 Y119.531 E.80401
G1 X147.381 Y120.381 E.01764
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.591 E.01639
M204 S10000
G1 X108.21 Y119.121 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4786
M204 S5000
G1 X147.79 Y119.121 E.76293
G1 X147.79 Y120.79 E.03217
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.181 E.03101
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.92
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.92 F4000
            G39.3 S1
            G0 Z7.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.956 F42000
G1 Z7.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.451742
G1 F4786
M204 S6000
G1 X147.169 Y119.956 E.79848
; WIPE_START
G1 F14084.838
G1 X145.169 Y119.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.389 Z7.92 F42000
M73 P83 R3
G1 X109.043 Y117.267 Z7.92
G1 Z7.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4786
M204 S6000
G3 X109.179 Y116.526 I1.546 J-.1 E.01579
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.267 I-1.926 J.413 E.0107
G1 X109.103 Y117.267 E.78517
M204 S10000
G1 X108.619 Y117.692 F42000
G1 F4786
M204 S6000
G1 X108.619 Y117.041 E.0135
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.692 E.0135
G1 X108.679 Y117.692 E.80277
M204 S10000
G1 X108.21 Y118.101 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4786
M204 S5000
G1 X108.21 Y117.014 E.02096
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.453 Y115.271 E.00907
G1 X146.894 Y115.451 E.00918
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.101 E.02096
G1 X108.27 Y118.101 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41374
G1 X108.273 Y116.537 E-.18269
G1 X108.437 Y116.139 E-.16358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.017 Y116.416 Z7.92 F42000
G1 Z7.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4786
M204 S6000
G2 X109.431 Y116.905 I.042 J.646 E.01691
G1 X110.297 Y116.905 E.01795
G1 X110.795 Y116.406 E.01462
G1 X111.607 Y116.406 E.01684
G1 X112.105 Y116.905 E.01462
G1 X115.096 Y116.905 E.06205
G1 X115.595 Y116.406 E.01462
G1 X116.406 Y116.406 E.01684
G1 X116.905 Y116.905 E.01462
G1 X119.896 Y116.905 E.06205
G1 X120.394 Y116.406 E.01462
G1 X121.206 Y116.406 E.01684
G1 X121.704 Y116.905 E.01462
G1 X124.696 Y116.905 E.06205
G1 X125.194 Y116.406 E.01462
G1 X126.006 Y116.406 E.01684
G1 X126.504 Y116.905 E.01462
G1 X129.496 Y116.905 E.06205
G1 X129.994 Y116.406 E.01462
G1 X130.806 Y116.406 E.01684
G1 X131.304 Y116.905 E.01462
G1 X134.296 Y116.905 E.06205
G1 X134.794 Y116.406 E.01462
G1 X135.606 Y116.406 E.01684
G1 X136.104 Y116.905 E.01462
G1 X139.095 Y116.905 E.06205
G1 X139.594 Y116.406 E.01462
G1 X140.405 Y116.406 E.01684
G1 X140.904 Y116.905 E.01462
G1 X143.895 Y116.905 E.06205
G1 X144.393 Y116.406 E.01462
G1 X145.205 Y116.406 E.01684
G1 X145.703 Y116.905 E.01462
G1 X146.569 Y116.905 E.01795
G2 X145.983 Y116.416 I-.628 J.158 E.01691
; CHANGE_LAYER
; Z_HEIGHT: 7.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.15 Y116.438 E-.0641
G1 X146.411 Y116.589 E-.11441
G1 X146.569 Y116.905 E-.13413
G1 X145.703 Y116.905 E-.32889
G1 X145.483 Y116.684 E-.11848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/83
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z7.92 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.535 Z7.92
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4865
M204 S6000
G1 X147.381 Y119.535 E.80401
G1 X147.381 Y120.381 E.01755
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.595 E.0163
M204 S10000
G1 X108.21 Y119.125 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X147.79 Y119.125 E.76293
G1 X147.79 Y120.79 E.03208
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.185 E.03093
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.04
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.04 F4000
            G39.3 S1
            G0 Z8.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.958 F42000
G1 Z7.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.447552
G1 F4865
M204 S6000
G1 X147.169 Y119.958 E.79062
; WIPE_START
G1 F14224.752
G1 X145.169 Y119.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.392 Z8.04 F42000
G1 X109.043 Y117.272 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G3 X109.179 Y116.526 I1.554 J-.102 E.01588
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.244 Y116.085 E.00654
G3 X146.915 Y116.755 I-.244 J.915 E.0206
G3 X146.957 Y117.272 I-1.942 J.415 E.01079
G1 X109.103 Y117.272 E.78517
M204 S10000
G1 X108.619 Y117.696 F42000
G1 F4865
M204 S6000
G1 X108.619 Y117.041 E.01359
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.355 Y115.671 E.00827
G3 X147.381 Y117.041 I-.408 J1.375 E.03803
G1 X147.381 Y117.696 E.01359
G1 X108.679 Y117.696 E.80277
M204 S10000
G1 X108.21 Y118.105 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4865
M204 S5000
G1 X108.21 Y117.014 E.02104
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.461 Y115.273 E.00924
G1 X146.894 Y115.451 E.00903
G1 X147.264 Y115.736 E.009
M73 P84 R3
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.105 E.02104
G1 X108.27 Y118.105 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41533
G1 X108.273 Y116.537 E-.18268
G1 X108.436 Y116.143 E-.16199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.068 Y116.199 Z8.04 F42000
G1 X145.984 Y116.416 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4865
M204 S6000
G3 X146.57 Y116.909 I-.042 J.644 E.01699
G1 X145.708 Y116.909 E.01788
G1 X145.205 Y116.406 E.01474
G1 X144.393 Y116.406 E.01684
G1 X143.891 Y116.909 E.01474
G1 X140.908 Y116.909 E.06188
G1 X140.405 Y116.406 E.01474
G1 X139.594 Y116.406 E.01684
G1 X139.091 Y116.909 E.01474
G1 X136.108 Y116.909 E.06188
G1 X135.606 Y116.406 E.01474
G1 X134.794 Y116.406 E.01684
G1 X134.291 Y116.909 E.01474
G1 X131.308 Y116.909 E.06188
G1 X130.806 Y116.406 E.01474
G1 X129.994 Y116.406 E.01684
G1 X129.492 Y116.909 E.01474
G1 X126.508 Y116.909 E.06188
G1 X126.006 Y116.406 E.01474
G1 X125.194 Y116.406 E.01684
G1 X124.692 Y116.909 E.01474
G1 X121.709 Y116.909 E.06188
G1 X121.206 Y116.406 E.01474
G1 X120.394 Y116.406 E.01684
G1 X119.892 Y116.909 E.01474
G1 X116.909 Y116.909 E.06188
G1 X116.406 Y116.406 E.01474
G1 X115.595 Y116.406 E.01684
G1 X115.092 Y116.909 E.01474
G1 X112.109 Y116.909 E.06188
G1 X111.607 Y116.406 E.01474
G1 X110.795 Y116.406 E.01684
G1 X110.292 Y116.909 E.01474
G1 X109.43 Y116.909 E.01788
G3 X110.016 Y116.416 I.628 J.152 E.01699
; CHANGE_LAYER
; Z_HEIGHT: 7.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.849 Y116.438 E-.06388
G1 X109.589 Y116.589 E-.11437
G1 X109.43 Y116.909 E-.13568
G1 X110.292 Y116.909 E-.3275
G1 X110.513 Y116.688 E-.11857
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/83
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.04 I-1.014 J-.673 P1  F42000
G1 X108.619 Y119.539 Z8.04
G1 Z7.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4786
M204 S6000
G1 X147.381 Y119.539 E.80401
G1 X147.381 Y120.381 E.01746
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.599 E.01622
M204 S10000
G1 X108.21 Y119.13 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4786
M204 S5000
G1 X147.79 Y119.13 E.76293
G1 X147.79 Y120.79 E.032
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.19 E.03085
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.16
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.16 F4000
            G39.3 S1
            G0 Z8.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.96 F42000
G1 Z7.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.443362
G1 F4786
M204 S6000
G1 X147.169 Y119.96 E.78277
; WIPE_START
G1 F14367.473
G1 X145.169 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.394 Z8.16 F42000
G1 X109.043 Y117.276 Z8.16
G1 Z7.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4786
M204 S6000
G3 X109.179 Y116.526 I1.563 J-.104 E.01596
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.276 I-1.958 J.417 E.01087
G1 X109.103 Y117.276 E.78517
M204 S10000
G1 X108.619 Y117.7 F42000
G1 F4786
M204 S6000
G1 X108.619 Y117.041 E.01368
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.7 E.01368
G1 X108.679 Y117.7 E.80277
M204 S10000
G1 X108.21 Y118.109 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4786
M204 S5000
G1 X108.21 Y117.014 E.02112
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.463 Y115.273 E.00927
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.109 E.02112
G1 X108.27 Y118.109 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41692
G1 X108.273 Y116.537 E-.18269
G1 X108.434 Y116.147 E-.1604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.016 Y116.416 Z8.16 F42000
G1 Z7.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4786
M204 S6000
G2 X109.43 Y116.913 I.042 J.643 E.01706
G1 X110.288 Y116.913 E.0178
G1 X110.795 Y116.406 E.01486
G1 X111.607 Y116.406 E.01684
G1 X112.113 Y116.913 E.01486
G1 X115.088 Y116.913 E.0617
G1 X115.595 Y116.406 E.01486
G1 X116.406 Y116.406 E.01684
G1 X116.913 Y116.913 E.01486
G1 X119.888 Y116.913 E.0617
G1 X120.394 Y116.406 E.01486
G1 X121.206 Y116.406 E.01684
G1 X121.713 Y116.913 E.01486
G1 X124.688 Y116.913 E.0617
G1 X125.194 Y116.406 E.01486
G1 X126.006 Y116.406 E.01684
G1 X126.513 Y116.913 E.01486
G1 X129.487 Y116.913 E.0617
G1 X129.994 Y116.406 E.01486
G1 X130.806 Y116.406 E.01684
G1 X131.312 Y116.913 E.01486
G1 X134.287 Y116.913 E.0617
G1 X134.794 Y116.406 E.01486
G1 X135.606 Y116.406 E.01684
G1 X136.112 Y116.913 E.01486
G1 X139.087 Y116.913 E.0617
G1 X139.594 Y116.406 E.01486
G1 X140.405 Y116.406 E.01684
G1 X140.912 Y116.913 E.01486
G1 X143.887 Y116.913 E.0617
G1 X144.393 Y116.406 E.01486
G1 X145.205 Y116.406 E.01684
G1 X145.712 Y116.913 E.01486
G1 X146.57 Y116.913 E.0178
G2 X145.984 Y116.416 I-.628 J.147 E.01706
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.15 Y116.438 E-.06364
G1 X146.411 Y116.589 E-.11439
G1 X146.57 Y116.913 E-.13719
G1 X145.712 Y116.913 E-.32613
G1 X145.491 Y116.692 E-.11865
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/83
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.16 I-.094 J-1.213 P1  F42000
G1 X108.619 Y119.543 Z8.16
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4866
M204 S6000
G1 X147.381 Y119.543 E.80401
G1 X147.381 Y120.381 E.01738
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.603 E.01613
M204 S10000
G1 X108.21 Y119.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4866
M204 S5000
G1 X147.79 Y119.134 E.76293
G1 X147.79 Y120.79 E.03192
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.194 E.03077
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.191 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.28
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.28 F4000
            G39.3 S1
            G0 Z8.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.962 F42000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.439172
G1 F4866
M204 S6000
G1 X147.169 Y119.962 E.77492
; WIPE_START
G1 F14513.086
G1 X145.169 Y119.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P85 R3
G1 X137.557 Y119.397 Z8.28 F42000
G1 X109.043 Y117.28 Z8.28
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4866
M204 S6000
G3 X109.179 Y116.526 I1.571 J-.106 E.01605
G3 X109.755 Y116.085 I.893 J.568 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.245 Y116.085 E.00656
G3 X146.915 Y116.755 I-.245 J.915 E.02058
G3 X146.957 Y117.28 I-1.974 J.419 E.01096
G1 X109.103 Y117.28 E.78517
M204 S10000
G1 X108.619 Y117.704 F42000
G1 F4866
M204 S6000
G1 X108.619 Y117.041 E.01377
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.356 Y115.671 E.0083
G3 X147.381 Y117.041 I-.41 J1.375 E.038
G1 X147.381 Y117.704 E.01377
G1 X108.679 Y117.704 E.80277
M204 S10000
G1 X108.21 Y118.114 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4866
M204 S5000
G1 X108.21 Y117.014 E.0212
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.463 Y115.273 E.00927
G1 X146.894 Y115.451 E.009
G1 X147.264 Y115.736 E.009
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.114 E.0212
G1 X108.27 Y118.114 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.41851
G1 X108.273 Y116.537 E-.18269
G1 X108.433 Y116.151 E-.1588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.065 Y116.205 Z8.28 F42000
G1 X145.985 Y116.417 Z8.28
G1 Z7.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4866
M204 S6000
G3 X146.571 Y116.917 I-.042 J.642 E.01713
G1 X145.716 Y116.917 E.01773
G1 X145.205 Y116.406 E.01498
G1 X144.393 Y116.406 E.01684
G1 X143.883 Y116.917 E.01498
G1 X140.916 Y116.917 E.06153
G1 X140.405 Y116.406 E.01498
G1 X139.594 Y116.406 E.01684
G1 X139.083 Y116.917 E.01498
G1 X136.116 Y116.917 E.06153
G1 X135.606 Y116.406 E.01499
G1 X134.794 Y116.406 E.01684
G1 X134.283 Y116.917 E.01499
G1 X131.317 Y116.917 E.06153
G1 X130.806 Y116.406 E.01499
G1 X129.994 Y116.406 E.01684
G1 X129.483 Y116.917 E.01499
G1 X126.517 Y116.917 E.06153
G1 X126.006 Y116.406 E.01499
G1 X125.194 Y116.406 E.01684
G1 X124.683 Y116.917 E.01498
G1 X121.717 Y116.917 E.06153
G1 X121.206 Y116.406 E.01499
G1 X120.394 Y116.406 E.01684
G1 X119.884 Y116.917 E.01499
G1 X116.917 Y116.917 E.06153
G1 X116.406 Y116.406 E.01499
G1 X115.595 Y116.406 E.01684
G1 X115.084 Y116.917 E.01499
G1 X112.117 Y116.917 E.06153
G1 X111.607 Y116.406 E.01499
G1 X110.795 Y116.406 E.01684
G1 X110.284 Y116.917 E.01499
G1 X109.429 Y116.917 E.01773
G3 X110.015 Y116.416 I.628 J.141 E.01713
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.849 Y116.438 E-.06342
G1 X109.589 Y116.589 E-.11438
G1 X109.429 Y116.917 E-.13872
G1 X110.284 Y116.917 E-.32474
G1 X110.505 Y116.696 E-.11874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/83
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.28 I-1.015 J-.671 P1  F42000
G1 X108.619 Y119.547 Z8.28
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4787
M204 S6000
G1 X147.381 Y119.547 E.80401
G1 X147.381 Y120.381 E.01729
G1 X108.619 Y120.381 E.80401
G1 X108.619 Y119.607 E.01604
M204 S10000
G1 X108.21 Y119.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X147.79 Y119.138 E.76293
G1 X147.79 Y120.79 E.03184
G1 X108.21 Y120.79 E.76293
G1 X108.21 Y119.198 E.03069
; WIPE_START
G1 F12000
M204 S6000
G1 X110.21 Y119.195 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.831 Y119.964 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.434982
G1 F4787
M204 S6000
G1 X147.169 Y119.964 E.76706
; WIPE_START
G1 F14661.683
G1 X145.169 Y119.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.557 Y119.399 Z8.4 F42000
G1 X109.043 Y117.284 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G3 X109.179 Y116.526 I1.579 J-.108 E.01614
G3 X109.755 Y116.085 I.893 J.569 E.01535
G1 X110.068 Y116.043 E.00656
G1 X145.932 Y116.043 E.74389
G1 X146.242 Y116.084 E.0065
G3 X146.915 Y116.755 I-.241 J.915 E.02064
G3 X146.957 Y117.284 I-1.99 J.422 E.01105
G1 X109.103 Y117.284 E.78517
M204 S10000
G1 X108.619 Y117.708 F42000
G1 F4787
M204 S6000
G1 X108.619 Y117.041 E.01385
G1 X108.671 Y116.644 E.0083
G3 X110.041 Y115.619 I1.375 J.41 E.038
G1 X145.959 Y115.619 E.74504
G1 X146.352 Y115.671 E.00822
G1 X146.688 Y115.809 E.00753
M73 P86 R3
G3 X147.329 Y116.644 I-.825 J1.296 E.02227
G1 X147.381 Y117.041 E.0083
G1 X147.381 Y117.708 E.01385
G1 X108.679 Y117.708 E.80277
M204 S10000
G1 X108.21 Y118.118 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4787
M204 S5000
G1 X108.21 Y117.014 E.02128
G1 X108.273 Y116.537 E.00927
G1 X108.451 Y116.106 E.009
G1 X108.736 Y115.736 E.009
G1 X109.106 Y115.451 E.009
G1 X109.537 Y115.273 E.009
G1 X110.014 Y115.21 E.00927
G1 X145.986 Y115.21 E.69339
G1 X146.459 Y115.272 E.00919
G1 X146.894 Y115.452 E.00908
G1 X147.264 Y115.736 E.00899
G1 X147.549 Y116.106 E.009
G1 X147.727 Y116.537 E.009
G1 X147.79 Y117.014 E.00927
G1 X147.79 Y118.118 E.02128
G1 X108.27 Y118.118 E.76178
; WIPE_START
G1 F12000
M204 S6000
G1 X108.21 Y117.014 E-.4201
G1 X108.273 Y116.537 E-.18268
G1 X108.431 Y116.155 E-.15722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.014 Y116.417 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4787
M204 S6000
G2 X109.429 Y116.921 I.042 J.641 E.01721
G1 X110.28 Y116.921 E.01765
G1 X110.795 Y116.406 E.01511
G1 X111.607 Y116.406 E.01684
G1 X112.122 Y116.921 E.01511
G1 X115.08 Y116.921 E.06136
G1 X115.595 Y116.406 E.01511
G1 X116.406 Y116.406 E.01684
G1 X116.921 Y116.921 E.01511
G1 X119.879 Y116.921 E.06136
G1 X120.394 Y116.406 E.01511
G1 X121.206 Y116.406 E.01684
G1 X121.721 Y116.921 E.01511
G1 X124.679 Y116.921 E.06136
G1 X125.194 Y116.406 E.01511
G1 X126.006 Y116.406 E.01684
G1 X126.521 Y116.921 E.01511
G1 X129.479 Y116.921 E.06136
G1 X129.994 Y116.406 E.01511
G1 X130.806 Y116.406 E.01684
G1 X131.321 Y116.921 E.01511
G1 X134.279 Y116.921 E.06136
G1 X134.794 Y116.406 E.01511
G1 X135.606 Y116.406 E.01684
G1 X136.121 Y116.921 E.01511
G1 X139.079 Y116.921 E.06136
G1 X139.594 Y116.406 E.01511
G1 X140.405 Y116.406 E.01684
G1 X140.92 Y116.921 E.01511
G1 X143.878 Y116.921 E.06136
G1 X144.393 Y116.406 E.01511
G1 X145.205 Y116.406 E.01684
G1 X145.72 Y116.921 E.01511
G1 X146.571 Y116.921 E.01765
G2 X145.985 Y116.417 I-.627 J.136 E.01721
; CHANGE_LAYER
; Z_HEIGHT: 8.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.148 Y116.438 E-.06223
G1 X146.411 Y116.589 E-.11535
G1 X146.571 Y116.921 E-.14022
G1 X145.72 Y116.921 E-.32335
G1 X145.499 Y116.7 E-.11884
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/83
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.4 I-.094 J-1.213 P1  F42000
G1 X108.627 Y119.551 Z8.4
G1 Z8.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4864
M204 S6000
G1 X147.373 Y119.551 E.80368
G1 X147.373 Y120.381 E.0172
G1 X108.627 Y120.381 E.80368
G1 X108.627 Y119.611 E.01596
M204 S10000
G1 X108.218 Y119.142 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X147.782 Y119.142 E.76263
G1 X147.782 Y120.79 E.03176
G1 X108.218 Y120.79 E.76263
G1 X108.218 Y119.202 E.03061
; WIPE_START
G1 F12000
M204 S6000
G1 X110.218 Y119.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.52
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.52 F4000
            G39.3 S1
            G0 Z8.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.839 Y119.966 F42000
G1 Z8.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430792
G1 F4864
M204 S6000
G1 X147.161 Y119.966 E.7589
; WIPE_START
G1 F14813.353
G1 X145.161 Y119.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.549 Y119.402 Z8.52 F42000
G1 X109.051 Y117.288 Z8.52
G1 Z8.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X109.184 Y116.535 I1.514 J-.121 E.01603
G3 X110.047 Y116.051 I.852 J.507 E.02148
G1 X145.955 Y116.051 E.74482
G1 X146.249 Y116.09 E.00617
G3 X146.904 Y116.71 I-.296 J.968 E.01938
G3 X146.949 Y117.288 I-2.173 J.459 E.01206
G1 X109.111 Y117.288 E.78484
M204 S10000
G1 X108.627 Y117.713 F42000
G1 F4864
M204 S6000
G1 X108.627 Y117.025 E.01426
G3 X108.675 Y116.659 I3.717 J.295 E.00766
G1 X108.814 Y116.322 E.00757
G3 X109.659 Y115.675 I1.306 J.83 E.02255
G3 X110.025 Y115.627 I.661 J3.67 E.00766
G1 X145.997 Y115.629 E.74616
G1 X146.353 Y115.676 E.00744
G3 X146.864 Y115.948 I-.454 J1.467 E.01207
G3 X147.285 Y116.504 I-1.094 J1.268 E.01457
G3 X147.373 Y117.029 I-4.069 J.949 E.01104
G1 X147.373 Y117.713 E.01419
G1 X108.687 Y117.713 E.80244
M204 S10000
M73 P86 R2
G1 X108.218 Y118.122 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4864
M204 S5000
G1 X108.218 Y117.009 E.02146
G3 X108.276 Y116.553 I4.57 J.348 E.00886
G1 X108.456 Y116.116 E.00911
G1 X108.742 Y115.742 E.00907
G1 X109.116 Y115.456 E.00907
G1 X109.553 Y115.276 E.00911
G3 X110.009 Y115.218 I.804 J4.512 E.00886
G1 X146.041 Y115.222 E.69456
G1 X146.453 Y115.276 E.00801
G3 X146.887 Y115.45 I-2.486 J6.835 E.009
G3 X147.53 Y116.087 I-1.218 J1.873 E.01757
G3 X147.722 Y116.537 I-1.15 J.756 E.00948
G3 X147.782 Y117.01 I-6.059 J1.015 E.00919
G1 X147.782 Y118.122 E.02144
G1 X108.278 Y118.122 E.76147
; WIPE_START
G1 F12000
M204 S6000
G1 X108.218 Y117.009 E-.42367
G1 X108.276 Y116.553 E-.17469
G1 X108.438 Y116.159 E-.16164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.07 Y116.212 Z8.52 F42000
G1 X145.976 Y116.42 Z8.52
G1 Z8.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4864
M204 S6000
G3 X146.566 Y116.926 I.017 J.577 E.01767
G1 X145.724 Y116.926 E.01746
G1 X145.213 Y116.414 E.015
G1 X144.386 Y116.414 E.01716
G1 X143.874 Y116.926 E.015
G1 X140.925 Y116.926 E.06118
G1 X140.413 Y116.414 E.015
G1 X139.586 Y116.414 E.01716
G1 X139.074 Y116.926 E.015
G1 X136.125 Y116.926 E.06118
G1 X135.613 Y116.414 E.015
G1 X134.786 Y116.414 E.01716
G1 X134.275 Y116.926 E.015
G1 X131.325 Y116.926 E.06118
G1 X130.814 Y116.414 E.015
G1 X129.986 Y116.414 E.01716
G1 X129.475 Y116.926 E.015
G1 X126.525 Y116.926 E.06118
G1 X126.014 Y116.414 E.015
M73 P87 R2
G1 X125.186 Y116.414 E.01717
G1 X124.675 Y116.926 E.015
G1 X121.725 Y116.926 E.06118
G1 X121.214 Y116.414 E.015
G1 X120.387 Y116.414 E.01716
G1 X119.875 Y116.926 E.015
G1 X116.926 Y116.926 E.06118
G1 X116.414 Y116.414 E.015
G1 X115.587 Y116.414 E.01716
G1 X115.075 Y116.926 E.015
G1 X112.126 Y116.926 E.06118
G1 X111.614 Y116.414 E.015
G1 X110.787 Y116.414 E.01717
G1 X110.276 Y116.926 E.015
G1 X109.433 Y116.926 E.01747
G3 X110.031 Y116.419 I.641 J.152 E.01739
; CHANGE_LAYER
; Z_HEIGHT: 8.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X109.864 Y116.441 E-.06393
G1 X109.596 Y116.596 E-.1176
G1 X109.433 Y116.926 E-.13974
G1 X110.276 Y116.926 E-.32006
G1 X110.496 Y116.705 E-.11868
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/83
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.52 I-1.02 J-.663 P1  F42000
G1 X108.643 Y119.556 Z8.52
G1 Z8.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4780
M204 S6000
G1 X147.357 Y119.556 E.80303
G1 X147.357 Y120.381 E.01711
G1 X108.643 Y120.381 E.80303
G1 X108.643 Y119.616 E.01587
M204 S10000
G1 X108.234 Y119.146 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4780
M204 S5000
G1 X147.766 Y119.146 E.76202
G1 X147.766 Y120.79 E.03168
G1 X108.234 Y120.79 E.76202
G1 X108.234 Y119.206 E.03052
; WIPE_START
G1 F12000
M204 S6000
G1 X110.234 Y119.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.64
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.64 F4000
            G39.3 S1
            G0 Z8.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.855 Y119.968 F42000
G1 Z8.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.426602
G1 F4780
M204 S6000
G1 X147.145 Y119.968 E.75043
; WIPE_START
G1 F14968.193
G1 X145.145 Y119.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.533 Y119.404 Z8.64 F42000
G1 X109.067 Y117.293 Z8.64
G1 Z8.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4780
M204 S6000
G3 X109.094 Y116.799 I2.375 J-.118 E.01027
G3 X110.042 Y116.067 I.944 J.243 E.02675
G1 X146.079 Y116.078 E.7475
G3 X146.656 Y116.352 I-.084 J.921 E.01353
G3 X146.933 Y117.048 I-.702 J.682 E.01594
G1 X146.933 Y117.293 E.00507
G1 X109.127 Y117.293 E.78418
M204 S10000
G1 X108.643 Y117.717 F42000
G1 F4780
M204 S6000
G3 X108.653 Y116.896 I5.068 J-.346 E.01705
G1 X108.681 Y116.689 E.00433
G1 X108.823 Y116.341 E.0078
G1 X109.048 Y116.048 E.00767
G1 X109.341 Y115.823 E.00767
G1 X109.689 Y115.681 E.0078
G3 X110.025 Y115.643 I.544 J3.334 E.00701
G1 X145.974 Y115.643 E.74567
G1 X146.125 Y115.656 E.00314
G1 X146.328 Y115.682 E.00424
G1 X146.663 Y115.809 E.00743
G3 X147.293 Y116.581 I-.872 J1.356 E.02102
G3 X147.357 Y117.029 I-2.959 J.65 E.00939
G1 X147.357 Y117.717 E.01428
G1 X108.703 Y117.717 E.80178
M204 S10000
G1 X108.234 Y118.126 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4780
M204 S5000
G1 X108.234 Y117.009 E.02154
G3 X108.465 Y116.136 I1.997 J.062 E.01756
G1 X108.756 Y115.756 E.00922
G1 X109.136 Y115.465 E.00922
G1 X109.583 Y115.282 E.00932
G3 X110.009 Y115.234 I.694 J4.228 E.00825
G1 X145.991 Y115.234 E.69359
G1 X146.169 Y115.249 E.00344
G1 X146.428 Y115.283 E.00504
G3 X146.873 Y115.452 I-.997 J3.294 E.00919
G3 X147.481 Y116.034 I-1.351 J2.018 E.0163
G3 X147.714 Y116.559 I-2.417 J1.386 E.0111
G3 X147.766 Y117.01 I-5.778 J.905 E.00875
G1 X147.766 Y118.126 E.02152
G1 X108.294 Y118.126 E.76086
; WIPE_START
G1 F12000
M204 S6000
G1 X108.234 Y117.009 E-.42526
G1 X108.282 Y116.583 E-.16263
G1 X108.453 Y116.164 E-.17211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.067 Y116.43 Z8.64 F42000
G1 Z8.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4780
M204 S6000
G1 X110.062 Y116.43 E.0001
G2 X109.445 Y116.93 I.039 J.679 E.0176
G1 X110.271 Y116.93 E.01715
G1 X110.771 Y116.43 E.01465
G1 X111.631 Y116.43 E.01783
G1 X112.13 Y116.93 E.01465
G1 X115.071 Y116.93 E.06101
G1 X115.569 Y116.432 E.01461
G1 X116.432 Y116.432 E.01789
G1 X116.93 Y116.93 E.0146
G1 X119.871 Y116.93 E.06101
G1 X120.368 Y116.433 E.01457
G1 X121.233 Y116.433 E.01795
G1 X121.73 Y116.93 E.01456
G1 X124.671 Y116.93 E.06101
G1 X125.166 Y116.434 E.01453
G1 X126.034 Y116.435 E.01801
G1 X126.529 Y116.93 E.01452
G1 X129.471 Y116.93 E.06101
G1 X129.965 Y116.436 E.01449
G1 X130.835 Y116.436 E.01806
G1 X131.329 Y116.93 E.01448
G1 X134.27 Y116.93 E.06101
G1 X134.763 Y116.437 E.01445
G1 X135.637 Y116.437 E.01812
G1 X136.129 Y116.93 E.01444
G1 X139.07 Y116.93 E.06101
G1 X139.561 Y116.439 E.01441
G1 X140.438 Y116.439 E.01818
G1 X140.929 Y116.93 E.0144
G1 X143.87 Y116.93 E.06101
G1 X144.36 Y116.44 E.01437
G1 X145.239 Y116.44 E.01823
G1 X145.729 Y116.93 E.01436
G1 X146.554 Y116.93 E.01711
G2 X145.942 Y116.44 I-.574 J.091 E.01783
; CHANGE_LAYER
; Z_HEIGHT: 8.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14142.679
G1 X146.262 Y116.499 E-.12366
G1 X146.465 Y116.675 E-.10211
G1 X146.554 Y116.93 E-.10254
G1 X145.729 Y116.93 E-.31347
G1 X145.509 Y116.71 E-.11822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/83
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.64 I-.094 J-1.213 P1  F42000
G1 X108.659 Y119.56 Z8.64
G1 Z8.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5131
M204 S6000
G1 X147.341 Y119.56 E.80237
G1 X147.341 Y120.381 E.01703
G1 X108.659 Y120.381 E.80237
G1 X108.659 Y119.62 E.01578
M204 S10000
G1 X108.249 Y119.151 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5131
M204 S5000
G1 X147.751 Y119.151 E.76141
G1 X147.751 Y120.79 E.0316
G1 X108.249 Y120.79 E.76141
G1 X108.249 Y119.211 E.03044
; WIPE_START
G1 F12000
M204 S6000
G1 X110.249 Y119.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.76
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.76 F4000
            G39.3 S1
            G0 Z8.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.871 Y119.97 F42000
G1 Z8.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.422412
G1 F5131
M204 S6000
G1 X147.129 Y119.97 E.74197
; WIPE_START
G1 F15126.305
G1 X145.129 Y119.97 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.518 Y119.406 Z8.76 F42000
G1 X109.083 Y117.297 Z8.76
G1 Z8.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5131
M204 S6000
G3 X109.1 Y116.829 I2.899 J-.127 E.00973
G3 X110.042 Y116.083 I.972 J.26 E.0267
G1 X145.956 Y116.083 E.74494
G1 X146.2 Y116.103 E.00507
G3 X146.736 Y116.454 I-.431 J1.245 E.01343
G1 X146.892 Y116.79 E.00769
G3 X146.917 Y117.297 I-3.609 J.431 E.01052
G1 X109.143 Y117.297 E.78353
M204 S10000
G1 X108.659 Y117.721 F42000
G1 F5131
M204 S6000
G3 X108.687 Y116.719 I5.811 J-.339 E.02081
G1 X108.832 Y116.36 E.00804
M73 P88 R2
G1 X109.061 Y116.061 E.00781
G1 X109.36 Y115.832 E.00781
G1 X109.719 Y115.687 E.00804
G3 X110.025 Y115.659 I.433 J3.047 E.00637
G1 X145.974 Y115.659 E.74567
G1 X146.252 Y115.682 E.00579
G3 X146.688 Y115.855 I-.345 J1.504 E.00977
G3 X147.099 Y116.229 I-1.484 J2.045 E.01154
G1 X147.304 Y116.671 E.01011
G3 X147.341 Y117.721 I-5.541 J.72 E.02183
G1 X108.719 Y117.721 E.80113
M204 S10000
G1 X108.249 Y118.13 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5131
M204 S5000
G1 X108.249 Y117.009 E.02162
G3 X108.288 Y116.614 I3.95 J.185 E.00764
G1 X108.474 Y116.156 E.00954
G1 X108.769 Y115.769 E.00937
G1 X109.156 Y115.474 E.00937
G1 X109.614 Y115.288 E.00954
G3 X110.009 Y115.249 I.581 J3.923 E.00764
G1 X145.991 Y115.249 E.69359
G1 X146.296 Y115.275 E.0059
G3 X146.907 Y115.505 I-.353 J1.863 E.01264
G3 X147.431 Y115.981 I-2.145 J2.892 E.01368
G3 X147.705 Y116.581 I-8.534 J4.257 E.01272
G3 X147.751 Y117.01 I-5.491 J.795 E.00831
G1 X147.751 Y118.13 E.0216
G1 X108.309 Y118.13 E.76025
; WIPE_START
G1 F12000
M204 S6000
G1 X108.249 Y117.009 E-.42685
G1 X108.288 Y116.614 E-.15062
G1 X108.468 Y116.169 E-.18253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.059 Y116.492 Z8.76 F42000
G1 Z8.36
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.42043
G1 F5131
M204 S6000
G1 X109.777 Y116.561 E.0056
G1 X109.557 Y116.786 E.00606
G1 X109.515 Y116.889 E.00215
G1 X146.49 Y116.89 E.71348
G1 X146.385 Y116.689 E.00436
G1 X146.128 Y116.516 E.00598
G1 X145.931 Y116.492 E.00384
G1 X110.119 Y116.492 E.69105
; CHANGE_LAYER
; Z_HEIGHT: 8.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15202.258
G1 X112.119 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/83
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.76 I-.81 J-.908 P1  F42000
G1 X108.675 Y119.564 Z8.76
G1 Z8.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5132
M204 S6000
G1 X147.325 Y119.564 E.80172
G1 X147.325 Y120.381 E.01694
G1 X108.675 Y120.381 E.80172
G1 X108.675 Y119.624 E.0157
M204 S10000
G1 X108.265 Y119.155 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5132
M204 S5000
G1 X147.735 Y119.155 E.7608
G1 X147.735 Y120.79 E.03152
G1 X108.265 Y120.79 E.7608
G1 X108.265 Y119.215 E.03036
; WIPE_START
G1 F12000
M204 S6000
G1 X110.265 Y119.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.88
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.88 F4000
            G39.3 S1
            G0 Z8.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.887 Y119.972 F42000
G1 Z8.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.418222
G1 F5132
M204 S6000
G1 X147.113 Y119.972 E.73352
; WIPE_START
G1 F15287.793
G1 X145.113 Y119.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.502 Y119.408 Z8.88 F42000
G1 X109.099 Y117.301 Z8.88
G1 Z8.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5132
M204 S6000
G3 X109.116 Y116.836 I2.876 J-.129 E.00967
G3 X110.042 Y116.099 I.946 J.239 E.02639
G1 X145.956 Y116.099 E.74494
G1 X146.156 Y116.116 E.00415
G1 X146.495 Y116.271 E.00775
G3 X146.706 Y116.457 I-1.738 J2.182 E.00584
G1 X146.881 Y116.836 E.00864
G3 X146.901 Y117.301 I-2.462 J.339 E.00968
G1 X109.159 Y117.301 E.78287
M204 S10000
G1 X108.675 Y117.725 F42000
G1 F5132
M204 S6000
G3 X108.698 Y116.737 I6.101 J-.35 E.02052
G1 X108.842 Y116.38 E.00799
G1 X109.075 Y116.075 E.00796
G1 X109.38 Y115.842 E.00796
G1 X109.737 Y115.698 E.00799
G1 X110.025 Y115.675 E.00599
G1 X145.974 Y115.675 E.74567
G1 X146.265 Y115.699 E.00606
G1 X146.722 Y115.908 E.01042
G3 X147.055 Y116.201 I-2.742 J3.457 E.00921
G1 X147.297 Y116.723 E.01194
G3 X147.325 Y117.725 I-5.306 J.654 E.02082
G1 X108.735 Y117.725 E.80047
M204 S10000
G1 X108.265 Y118.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5132
M204 S5000
G1 X108.265 Y117.009 E.0217
G1 X108.295 Y116.642 E.00709
G1 X108.483 Y116.175 E.0097
G1 X108.783 Y115.783 E.00952
G1 X109.175 Y115.483 E.00952
G1 X109.642 Y115.295 E.0097
G1 X110.009 Y115.265 E.00709
G1 X145.991 Y115.265 E.69359
G1 X146.352 Y115.296 E.00699
G1 X146.94 Y115.558 E.01241
G3 X147.395 Y115.961 I-4.765 J5.837 E.01172
G1 X147.698 Y116.615 E.0139
G1 X147.735 Y117.01 E.00764
G1 X147.735 Y118.134 E.02168
G1 X108.325 Y118.134 E.75965
; WIPE_START
G1 F12000
M204 S6000
G1 X108.265 Y117.009 E-.42843
G1 X108.295 Y116.642 E-.13976
G1 X108.483 Y116.175 E-.19115
G1 X108.484 Y116.174 E-.00066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.115 Y116.321 Z8.88 F42000
G1 X145.931 Y116.894 Z8.88
G1 Z8.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414659
G1 F5132
M204 S6000
G1 X146.463 Y116.896 E.01011
G1 X146.356 Y116.688 E.00444
G1 X146.051 Y116.513 E.00668
G1 X145.931 Y116.505 E.00229
G1 X110.059 Y116.505 E.68209
G1 X109.793 Y116.569 E.00519
G1 X109.565 Y116.802 E.0062
G1 X109.527 Y116.896 E.00193
G1 X145.871 Y116.894 E.69105
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F15427.879
G1 X143.871 Y116.894 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/83
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z8.88 I-.092 J-1.213 P1  F42000
G1 X108.697 Y119.568 Z8.88
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
M204 S6000
G1 X147.303 Y119.568 E.8008
G1 X147.303 Y120.381 E.01685
G1 X108.697 Y120.381 E.8008
G1 X108.697 Y119.628 E.01561
M204 S10000
G1 X108.287 Y119.159 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
M204 S5000
G1 X147.713 Y119.159 E.75995
G1 X147.713 Y120.79 E.03144
G1 X108.287 Y120.79 E.75995
G1 X108.287 Y119.219 E.03028
; WIPE_START
G1 F12000
M204 S6000
G1 X110.287 Y119.216 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


M73 P89 R2
G1 X108.909 Y119.975 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414022
G1 F5162
M204 S6000
G1 X147.091 Y119.975 E.72484
; WIPE_START
G1 F15453.165
G1 X145.091 Y119.975 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.48 Y119.41 Z9 F42000
G1 X109.121 Y117.305 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
M204 S6000
G3 X109.231 Y116.6 I1.613 J-.109 E.01492
G3 X109.869 Y116.147 I.791 J.437 E.0168
G1 X110.062 Y116.121 E.00402
G1 X145.918 Y116.121 E.74376
G1 X146.172 Y116.161 E.00533
G1 X146.524 Y116.322 E.00803
G3 X146.86 Y116.888 I-.676 J.785 E.0139
G3 X146.88 Y117.305 I-1.676 J.29 E.00869
G1 X109.181 Y117.305 E.78198
M204 S10000
G1 X108.697 Y117.729 F42000
G1 F5162
M204 S6000
G1 X108.697 Y117.033 E.01444
G3 X108.849 Y116.402 I1.9 J.123 E.01353
G1 X109.088 Y116.088 E.00819
G1 X109.402 Y115.849 E.00819
G3 X110.033 Y115.697 I.754 J1.747 E.01353
G1 X145.952 Y115.697 E.74503
G1 X146.243 Y115.742 E.00612
G1 X146.293 Y115.749 E.00105
G1 X146.755 Y115.961 E.01055
G3 X147.305 Y117.03 I-.92 J1.149 E.02569
G1 X147.304 Y117.729 E.0145
G1 X108.757 Y117.729 E.79957
M204 S10000
G1 X108.287 Y118.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
M204 S5000
G1 X108.288 Y117.006 E.02183
G3 X108.492 Y116.195 I3.34 J.409 E.01616
G1 X108.796 Y115.796 E.00968
G1 X109.195 Y115.492 E.00968
G3 X110.006 Y115.288 I1.22 J3.136 E.01616
G1 X145.984 Y115.287 E.69349
G1 X146.303 Y115.338 E.00624
G1 X146.409 Y115.353 E.00206
G1 X146.974 Y115.611 E.01197
G3 X147.408 Y116.055 I-1.581 J1.981 E.01201
G1 X147.629 Y116.531 E.01011
G3 X147.714 Y117.006 I-1.792 J.566 E.00932
G1 X147.713 Y118.139 E.02184
G1 X108.347 Y118.139 E.7588
; WIPE_START
G1 F12000
M204 S6000
G1 X108.288 Y117.006 E-.43092
G1 X108.33 Y116.688 E-.12189
G1 X108.492 Y116.195 E-.19708
G1 X108.508 Y116.174 E-.01011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.139 Y116.323 Z9 F42000
G1 X145.872 Y116.903 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405593
G1 F5162
M204 S6000
G1 X146.438 Y116.908 E.01051
G1 X146.288 Y116.65 E.00554
G1 X146.031 Y116.541 E.00518
G1 X145.872 Y116.523 E.00298
G1 X110.12 Y116.523 E.66396
G1 X109.755 Y116.618 E.007
G1 X109.594 Y116.8 E.0045
G1 X109.57 Y116.903 E.00197
G1 X145.812 Y116.903 E.67306
; CHANGE_LAYER
; Z_HEIGHT: 8.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15796.11
G1 X143.812 Y116.903 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/83
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9 I-.092 J-1.213 P1  F42000
G1 X108.746 Y119.572 Z9
G1 Z8.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5153
M204 S6000
G1 X147.254 Y119.572 E.79874
G1 X147.254 Y120.381 E.01677
G1 X108.746 Y120.381 E.79874
G1 X108.746 Y119.632 E.01552
M204 S10000
G1 X108.337 Y119.163 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5153
M204 S5000
G1 X147.663 Y119.163 E.75803
G1 X147.663 Y120.79 E.03136
G1 X108.337 Y120.79 E.75803
G1 X108.337 Y119.223 E.0302
; WIPE_START
G1 F12000
M204 S6000
G1 X110.337 Y119.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.12
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.12 F4000
            G39.3 S1
            G0 Z9.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.958 Y119.977 F42000
G1 Z8.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.409832
G1 F5153
M204 S6000
G1 X147.042 Y119.977 E.71515
; WIPE_START
G1 F15621.746
G1 X145.042 Y119.977 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.43 Y119.411 Z9.12 F42000
G1 X109.172 Y117.309 Z9.12
G1 Z8.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5153
M204 S6000
G3 X109.285 Y116.603 I1.372 J-.141 E.015
G3 X109.603 Y116.285 I.628 J.309 E.00951
G3 X110.02 Y116.172 I.535 J1.146 E.009
G1 X145.918 Y116.171 E.74463
G1 X146.094 Y116.198 E.00368
G1 X146.206 Y116.214 E.00236
G1 X146.492 Y116.345 E.00653
G1 X146.713 Y116.604 E.00706
G3 X146.829 Y117.309 I-1.364 J.587 E.01498
G1 X109.232 Y117.309 E.77987
M204 S10000
G1 X108.747 Y117.734 F42000
G1 F5153
M204 S6000
G1 X108.748 Y116.992 E.01538
G1 X108.769 Y116.831 E.00337
G1 X108.901 Y116.412 E.00911
G1 X109.114 Y116.114 E.0076
G1 X109.412 Y115.901 E.0076
G1 X109.831 Y115.769 E.00911
G1 X109.992 Y115.748 E.00337
G1 X145.952 Y115.746 E.7459
G1 X146.156 Y115.778 E.00429
G1 X146.326 Y115.802 E.00357
G1 X146.754 Y115.998 E.00976
G1 X147.074 Y116.372 E.0102
G1 X147.156 Y116.549 E.00404
G1 X147.254 Y116.932 E.0082
G1 X147.254 Y117.734 E.01663
G1 X108.807 Y117.734 E.79748
M204 S10000
G1 X108.337 Y118.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5153
M204 S5000
G1 X108.338 Y116.965 E.02271
G1 X108.368 Y116.742 E.00433
G1 X108.53 Y116.227 E.01041
G1 X108.821 Y115.821 E.00963
G1 X109.227 Y115.53 E.00963
G1 X109.742 Y115.368 E.01041
G1 X109.964 Y115.338 E.00433
G1 X145.984 Y115.337 E.69429
G1 X146.216 Y115.374 E.00454
G1 X146.443 Y115.406 E.00441
M73 P90 R2
G1 X147.01 Y115.668 E.01206
G1 X147.421 Y116.149 E.01219
G1 X147.543 Y116.411 E.00556
G1 X147.664 Y116.887 E.00946
G3 X147.663 Y116.974 I-.114 J.042 E.00172
G1 X147.663 Y118.143 E.02253
G1 X108.397 Y118.143 E.75687
; WIPE_START
G1 F12000
M204 S6000
G1 X108.338 Y116.965 E-.4483
G1 X108.368 Y116.742 E-.08536
G1 X108.53 Y116.227 E-.20522
G1 X108.562 Y116.181 E-.02111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.193 Y116.332 Z9.12 F42000
G1 X145.826 Y116.919 Z9.12
G1 Z8.72
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38268
G1 F5153
M204 S6000
G1 X146.025 Y116.919 E.00348
G1 X145.987 Y116.576 E.00601
G1 X145.826 Y116.561 E.00283
G1 X110.083 Y116.562 E.62375
G1 X109.757 Y116.656 E.00592
G1 X109.639 Y116.794 E.00317
G1 X109.612 Y116.919 E.00223
G1 X145.766 Y116.919 E.63092
M204 S10000
G1 X146.469 Y116.644 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160307
G1 F5153
M204 S6000
G1 X146.519 Y117.097 E.003
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F21000
G1 X146.469 Y116.644 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/83
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.12 I-.094 J-1.213 P1  F42000
G1 X108.796 Y119.577 Z9.12
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4724
M204 S6000
G1 X147.204 Y119.577 E.79668
G1 X147.204 Y120.381 E.01668
G1 X108.796 Y120.381 E.79668
G1 X108.796 Y119.637 E.01544
M204 S10000
G1 X108.387 Y119.167 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4724
M204 S5000
G1 X147.613 Y119.167 E.75612
G1 X147.613 Y120.79 E.03128
G1 X108.387 Y120.79 E.75612
G1 X108.387 Y119.227 E.03012
; WIPE_START
G1 F12000
M204 S6000
G1 X110.387 Y119.224 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.24
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.24 F4000
            G39.3 S1
            G0 Z9.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.008 Y119.979 F42000
G1 Z8.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405642
G1 F4724
M204 S6000
G1 X146.992 Y119.979 E.7055
; WIPE_START
G1 F15794.046
G1 X144.992 Y119.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.38 Y119.412 Z9.24 F42000
G1 X109.222 Y117.314 Z9.24
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4724
M204 S6000
G1 X109.223 Y116.978 E.00697
G1 X109.325 Y116.651 E.00709
G3 X109.651 Y116.325 I.643 J.317 E.00975
G1 X109.977 Y116.223 E.00708
G1 X145.918 Y116.22 E.74551
G1 X146.007 Y116.234 E.00185
G3 X146.448 Y116.372 I-.025 J.857 E.00973
G1 X146.689 Y116.654 E.00768
G1 X146.78 Y117.009 E.0076
G1 X146.78 Y117.314 E.00632
G1 X109.282 Y117.314 E.77779
M204 S10000
G1 X108.797 Y117.738 F42000
G1 F4724
M204 S6000
G1 X108.798 Y116.95 E.01633
G1 X108.941 Y116.46 E.0106
G1 X109.157 Y116.157 E.00772
G1 X109.46 Y115.941 E.00772
G1 X109.95 Y115.798 E.01059
G1 X145.952 Y115.796 E.74676
G1 X146.069 Y115.814 E.00246
G3 X146.728 Y116.046 I-.083 J1.29 E.01468
G1 X147.075 Y116.453 E.0111
G1 X147.204 Y116.956 E.01075
G1 X147.204 Y117.738 E.01623
G1 X108.857 Y117.738 E.79541
M204 S10000
G1 X108.387 Y118.147 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4724
M204 S5000
G1 X108.389 Y116.923 E.0236
G1 X108.406 Y116.795 E.00248
G1 X108.57 Y116.275 E.01052
G1 X108.864 Y115.864 E.00974
G1 X109.275 Y115.57 E.00974
G1 X109.795 Y115.406 E.01053
G1 X109.923 Y115.389 E.00247
G1 X145.984 Y115.387 E.6951
G1 X146.129 Y115.41 E.00284
G1 X146.476 Y115.459 E.00675
G3 X146.998 Y115.732 I-.831 J2.22 E.01138
G1 X147.434 Y116.243 E.01296
G1 X147.622 Y116.939 E.01389
G1 X147.613 Y118.147 E.02329
G1 X108.447 Y118.147 E.75495
; WIPE_START
G1 F12000
M204 S6000
G1 X108.389 Y116.923 E-.4657
G1 X108.406 Y116.795 E-.04883
G1 X108.57 Y116.275 E-.20748
G1 X108.628 Y116.193 E-.03798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.483 Y116.857 Z9.24 F42000
G1 Z8.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.652138
G1 F4724
M204 S6000
G1 X109.772 Y116.812 E.00895
; LINE_WIDTH: 0.678934
G1 X110.061 Y116.768 E.00934
; LINE_WIDTH: 0.693043
G1 X145.876 Y116.767 E1.16848
G3 X146.527 Y116.878 I-.137 J2.775 E.02161
; CHANGE_LAYER
; Z_HEIGHT: 8.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F8991.583
G1 X146.089 Y116.782 E-.17046
G1 X145.876 Y116.767 E-.0812
G1 X144.538 Y116.767 E-.50835
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/83
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.24 I-.096 J-1.213 P1  F42000
G1 X108.846 Y119.581 Z9.24
G1 Z8.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4717
M204 S6000
G1 X147.154 Y119.581 E.79461
G1 X147.154 Y120.381 E.01659
M73 P91 R2
G1 X108.846 Y120.381 E.79461
G1 X108.846 Y119.641 E.01535
M204 S10000
G1 X108.437 Y119.172 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4717
M204 S5000
G1 X147.563 Y119.172 E.7542
G1 X147.563 Y120.79 E.0312
G1 X108.437 Y120.79 E.7542
G1 X108.437 Y119.232 E.03004
; WIPE_START
G1 F12000
M204 S6000
G1 X110.437 Y119.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.36
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.36 F4000
            G39.3 S1
            G0 Z9.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.058 Y119.981 F42000
G1 Z8.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.401452
G1 F4717
M204 S6000
G1 X146.942 Y119.981 E.69589
; WIPE_START
G1 F15970.189
G1 X144.942 Y119.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.331 Y119.413 Z9.36 F42000
G1 X109.27 Y117.318 Z9.36
G1 Z8.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4717
M204 S6000
G1 X109.27 Y117.002 E.00656
G1 X109.365 Y116.699 E.00657
G3 X110.002 Y116.27 I.763 J.445 E.01648
G1 X145.918 Y116.27 E.745
G1 X146.208 Y116.311 E.00607
G1 X146.462 Y116.467 E.00619
G1 X146.638 Y116.673 E.00561
G1 X146.73 Y117.033 E.0077
M73 P91 R1
G1 X146.73 Y117.318 E.00591
G1 X109.33 Y117.318 E.77577
M204 S10000
G1 X108.846 Y117.742 F42000
G1 F4717
M204 S6000
G3 X108.848 Y116.93 I15.123 J-.367 E.01685
G1 X108.98 Y116.507 E.00919
G1 X109.2 Y116.2 E.00783
G1 X109.507 Y115.98 E.00783
G1 X109.93 Y115.848 E.00919
G1 X145.982 Y115.851 E.74781
G1 X146.355 Y115.903 E.00781
G1 X146.742 Y116.141 E.00942
G1 X147.029 Y116.488 E.00935
G3 X147.154 Y116.997 I-3.453 J1.123 E.01087
G1 X147.154 Y117.742 E.01546
G1 X108.906 Y117.742 E.79337
M204 S10000
G1 X108.437 Y118.151 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4717
M204 S5000
G3 X108.44 Y116.884 I23.617 J-.574 E.02444
G1 X108.61 Y116.322 E.0113
G1 X108.907 Y115.907 E.00985
G1 X109.322 Y115.61 E.00985
G1 X109.849 Y115.444 E.01064
G3 X110.003 Y115.437 I.114 J.72 E.00298
G1 X146.042 Y115.446 E.69468
G1 X146.496 Y115.51 E.00885
G1 X147.011 Y115.826 E.01164
G1 X147.348 Y116.221 E.01
G1 X147.412 Y116.335 E.00253
G3 X147.563 Y116.974 I-3.015 J1.053 E.01268
G1 X147.563 Y118.151 E.02269
G1 X108.497 Y118.151 E.75304
; WIPE_START
G1 F12000
M204 S6000
G1 X108.44 Y116.884 E-.48214
G1 X108.61 Y116.322 E-.22285
G1 X108.694 Y116.205 E-.05502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.531 Y116.878 Z9.36 F42000
G1 Z8.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.648727
G1 F4717
M204 S6000
G1 X110.082 Y116.794 E.01697
G1 X145.882 Y116.794 E1.09042
G1 X146.46 Y116.834 E.01767
; CHANGE_LAYER
; Z_HEIGHT: 9.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9631.208
G1 X145.882 Y116.794 E-.22043
G1 X144.462 Y116.794 E-.53957
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/83
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.36 I-.095 J-1.213 P1  F42000
G1 X108.903 Y119.585 Z9.36
G1 Z9.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4700
M204 S6000
G1 X147.097 Y119.585 E.79226
G1 X147.097 Y120.381 E.01651
G1 X108.903 Y120.381 E.79226
G1 X108.903 Y119.645 E.01526
M204 S10000
G1 X108.493 Y119.176 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4700
M204 S5000
G1 X147.507 Y119.176 E.75201
G1 X147.507 Y120.79 E.03112
G1 X108.493 Y120.79 E.75201
G1 X108.493 Y119.236 E.02996
; WIPE_START
G1 F12000
M204 S6000
G1 X110.493 Y119.233 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.48
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.48 F4000
            G39.3 S1
            G0 Z9.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.115 Y119.983 F42000
G1 Z9.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397262
G1 F4700
M204 S6000
G1 X146.885 Y119.983 E.68607
; WIPE_START
G1 F16150.307
G1 X144.885 Y119.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.274 Y119.413 Z9.48 F42000
G1 X109.327 Y117.322 Z9.48
G1 Z9.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4700
M204 S6000
G3 X109.548 Y116.548 I.968 J-.142 E.01721
G3 X110.037 Y116.327 I.539 J.542 E.01138
G1 X145.896 Y116.327 E.7438
G1 X146.195 Y116.387 E.00633
G1 X146.483 Y116.566 E.00704
G3 X146.673 Y117.322 I-.982 J.649 E.01649
G1 X109.387 Y117.322 E.77341
M204 S10000
G1 X108.903 Y117.746 F42000
G1 F4700
M204 S6000
G3 X108.908 Y116.941 I5.695 J-.362 E.01672
G3 X109.02 Y116.555 I2.093 J.4 E.00834
G1 X109.244 Y116.244 E.00795
G1 X109.555 Y116.02 E.00795
G3 X110.022 Y115.903 I.572 J1.282 E.01003
G1 X145.938 Y115.903 E.74499
G1 X146.319 Y115.98 E.00807
G1 X146.754 Y116.234 E.01045
G1 X146.841 Y116.336 E.00277
G1 X147.012 Y116.642 E.00727
G3 X147.097 Y117.028 I-2.627 J.783 E.00821
G1 X147.097 Y117.746 E.0149
G1 X108.963 Y117.746 E.79101
M204 S10000
G1 X108.493 Y118.155 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4700
M204 S5000
G1 X108.493 Y117.008 E.02213
G3 X108.649 Y116.37 I1.934 J.136 E.01271
G1 X108.95 Y115.95 E.00996
G1 X109.37 Y115.649 E.00996
G3 X110.008 Y115.493 I.774 J1.778 E.01271
G1 X145.979 Y115.493 E.69338
G1 X146.4 Y115.578 E.00827
G1 X146.505 Y115.599 E.00206
G1 X147.024 Y115.92 E.01176
G1 X147.178 Y116.101 E.00458
G1 X147.395 Y116.488 E.00857
G3 X147.507 Y117.008 I-3.494 J1.021 E.01025
G1 X147.507 Y118.155 E.02212
G1 X108.553 Y118.155 E.75086
; WIPE_START
G1 F12000
M204 S6000
G1 X108.493 Y117.008 E-.43679
G1 X108.531 Y116.749 E-.09927
G1 X108.649 Y116.37 E-.15081
G1 X108.762 Y116.214 E-.07313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.579 Y116.9 Z9.48 F42000
G1 Z9.08
M73 P92 R1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.596187
G1 F4700
M204 S6000
G1 X110.072 Y116.824 E.0139
G1 X145.846 Y116.824 E.99773
G1 X146.417 Y116.881 E.016
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10518.301
G1 X145.846 Y116.824 E-.21797
G1 X144.419 Y116.824 E-.54203
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/83
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.48 I-.095 J-1.213 P1  F42000
G1 X108.995 Y119.589 Z9.48
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4677
M204 S6000
G1 X147.005 Y119.589 E.78844
G1 X147.005 Y120.381 E.01642
G1 X108.995 Y120.381 E.78844
G1 X108.995 Y119.649 E.01517
M204 S10000
G1 X108.585 Y119.18 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4677
M204 S5000
G1 X147.415 Y119.18 E.74846
G1 X147.415 Y120.79 E.03103
G1 X108.585 Y120.79 E.74846
G1 X108.585 Y119.24 E.02988
; WIPE_START
G1 F12000
M204 S6000
G1 X110.585 Y119.237 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.207 Y119.985 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.393072
G1 F4677
M204 S6000
G1 X146.793 Y119.985 E.67502
; WIPE_START
G1 F16334.532
G1 X144.793 Y119.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.182 Y119.413 Z9.6 F42000
G1 X109.419 Y117.326 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4677
M204 S6000
G3 X109.483 Y116.741 I1.399 J-.142 E.0123
G3 X109.741 Y116.483 I.507 J.25 E.00769
G1 X110.043 Y116.419 E.0064
G1 X145.896 Y116.419 E.74368
G1 X146.103 Y116.461 E.00439
G1 X146.208 Y116.481 E.00222
G1 X146.398 Y116.599 E.00463
G1 X146.572 Y116.908 E.00735
G3 X146.581 Y117.326 I-2.934 J.274 E.00869
G1 X109.479 Y117.326 E.76959
M204 S10000
G1 X108.995 Y117.75 F42000
G1 F4677
M204 S6000
G1 X108.997 Y116.986 E.01586
G1 X109.086 Y116.57 E.00882
G3 X109.287 Y116.287 I3.595 J2.336 E.0072
G3 X109.57 Y116.086 I2.607 J3.378 E.0072
G1 X110.022 Y115.995 E.00957
G1 X145.938 Y115.995 E.74499
G1 X146.186 Y116.045 E.00524
G1 X146.366 Y116.08 E.00381
G1 X146.714 Y116.295 E.00849
G1 X146.988 Y116.783 E.0116
G3 X147.005 Y117.75 I-6.789 J.604 E.0201
G1 X109.055 Y117.75 E.78719
M204 S10000
G1 X108.585 Y118.16 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4677
M204 S5000
G1 X108.585 Y117.008 E.02221
G1 X108.702 Y116.409 E.01175
G3 X108.994 Y115.994 I5.262 J3.379 E.00979
G3 X109.409 Y115.702 I3.793 J4.967 E.00979
G1 X110.008 Y115.585 E.01175
G1 X145.979 Y115.585 E.69337
G1 X146.266 Y115.643 E.00564
G1 X146.518 Y115.693 E.00496
G1 X147.019 Y116.003 E.01135
G1 X147.377 Y116.639 E.01407
G3 X147.415 Y117.008 I-1.215 J.31 E.00717
G1 X147.415 Y118.16 E.02221
G1 X108.645 Y118.16 E.74731
; WIPE_START
G1 F12000
M204 S6000
G1 X108.585 Y117.008 E-.43836
G1 X108.702 Y116.409 E-.23165
G1 X108.838 Y116.215 E-.08998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.638 Y117.031 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.445558
G1 F4677
M204 S6000
G3 X109.921 Y116.89 I.568 J.786 E.00651
; LINE_WIDTH: 0.50863
G1 X110.091 Y116.872 E.00403
G1 X145.85 Y116.872 E.84425
G1 X146.017 Y116.889 E.00395
; LINE_WIDTH: 0.460662
G1 X146.365 Y116.982 E.00766
; CHANGE_LAYER
; Z_HEIGHT: 9.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F13795.961
G1 X146.017 Y116.889 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/83
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.6 I-.089 J-1.214 P1  F42000
G1 X109.087 Y119.593 Z9.6
G1 Z9.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4645
M204 S6000
G1 X146.913 Y119.593 E.78462
G1 X146.913 Y120.381 E.01633
G1 X109.087 Y120.381 E.78462
G1 X109.087 Y119.653 E.01509
M204 S10000
G1 X108.677 Y119.184 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4645
M204 S5000
G1 X147.323 Y119.184 E.74491
G1 X147.323 Y120.79 E.03095
G1 X108.677 Y120.79 E.74491
G1 X108.677 Y119.244 E.0298
; WIPE_START
G1 F12000
M204 S6000
G1 X110.677 Y119.241 E-.76
; WIPE_END
M73 P93 R1
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.72
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.72 F4000
            G39.3 S1
            G0 Z9.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.299 Y119.987 F42000
G1 Z9.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.388882
G1 F4645
M204 S6000
G1 X146.701 Y119.987 E.66405
; WIPE_START
G1 F16523.008
G1 X144.701 Y119.987 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.09 Y119.412 Z9.72 F42000
G1 X109.511 Y117.33 Z9.72
G1 Z9.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4645
M204 S6000
G3 X109.564 Y116.829 I1.575 J-.087 E.0105
G3 X109.87 Y116.554 I.503 J.251 E.00875
G1 X110.072 Y116.511 E.00427
G1 X145.896 Y116.511 E.74308
G1 X145.969 Y116.526 E.00155
G1 X146.226 Y116.576 E.00544
G1 X146.339 Y116.674 E.00309
G1 X146.481 Y116.928 E.00604
G3 X146.489 Y117.33 I-2.822 J.256 E.00836
G1 X109.571 Y117.33 E.76577
M204 S10000
G1 X109.087 Y117.755 F42000
G1 F4645
M204 S6000
G1 X109.087 Y117.027 E.01509
G3 X109.363 Y116.363 I1.155 J.091 E.01517
G1 X109.657 Y116.17 E.00729
G3 X110.027 Y116.087 I1.36 J5.192 E.00788
G1 X145.938 Y116.087 E.74488
G1 X146.052 Y116.11 E.0024
G1 X146.379 Y116.174 E.00692
G3 X146.673 Y116.401 I-.565 J1.034 E.00774
G1 X146.878 Y116.768 E.00871
G3 X146.913 Y117.022 I-.618 J.215 E.00536
G1 X146.913 Y117.755 E.01519
G1 X109.147 Y117.755 E.78337
M204 S10000
G1 X108.677 Y118.164 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4645
M204 S5000
G1 X108.677 Y117.008 E.02229
G3 X108.79 Y116.49 I5.563 J.935 E.01021
G1 X109.067 Y116.067 E.00975
G1 X109.49 Y115.79 E.00975
G3 X110.008 Y115.677 I1.455 J5.464 E.01021
G1 X145.979 Y115.677 E.69337
G1 X146.131 Y115.708 E.003
G1 X146.531 Y115.787 E.00785
G3 X146.994 Y116.139 I-.87 J1.628 E.01126
G1 X147.259 Y116.611 E.01045
G3 X147.323 Y117.008 I-.959 J.356 E.00778
G1 X147.323 Y118.164 E.02229
G1 X108.737 Y118.164 E.74376
; WIPE_START
G1 F12000
M204 S6000
G1 X108.677 Y117.008 E-.43994
G1 X108.79 Y116.49 E-.20122
G1 X108.961 Y116.229 E-.11884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.741 Y117.008 Z9.72 F42000
G1 Z9.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.381793
G1 F4645
M204 S6000
G1 X109.988 Y116.934 E.00448
; LINE_WIDTH: 0.420633
G1 X110.115 Y116.921 E.00246
G1 X145.855 Y116.921 E.69002
G1 X146.256 Y116.96 E.00779
; CHANGE_LAYER
; Z_HEIGHT: 9.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F15194.447
G1 X145.855 Y116.921 E-.1533
G1 X144.258 Y116.921 E-.6067
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/83
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.72 I-.093 J-1.213 P1  F42000
G1 X109.179 Y119.598 Z9.72
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4621
M204 S6000
G1 X146.821 Y119.598 E.7808
G1 X146.821 Y120.381 E.01625
G1 X109.179 Y120.381 E.7808
G1 X109.179 Y119.658 E.015
M204 S10000
G1 X108.77 Y119.188 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4621
M204 S5000
G1 X147.23 Y119.188 E.74136
G1 X147.23 Y120.79 E.03087
G1 X108.77 Y120.79 E.74136
G1 X108.77 Y119.248 E.02972
; WIPE_START
G1 F12000
M204 S6000
G1 X110.77 Y119.245 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.84
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.84 F4000
            G39.3 S1
            G0 Z9.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.391 Y119.989 F42000
G1 Z9.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.384692
G1 F4621
M204 S6000
G1 X146.609 Y119.989 E.65316
; WIPE_START
G1 F16715.885
G1 X144.609 Y119.989 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.999 Y119.412 Z9.84 F42000
G1 X109.603 Y117.334 Z9.84
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4621
M204 S6000
G3 X109.754 Y116.754 I.798 J-.102 E.01275
G3 X110.113 Y116.604 I.391 J.431 E.00823
G1 X145.897 Y116.603 E.74225
G1 X146.073 Y116.638 E.00373
G1 X146.116 Y116.649 E.00091
G1 X146.322 Y116.827 E.00565
G3 X146.397 Y117.334 I-.885 J.39 E.01078
G1 X109.663 Y117.334 E.76195
M204 S10000
G1 X109.179 Y117.759 F42000
G1 F4621
M204 S6000
G1 X109.179 Y117.057 E.01456
G1 X109.259 Y116.734 E.0069
G1 X109.448 Y116.448 E.00712
G1 X109.733 Y116.26 E.00708
G1 X110.062 Y116.18 E.00702
G1 X145.939 Y116.179 E.74417
G1 X146.168 Y116.224 E.00484
G1 X146.318 Y116.263 E.00322
G1 X146.656 Y116.555 E.00926
G1 X146.717 Y116.664 E.00259
G1 X146.821 Y117.042 E.00814
G1 X146.821 Y117.759 E.01487
G1 X109.239 Y117.759 E.77955
M204 S10000
G1 X108.77 Y118.168 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4621
M204 S5000
G1 X108.77 Y117.02 E.02213
G3 X108.879 Y116.568 I4.052 J.743 E.00897
G1 X109.152 Y116.152 E.00959
G1 X109.567 Y115.879 E.00958
G1 X110.013 Y115.77 E.00884
G1 X145.997 Y115.773 E.69363
G3 X146.513 Y115.891 I-.743 J4.456 E.0102
G1 X146.978 Y116.292 E.01183
G1 X147.098 Y116.507 E.00476
G1 X147.228 Y116.98 E.00945
G1 X147.23 Y118.168 E.02291
G1 X108.83 Y118.168 E.74021
; WIPE_START
G1 F12000
M204 S6000
G1 X108.77 Y117.02 E-.43687
G1 X108.879 Y116.568 E-.17676
G1 X109.091 Y116.246 E-.14637
; WIPE_END
M73 P94 R1
G1 E-.04 F1800
M204 S10000
G1 X109.838 Y117.045 Z9.84 F42000
G1 Z9.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.290649
G1 F4621
M204 S6000
G1 X110.047 Y116.982 E.00284
; LINE_WIDTH: 0.332455
G1 X110.157 Y116.969 E.00166
G1 X145.861 Y116.969 E.5354
G1 X146.149 Y116.997 E.00433
; CHANGE_LAYER
; Z_HEIGHT: 9.56
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F19562.918
G1 X145.861 Y116.969 E-.10975
G1 X144.15 Y116.969 E-.65025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/83
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.84 I-.092 J-1.214 P1  F42000
G1 X109.317 Y119.602 Z9.84
G1 Z9.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4583
M204 S6000
G1 X146.683 Y119.602 E.77507
G1 X146.683 Y120.381 E.01616
G1 X109.317 Y120.381 E.77507
G1 X109.317 Y119.662 E.01491
M204 S10000
G1 X108.908 Y119.193 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4583
M204 S5000
G1 X147.092 Y119.193 E.73604
G1 X147.092 Y120.79 E.03079
G1 X108.908 Y120.79 E.73604
G1 X108.908 Y119.253 E.02964
; WIPE_START
G1 F12000
M204 S6000
G1 X110.908 Y119.249 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.96
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.96 F4000
            G39.3 S1
            G0 Z9.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.529 Y119.991 F42000
G1 Z9.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380502
G1 F4583
M204 S6000
G1 X146.471 Y119.991 E.64075
; WIPE_START
G1 F16913.321
G1 X144.471 Y119.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.861 Y119.41 Z9.96 F42000
G1 X109.741 Y117.339 Z9.96
G1 Z9.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4583
M204 S6000
G3 X109.748 Y116.978 I1.949 J-.145 E.0075
G3 X110.048 Y116.741 I.368 J.158 E.00828
G1 X145.865 Y116.741 E.74292
G1 X145.913 Y116.754 E.00103
G1 X146.099 Y116.802 E.00399
G1 X146.203 Y116.892 E.00285
G3 X146.259 Y117.339 I-.831 J.331 E.00944
G1 X109.801 Y117.339 E.75623
M204 S10000
G1 X109.317 Y117.763 F42000
G1 F4583
M204 S6000
G1 X109.317 Y117.029 E.01523
G3 X109.349 Y116.812 I.721 J-.004 E.00456
G1 X109.532 Y116.532 E.00694
G1 X109.812 Y116.349 E.00694
G3 X110.029 Y116.317 I.212 J.689 E.00456
G1 X145.92 Y116.317 E.74447
G1 X146.02 Y116.343 E.00216
G1 X146.301 Y116.416 E.00602
G1 X146.58 Y116.657 E.00765
G1 X146.683 Y117.052 E.00846
G1 X146.683 Y117.763 E.01476
G1 X109.377 Y117.763 E.77383
M204 S10000
G1 X108.908 Y118.172 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4583
M204 S5000
G1 X108.908 Y117.01 E.02241
G3 X108.969 Y116.646 I1.216 J.017 E.00715
G1 X109.237 Y116.237 E.00942
G1 X109.646 Y115.969 E.00942
G3 X110.01 Y115.908 I.381 J1.155 E.00715
G1 X145.973 Y115.908 E.69321
G1 X146.124 Y115.947 E.00301
G1 X146.497 Y116.044 E.00742
G1 X146.944 Y116.43 E.0114
G1 X147.092 Y117.01 E.01152
G1 X147.092 Y118.172 E.02241
G1 X108.968 Y118.172 E.73488
; WIPE_START
G1 F12000
M204 S6000
G1 X108.908 Y117.01 E-.4423
G1 X108.925 Y116.819 E-.0727
G1 X108.969 Y116.646 E-.06804
G1 X109.224 Y116.256 E-.17697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.953 Y117.1 Z9.96 F42000
G1 Z9.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.161925
G1 F4583
M204 S6000
G1 X110.048 Y117.048 E.00072
; LINE_WIDTH: 0.199076
G1 X145.826 Y117.04 E.30319
G1 X145.954 Y117.056 E.00109
; LINE_WIDTH: 0.151306
G1 X145.981 Y117.03 E.00023
; LINE_WIDTH: 0.120906
G1 X146.007 Y117.003 E.00018
; CHANGE_LAYER
; Z_HEIGHT: 9.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F21000
G1 X145.981 Y117.03 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/83
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z9.96 I-.086 J-1.214 P1  F42000
G1 X109.473 Y119.606 Z9.96
G1 Z9.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4148
M204 S6000
G1 X146.527 Y119.606 E.76858
G1 X146.527 Y120.381 E.01607
G1 X109.473 Y120.381 E.76858
G1 X109.473 Y119.666 E.01483
M204 S10000
G1 X109.064 Y119.197 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4148
M204 S5000
G1 X146.936 Y119.197 E.73001
G1 X146.936 Y120.79 E.03071
G1 X109.064 Y120.79 E.73001
G1 X109.064 Y119.257 E.02956
; WIPE_START
G1 F12000
M204 S6000
G1 X111.064 Y119.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P95 R1
G1 Z10.08
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.08 F4000
            G39.3 S1
            G0 Z10.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.685 Y119.993 F42000
G1 Z9.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.376312
G1 F4148
M204 S6000
G1 X146.315 Y119.993 E.62782
; WIPE_START
G1 F17115.474
G1 X144.315 Y119.993 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.705 Y119.407 Z10.08 F42000
G1 X109.897 Y117.343 Z10.08
G1 Z9.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4148
M204 S6000
G3 X109.901 Y117.01 I1.802 J-.147 E.00691
G3 X110.048 Y116.897 I.16 J.056 E.00407
G1 X145.865 Y116.897 E.74292
G1 X146.04 Y116.944 E.00376
G3 X146.103 Y117.067 I-.139 J.148 E.00293
G1 X146.103 Y117.343 E.00572
G1 X109.957 Y117.343 E.74974
M204 S10000
G1 X109.473 Y117.767 F42000
G1 F4148
M204 S6000
G1 X109.487 Y116.883 E.01834
G1 X109.627 Y116.627 E.00605
G1 X109.883 Y116.487 E.00605
G1 X110.029 Y116.473 E.00304
G1 X145.92 Y116.473 E.74447
G1 X146.301 Y116.574 E.00817
G1 X146.481 Y116.837 E.00662
G3 X146.527 Y117.029 I-.567 J.236 E.0041
G1 X146.527 Y117.767 E.01532
G1 X109.533 Y117.767 E.76734
M204 S10000
G1 X109.064 Y118.176 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4148
M204 S5000
G1 X109.064 Y117.01 E.02249
G1 X109.094 Y116.747 E.0051
G1 X109.326 Y116.326 E.00926
G1 X109.747 Y116.094 E.00926
G1 X110.01 Y116.064 E.0051
G1 X145.973 Y116.064 E.69321
G1 X146.372 Y116.169 E.00795
G1 X146.48 Y116.197 E.00215
G1 X146.624 Y116.321 E.00367
G1 X146.859 Y116.665 E.00802
G3 X146.936 Y117.01 I-1.019 J.408 E.00684
G1 X146.936 Y118.176 E.02249
G1 X109.124 Y118.176 E.72885
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F12000
M204 S6000
G1 X109.064 Y117.01 E-.44388
G1 X109.094 Y116.747 E-.10058
G1 X109.326 Y116.326 E-.18252
G1 X109.402 Y116.284 E-.03302
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/83
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z10.08 I-1.214 J.086 P1  F42000
G1 X109.638 Y119.61 Z10.08
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4082
M204 S6000
G1 X146.362 Y119.61 E.76173
G1 X146.362 Y120.381 E.01598
G1 X109.638 Y120.381 E.76173
G1 X109.638 Y119.67 E.01474
M204 S10000
G1 X109.229 Y119.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4082
M204 S5000
G1 X146.771 Y119.201 E.72364
G1 X146.771 Y120.79 E.03063
G1 X109.229 Y120.79 E.72364
G1 X109.229 Y119.261 E.02947
; WIPE_START
G1 F12000
M204 S6000
G1 X111.229 Y119.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X109.851 Y119.995 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.372122
G1 F4082
M204 S6000
G1 X146.149 Y119.995 E.61472
; WIPE_START
G1 F17322.517
G1 X144.149 Y119.995 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.54 Y119.406 Z10.2 F42000
G1 X109.974 Y117.347 Z10.2
G1 Z9.8
M73 P95 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4082
M204 S6000
G1 X110.106 Y117.106 E.0057
G1 X110.185 Y117.063 E.00188
G1 X145.859 Y117.063 E.73997
G1 X145.937 Y117.176 E.00286
G1 X145.937 Y117.347 E.00354
G1 X110.034 Y117.347 E.74473
M204 S10000
G1 X109.637 Y117.771 F42000
G1 F4082
M204 S6000
G1 X109.636 Y117.1 E.01393
G3 X109.794 Y116.794 I.972 J.308 E.00717
G3 X110.093 Y116.638 I.604 J.796 E.00702
G1 X145.894 Y116.638 E.74261
G1 X146.143 Y116.726 E.00546
G1 X146.362 Y117.045 E.00803
G1 X146.362 Y117.771 E.01507
G1 X109.697 Y117.771 E.76051
M204 S10000
G1 X109.229 Y118.181 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4082
M204 S5000
G1 X109.227 Y117.031 E.02216
G1 X109.279 Y116.882 E.00305
G1 X109.493 Y116.493 E.00856
G1 X109.882 Y116.279 E.00856
G1 X110.024 Y116.229 E.00291
G1 X145.964 Y116.229 E.69277
G1 X146.405 Y116.384 E.00899
G1 X146.763 Y116.906 E.01221
G1 X146.771 Y118.181 E.02457
G1 X109.289 Y118.181 E.72249
; CHANGE_LAYER
; Z_HEIGHT: 9.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F12000
M204 S6000
G1 X109.227 Y117.031 E-.43743
G1 X109.279 Y116.882 E-.06013
G1 X109.493 Y116.493 E-.16871
G1 X109.709 Y116.374 E-.09373
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/83
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z10.2 I-1.214 J.082 P1  F42000
G1 X109.928 Y119.614 Z10.2
G1 Z9.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3698
M204 S6000
G1 X146.072 Y119.614 E.74971
G1 X146.072 Y120.381 E.0159
G1 X109.928 Y120.381 E.74971
G1 X109.928 Y119.674 E.01465
M204 S10000
G1 X109.519 Y119.205 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3698
M204 S5000
G1 X146.481 Y119.205 E.71247
G1 X146.481 Y120.79 E.03055
G1 X109.519 Y120.79 E.71247
G1 X109.519 Y119.265 E.02939
; WIPE_START
G1 F12000
M204 S6000
M73 P96 R0
G1 X111.519 Y119.262 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.32
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.32 F4000
            G39.3 S1
            G0 Z10.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X110.14 Y119.998 F42000
G1 Z9.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.367932
G1 F3698
M204 S6000
G1 X145.86 Y119.998 E.59759
; WIPE_START
G1 F17534.633
G1 X143.86 Y119.998 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.244 Y119.499 Z10.32 F42000
G1 X109.928 Y117.776 Z10.32
G1 Z9.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3698
M204 S6000
G1 X109.928 Y116.928 E.01758
G1 X145.886 Y116.928 E.74586
G1 X146.072 Y116.999 E.00412
G1 X146.072 Y117.776 E.01612
G1 X109.988 Y117.776 E.74847
M204 S10000
G1 X109.519 Y118.185 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3698
M204 S5000
G1 X109.511 Y116.929 E.02421
G1 X109.659 Y116.659 E.00593
G1 X109.928 Y116.511 E.00592
G1 X109.941 Y116.519 E.00029
G1 X145.961 Y116.519 E.69432
G2 X146.329 Y116.656 I2.781 J-6.909 E.00755
G3 X146.481 Y117.007 I-.887 J.594 E.00742
G1 X146.481 Y118.185 E.02271
G1 X109.579 Y118.185 E.71132
; WIPE_START
G1 F12000
M204 S6000
G1 X109.511 Y116.929 E-.47797
G1 X109.659 Y116.659 E-.11689
G1 X109.928 Y116.511 E-.11669
G1 X109.941 Y116.519 E-.00576
G1 X110.054 Y116.519 E-.04269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.14 Y117.352 Z10.32 F42000
G1 Z9.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448902
G1 F3698
M204 S6000
G1 X145.86 Y117.352 E.73899
; CHANGE_LAYER
; Z_HEIGHT: 10.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14179.37
G1 X143.86 Y117.352 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/83
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 82
M204 S10000
G17
G3 Z10.32 I-.067 J-1.215 P1  F42000
G1 X110.058 Y119.209 Z10.32
G1 Z10.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
M204 S5000
G1 X145.942 Y119.209 E.69169
G1 X145.942 Y120.79 E.03047
G1 X110.058 Y120.79 E.69169
G1 X110.058 Y119.269 E.02931
; WIPE_START
G1 F12000
M204 S6000
G1 X112.058 Y119.266 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.44
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.44 F4000
            G39.3 S1
            G0 Z10.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X145.607 Y120.455 F42000
G1 Z10.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.419992
G1 F3319
M204 S2000
G1 X145.607 Y119.544 E.01755
G1 X110.393 Y119.544 E.67876
G1 X110.393 Y120.455 E.01755
G1 X145.547 Y120.455 E.6776
; WIPE_START
G1 F12000
M204 S6000
G1 X143.547 Y120.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.915 Y120.349 Z10.44 F42000
G1 X110.848 Y120 Z10.44
G1 Z10.04
G1 E.8 F1800
; LINE_WIDTH: 0.542212
G1 F3319
M204 S2000
G1 X145.092 Y120 E.86467
; WIPE_START
G1 F11617.55
M204 S6000
G1 X143.092 Y120 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.471 Y119.582 Z10.44 F42000
G1 X110.058 Y118.189 Z10.44
G1 Z10.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3319
M204 S5000
G1 X110.066 Y117.058 E.0218
G1 X145.942 Y117.06 E.69153
G1 X145.942 Y118.189 E.02176
G1 X110.118 Y118.189 E.69053
M204 S10000
G1 X110.628 Y117.837 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.452777
G1 F3319
M204 S2000
G1 X145.591 Y117.838 E.72997
G1 X145.591 Y117.411 E.0089
G1 X110.415 Y117.41 E.7344
G1 X110.412 Y117.837 E.00893
G1 X110.568 Y117.837 E.00324
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S6000
G1 X110.412 Y117.837 E-.05903
G1 X110.415 Y117.41 E-.16247
G1 X111.833 Y117.41 E-.5385
; WIPE_END
G1 E-.04 F1800
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z10.54 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

M73 P97 R0
    G1 Z110.04 F600
    G1 Z108.04

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

