#!/bin/bash

SETUP_BASHRC=true

if [ "$SETUP_BASHRC" = true ]; then
  source ./src/env_vars.sh
  rm ~/.bashrc 2> /dev/null
  ln -s ~/.dotfiles/bashrc/bashrc ~/.bashrc
fi
