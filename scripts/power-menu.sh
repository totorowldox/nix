#!/usr/bin/env bash

# [TODO] Implement power-saver when tlp updated to 1.9+

current=$(tlp-stat -s | grep "Mode" | awk -F'= ' '{print $2}' || echo "unknown")

profiles="Performance:ac
Balanced:bat
Auto:start"

choice_label=$(echo "$profiles" | cut -d':' -f1 | vicinae dmenu --placeholder "Current TLP Mode: $current")

[ -z "$choice_label" ] && exit 0

target=$(echo "$profiles" | grep "^$choice_label" | cut -d':' -f2)

pkexec tlp "$target"