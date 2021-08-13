#!/usr/bin/zsh

# Script to show system info (battery, volume, date, kb layout, etc) in DWM bar

layout(){
    t=$(xset -q | grep LED)
    [[ "${t##*mask:  }" == "00000000" ]] && echo EN || echo RU
}

fdate(){
    date +"%x %H:%M"
}

bat(){
    cat /sys/class/power_supply/BAT0/capacity
}

volume(){
    v=$(pamixer --get-volume-human)
    [[ $v == "muted" ]] && echo OFF || echo $v
}

light(){
    xbacklight -get
}

fnet(){
	nmout=$(nmcli -t -f NAME,TYPE con show --active)
	conn=$( echo "$nmout" | grep ethernet)
	if [[ "$conn" != "" ]]; then
		act_conn="Eth"
	else
		conn=$( echo "$nmout" | grep wireless)
		if [[ "$conn" != "" ]]; then
			act_conn="${conn%:*}"
		else
			act_conn="No conn"
		fi
	fi
	echo $act_conn
}

nowplaying(){
	v=$(playerctl metadata)
	art=$(echo "$v" | grep "xesam:artist")
	art=$(echo ${art#*xesam:artist} | xargs)
	title=$(echo $v | grep "xesam:title")
	title=$(echo ${title#*xesam:title} | xargs)
	echo "$art - $title"
}

generate_content(){
	echo "▶️$(nowplaying)|📶$(fnet)|🔆$(light)%|🔈$(volume)|🔋$(bat)%|🏳️$(layout)|$(fdate)"
}

while true; do
    xsetroot -name "$(generate_content)"
    sleep 1m
done

