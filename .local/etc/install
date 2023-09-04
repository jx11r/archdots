#!/usr/bin/env bash

packages="$(cat pkgs.txt | sed 's/#.*//')"
flags='--nocleanmenu --nodiffmenu --noeditmenu --removemake --noconfirm'

yay -S $packages $flags
