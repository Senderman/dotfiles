#!/bin/sh
selection=$(printf "%s\n" poweroff reboot hibernate suspend | dmenu)
[ -n "$selection" ] && loginctl "$selection"
