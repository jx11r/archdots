#!/usr/bin/env bash

# start some nice programs
[[ -d /etc/X11/xinit/xinitrc.d ]] && {
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [[ -x $f ]] && . $f
  done
  unset f
}

# keyboard layout
setxkbmap us -variant altgr-intl &

# screensaver
xset -dpms s off &

# compositor
picom &

# notification daemon
wired &

# ensure numlock is active
numlockx on &

# start wm
exec qtile start
