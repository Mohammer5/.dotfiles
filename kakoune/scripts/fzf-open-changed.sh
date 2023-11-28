#!/bin/bash

log_error() {
  local message=$1

  # Construct the command to pass to kakoune
  local kak_cmd="evaluate-commands -client $KAK_CLIENT echo -markup \"{Error}${message}\""

  # Echo the command back to the parent session
  echo "$kak_cmd" | kak -p "$KAK_SESSION"
}

# Local variables
KAK_SESSION=$1 KAK_CLIENT=$2

# Exit if command fails
if ! IS_REPO=$(git rev-parse --is-inside-work-tree); then
  log_error 'Could not run git rev-parse'
  exit 1
fi

# Exit if not in git repo
if [ "$IS_REPO" = false ]; then
  log_error 'Not in a git repo'
  exit 1
fi

# Get changed files
if ! FILES=$(git status --short --no-rename | awk -F ' ' '{print $2}'); then
  log_error 'Could not find changed files'
  exit 1
fi

if [ -z "$FILES" ]; then
  log_error 'No changed files found'
  exit 1
fi

# Pick a file
FILENAME=$(echo "$FILES" | fzf --color=16 --preview 'cat {1}')

# Only echo a command back if there was a selection
if [ -n "$FILENAME" ]; then
  # Construct the command to pass to kakoune
  KAK_CMD="evaluate-commands -client $KAK_CLIENT edit $FILENAME"

  # Echo the command back to the parent session
  echo "$KAK_CMD" | kak -p "$KAK_SESSION"
fi
