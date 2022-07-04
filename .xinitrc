#!/bin/sh

# Keyboard layout
# setxkbmap us -variant altgr-intl
setxkbmap latam

# Screensaver
xset -dpms s off

# Compositor
picom &

# Notification Daemon
wired &

# Start WM
exec qtile start
