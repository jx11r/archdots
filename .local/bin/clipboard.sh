#!/usr/bin/env bash

command -v xclip &>/dev/null || exit 1

last_clip=""
while true; do
  content=$(xclip -selection clipboard -o 2>/dev/null)

  # skip if content is empty, null, or hasn't changed
  if [[ "$content" == "$last_clip" || -z "$content" || "$content" == *$'\0'* ]]; then
    sleep 1
    continue
  fi

  # skip if content looks like a file path list
  if echo "$content" | grep -qE '^/.*(\n|$)' <<< "$content"; then
    sleep 1
    continue
  fi

  last_clip="$content"
  echo -n "$last_clip" | xclip -selection clipboard -i
  sleep 1
done
