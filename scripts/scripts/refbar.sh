#!/usr/bin/bash

# Use this script to refresh DWM bar from bar.sh. Useful in keybindigs which change volume/locale/brightness/any info in the bar

# look for sleep running inside bar.sh and kill it
pid=$(pstree -lp | grep -- -bar.sh)
pid=${pid##*bar.sh\(*sleep\(}
pid=${pid%\)}
kill $pid

