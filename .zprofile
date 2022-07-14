#!/usr/bin/env bash

[[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]] && {
  exec startx
}
