#!/usr/bin/env bash

# enviroment variables
export PATH="${HOME}/.local/bin:${PATH}"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
export GTK_A11Y=none
export NO_AT_BRIDGE=1
export QT_QPA_PLATFORMTHEME=qt5ct

# bind gpg-agent to this TTY if gpg commands are used
export GPG_TTY=$(tty)

# start the ssh-agent in the background
eval `ssh-agent` &>/dev/null

[[ -e ~/.ssh/github ]] && {
  { ssh-add -q ~/.ssh/github } &>/dev/null
}

# autostart X at login
[[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]] && {
  exec startx
}
