#!/usr/bin/env bash

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [[ -x $f ]] && . $f
  done
  unset f
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# TODO: fix issues with thunar
# ~/.local/bin/clipboard.sh &

setxkbmap us -variant altgr-intl &
picom &
wired &

exec qtile start
