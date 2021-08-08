#!/usr/bin/bash

# Use this script to kill DWM bar from bar.sh. Useful when using DWM with display manager which does not terminate all user processes at logout

# look for running bar.sh and kill it
pid=$(pstree -lp | grep -- -bar.sh)
pid=${pid##*bar.sh\(}
pid=${pid%%\)*}
kill $pid
