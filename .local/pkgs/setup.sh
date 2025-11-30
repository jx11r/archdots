#!/usr/bin/env bash

set -euo pipefail

reset="\033[0m"
red="\033[1;31m"
green="\033[1;32m"
blue="\033[1;34m"
error="${red}error:${reset}"

if [ ! -f /tmp/.pkgs_installed ]; then
  echo -e "${error} ${green}install${reset} has not been executed"
  exit 1
fi

PAM_FILE="/etc/pam.d/login"
if ! grep -q "pam_gnome_keyring.so" "$PAM_FILE"; then
  sudo cp --preserve=all $PAM_FILE "${PAM_FILE}.bk"
  sudo sed -i "5i auth       optional     pam_gnome_keyring.so" $PAM_FILE
  sudo sed -i "8i session    optional     pam_gnome_keyring.so auto_start" $PAM_FILE
  echo -e " ${blue}${PAM_FILE}${reset} updated"
else
  echo -e " ${blue}${PAM_FILE}${reset} already configured"
fi

echo " building bat cache..."
bat cache --build

echo " changing default shell to zsh..."
sudo chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh

echo " post-install setup completed"
