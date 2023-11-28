#!/bin/bash

# Local variables
KAK_SESSION=$1 KAK_CLIENT=$2

# Working directory for fd defaults to the directory where kakoune was started
# FILENAME=$(fd --type=f --strip-cwd-prefix . | fzf --color=16 --preview 'cat {1}')
FILENAME=$(rg --files --hidden --glob "!.git" . | fzf --color=16 --preview 'cat {1}')

# Only echo a command back if there was a selection
if [ -n "$FILENAME" ]; then
  # Construct the command to pass to kakoune
  KAK_CMD="evaluate-commands -client $KAK_CLIENT edit $FILENAME"

  # Echo the command back to the parent session
  echo "$KAK_CMD" | kak -p "$KAK_SESSION"
  exit 0
fi

exit 0
