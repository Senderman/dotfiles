#!/bin/sh

TS="$(date +%s)"
DEFAULT_DB="${HOME}/.s6/rc/compiled"
LIVE_DIR="/run/user/$(id -u)/s6/s6-rc"
NEW_DB="${HOME}/.s6/rc/compiled-$TS"
SOURCES="${HOME}/.s6/sv"

echo "Compiling new database to ${NEW_DB}..."
s6-rc-compile "$NEW_DB" "$SOURCES"
result=$?
if [ "$result" -ne 0 ]; then
    echo "Failed to compile database!"
    exit 1
fi

echo "Switching to the new database..."
s6-rc-update -l "$LIVE_DIR" "$NEW_DB"
rm "$DEFAULT_DB" 2>/dev/null
ln -s "$NEW_DB" "$DEFAULT_DB"
echo "Switched to the new database!"
