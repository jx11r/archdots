globalias() {
  # Get last word to the left of the cursor:
  # (z) splits into words using shell parsing
  # (A) makes it an array even if there's only one element
  local word=${${(Az)LBUFFER}[-1]}

  [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]] && {
    zle _expand_alias
    zle expand-word
  }

  zle self-insert
}

zle -N globalias
