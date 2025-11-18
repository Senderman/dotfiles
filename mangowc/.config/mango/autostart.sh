#!/bin/sh

s6-rc -l /run/user/$(id -u)/s6/s6-rc start wayland-bundle

