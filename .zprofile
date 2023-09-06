#!/usr/bin/env bash

# enviroment variables
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export PATH="$HOME/.local/bin:$PATH"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_A11Y=none
export NO_AT_BRIDGE=1
export QT_QPA_PLATFORMTHEME=qt5ct

# start the ssh-agent in the background
eval `ssh-agent` &>/dev/null

[[ -e ~/.ssh/github ]] && {
  { ssh-add -q ~/.ssh/github } &>/dev/null
}

# autostart X at login
[[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]] && {
  exec startx
}
