#!/usr/bin/env bash

# Start some nice programs
[[ -d /etc/X11/xinit/xinitrc.d ]] && {
  for file in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [[ -x $file ]] && . $file
  done
  unset file
}

# Gnome Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Keyboard Layout
setxkbmap us -variant altgr-intl &

# Screensaver
xset -dpms s off &

# Compositor
picom &

# Notification Daemon
wired &

# Apps
discord --start-minimized &

# Start WM
exec qtile start
