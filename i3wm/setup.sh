#!/bin/bash

SETUP_I3=true

if [[ ! -d ~/.config/i3 ]]; then
  echo "The folder ~/.config/i3 does not exist. Do you want to setup i3 anyways?"
  read answer

  if [[ $answer == y* ]]; then
    SETUP_I3=true
  else
    SETUP_I3=false
  fi
fi

if [ "$SETUP_I3" = true ]; then
  mkdir ~/.config/i3 2> /dev/null
  rm ~/.i3/config 2> /dev/null
  ln -s ~/.dotfiles/i3wm/config ~/.i3/config
  i3-msg reload
fi
