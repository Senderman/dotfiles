#!/bin/sh

layout="$(mmsg get layouts | jq -r '.layouts[] | .symbol + "\t" + .name' | fuzzel -d --mesg 'Select layout' --accept-nth=2)"
mmsg dispatch "setlayout,${layout}"
