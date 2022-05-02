#!/bin/sh

# This script makes it possible to combine any program audio output and mic input into one output device. Useful for streaming games

# Set this variable to your output device name from pacmd list
outdev=alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo

pacmd load-module module-null-sink sink_name=game
pacmd load-module module-loopback sink=game
pacmd load-module module-combine-sink slaves=game,$outdev
echo 'Setup:'
echo 'Playing: Games sound -> combined sink'
echo 'Record: Loopback to null from mic'
echo 'Record: Discord input from monitor of null sink'
