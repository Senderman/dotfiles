#!/bin/sh
if [ ! -d "/run/screens/S-${USER}" ]; then
  notify-send "No screen session directory found!"
  exit 0
fi

selection="$(ls "/run/screens/S-${USER}" | rofi -dmenu -p screens)"
[ -n "$selection" ] && alacritty -e screen -r "$selection"
