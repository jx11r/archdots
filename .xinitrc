#!/usr/bin/env bash

# system scripts
if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [[ -x $f ]] && . $f
  done
  unset f
fi

# deamons & apps
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
nm-applet &
picom &
wired &

# keyboard layout
setxkbmap us -variant altgr-intl

# monitor setup
if [[ -n $SCREENLAYOUT ]]; then
  xrandr --output DP-3 --primary --pos 0x0 --rotate normal
  xrandr --output HDMI-1 --right-of DP-3 --rotate normal
  xdotool mousemove 100 100
fi

# start wm
exec awesome
