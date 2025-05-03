#!/usr/bin/env bash

set -euo pipefail

reset="\033[0m"
red="\033[1;31m"
green="\033[1;32m"
blue="\033[1;34m"
error="${red}error:${reset}"

if [ $EUID -ne 0 ]; then
  echo -e "${error} ${green}setup.sh${reset} must be run as root"
  exit 1
fi

if [ ! -f /tmp/.pkgs_installed ]; then
  echo -e "${error} ${green}install${reset} has not been executed"
  exit 1
fi

PAM_FILE="/etc/pam.d/login"
if ! grep -q "pam_gnome_keyring.so" "$PAM_FILE"; then
  cp $PAM_FILE "${PAM_FILE}.old"
  sed -i "6 i auth       optional     pam_gnome_keyring.so" $PAM_FILE
  echo "session    optional     pam_gnome_keyring.so auto_start" >> $PAM_FILE
  echo -e " ${blue}${PAM_FILE}${reset} updated"
else
  echo -e " ${blue}${PAM_FILE}${reset} already configured"
fi

echo " post-install setup completed"
