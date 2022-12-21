#!/usr/bin/env bash

packages="$(cat list.txt | sed 's/#.*//')"
flags='--nocleanmenu --nodiffmenu --noeditmenu --removemake --noconfirm'

yay -S $packages $flags
