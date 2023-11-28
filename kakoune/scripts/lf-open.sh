#!/bin/bash

# Local variables
KAK_BUFFILE=$1 KAK_SESSION=$2 KAK_CLIENT=$3

# Create temporary file for selection
LF_TMP=$(mktemp)

# Get working directory of current buffer
KAK_PWD=$(dirname "${KAK_BUFFILE}")

# Pick a file with lf
lf -selection-path "${LF_TMP}" "${KAK_PWD}"

# Get first line of selection file
FILENAME=$(head -n 1 "${LF_TMP}")

# Only echo a command back if there was a selection
if [ -n "$FILENAME" ]; then
  # Construct the command to pass to kakoune
  KAK_CMD="evaluate-commands -client $KAK_CLIENT edit $FILENAME"

  # Echo the command back to the parent session
  echo "$KAK_CMD" | kak -p "$KAK_SESSION"
fi
