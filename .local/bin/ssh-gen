#!/bin/sh

reset="\033[0m"
yellow="\033[1;33m"

echo -ne "${yellow}Insert your email address: ${reset}"
read email

mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "$email"
