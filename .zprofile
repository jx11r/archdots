#!/usr/bin/env bash

# enviroment variables
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export PATH="$HOME/.local/bin:$PATH"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export GTK_A11Y=none
export QT_QPA_PLATFORMTHEME=qt5ct

# start ssh-agent and add key if available
eval "$(ssh-agent)" &>/dev/null

if [[ -e ~/.ssh/key ]]; then
  ssh-add -q ~/.ssh/key &>/dev/null
fi

# autostart X on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec startx
fi
