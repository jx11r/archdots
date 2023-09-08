#!/usr/bin/env bash

# start some nice programs
[[ -d /etc/X11/xinit/xinitrc.d ]] && {
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [[ -x $f ]] && . $f
  done
  unset f
}

# authentication agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# screensaver
xset -dpms s off &

# keyboard layout
setxkbmap us -variant colemak

# ensure numlock is active
numlockx on &

# system tray applet
nm-applet &

# X compositor
picom &

# notification daemon
wired &

# start wm
exec qtile start
