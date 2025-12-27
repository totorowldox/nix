#!/usr/bin/env bash

current=$(powerprofilesctl get)

profiles="power-saver
balanced
performance"

choice=$(printf "%s" "$profiles" | \
  vicinae dmenu --placeholder "Current power profile: $current")

[ -n "$choice" ] && powerprofilesctl set "$choice"
