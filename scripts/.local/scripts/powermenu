#!/bin/sh

action=$(fuzzel -d --mesg "Power menu" --nth-delimiter=',' --with-nth=1 --accept-nth=2 << EOF
S6   Stop S6 usertree,usertree tear
󰒲    Suspend to RAM,loginctl suspend
󰑓    Reboot,loginctl reboot
󰐥    Power off,loginctl poweroff
EOF
)

[ -n "$action" ] || exit
$action

