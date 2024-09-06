#!/bin/sh

SCREEN_DIR="${HOME}/.screen"

if [ ! -d "${SCREEN_DIR}" ]; then
  notify-send "No screen session directory found!"
  exit 0
fi

selection="$(ls "${SCREEN_DIR}" | rofi -dmenu -p screens)"
[ -n "$selection" ] && alacritty -e screen -r "$selection"
