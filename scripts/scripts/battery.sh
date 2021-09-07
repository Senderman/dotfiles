#!/bin/sh

bat_device=BAT0
ac_device=AC
crit_lvl=30
power_supply=/sys/class/power_supply
bat_capacity_file=$power_supply/$bat_device/capacity
ac_online_file=$power_supply/$ac_device/online

while true; do
	bat_lvl=$(cat $bat_capacity_file)
	ac_on=$(cat $ac_online_file)
	if [ "$ac_on" -eq 0 ] && [ "$bat_lvl" -le "$crit_lvl" ]; then
		notify-send -u critical 'Low battery!' 'Please, plug in the charger!'
	fi
	sleep 5m
done
