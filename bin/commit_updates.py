#!/usr/bin/env python3
# from https://github.com/basnijholt/home-assistant-config/blob/master/utils/commit-updates.py

import subprocess
from pathlib import Path

cmd = "git status --porcelain".split()
p = subprocess.run(cmd, capture_output=True).stdout.decode()

ha_version = ".HA_VERSION"
ha_update = False

folders_to_add = set()
for line in p.split("\n"):
    if line.startswith(" M") or line.startswith("??"):
        path = line[3:]

        community = "www/community/"
        if path.startswith(community):
            plugin = path.split("/")[2]
            folders_to_add.add(community + plugin)

        themes = "themes/"
        if path.startswith(themes):
            theme = path.split("/")[1]
            folders_to_add.add(themes + theme)

        hacs = "custom_components/"
        if path.startswith(hacs):
            integration = path.split("/")[1]
            folders_to_add.add(hacs + integration)

        if path == ha_version:
            ha_update = True

for folder in folders_to_add:
    print(folder)
    subprocess.run(f"git add {folder}".split())
    subprocess.run(["git", "commit", "-m", f"Update Dep: {folder} via HACS"])

if ha_update:
    with open(ha_version) as f:
        version = f.read()
    subprocess.run(f"git add {ha_version}".split())
    subprocess.run(["git", "commit", "-m", f"update Home Assistant to {version}"])