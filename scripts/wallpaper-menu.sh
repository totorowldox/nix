#!/usr/bin/env bash

wall_dir="$HOME/Pictures/Wallpapers/generated"
choice=$(ls "$wall_dir" | vicinae dmenu --placeholder "Select Wallpaper")

if [ -n "$choice" ]; then
    swww img "$wall_dir/$choice" -n niri -t any --transition-duration 1 --transition-fps 60
fi