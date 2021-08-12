#!/usr/bin/bash

bat_device=BAT0
crit_lvl=30
bat_capacity_file=/sys/class/power_supply/$bat_device/capacity

while true; do
	cpc=$(cat $bat_capacity_file)
	if [[ $cpc -le $crit_lvl ]]; then
		notify-send -u critical "Низкий заряд батареи" "Подключите зарядное устройство"
	fi
	sleep 5m
done
