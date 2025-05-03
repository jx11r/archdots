#!/usr/bin/env bash

command -v xclip &>/dev/null || exit 1

last_clip=""
while true; do
  content=$(xclip -selection clipboard -o 2>/dev/null)
  if [[ "$content" != "$last_clip" && -n "$content" ]]; then
    last_clip="$content"
    echo -n "$last_clip" | xclip -selection clipboard -i
  fi
  sleep 1
done
