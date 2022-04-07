#!/bin/sh

# Keyboard layout
# setxkbmap us -variant altgr-intl
setxkbmap latam

# Screensaver
xset -dpms s off

# Compositor
picom &

# Start WM
exec qtile start