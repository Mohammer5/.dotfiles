#!/bin/bash

# Local variables
KAK_SESSION=$1 KAK_CLIENT=$2

# Get remaining arguments
shift 2

# Appends 'modified' symbol to buffer names
print_buffers() {
  for BUFFER in "$@"; do
    FILENAME=${BUFFER%_*}
    MODIFIED=${BUFFER##*_}

    if [ "$MODIFIED" = "true" ]; then
      MODIFIED_SYMBOL=' [+]'
    else
      MODIFIED_SYMBOL=''
    fi

    echo "$FILENAME$MODIFIED_SYMBOL"
  done
}

# Pick from list of open buffers
SELECTION=$(print_buffers "$@" | fzf --color=16)

# Only echo a command back if there was a selection
if [ -n "$SELECTION" ]; then
  # Remove any 'modified' symbols from selection
  FILENAME=${SELECTION% *}

  # Construct the command to pass to kakoune
  KAK_CMD="evaluate-commands -client $KAK_CLIENT edit $FILENAME"

  # Echo the command back to the parent session
  echo "$KAK_CMD" | kak -p "$KAK_SESSION"
fi
