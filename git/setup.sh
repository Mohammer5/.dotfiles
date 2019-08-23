#!/bin/bash

TMP="/tmp"
SETUP_GIT=true

if [ "$SETUP_GIT" = true ]; then
  echo "Do you want to install fzf (needed for some aliases) (y/N)?"
  read answer

  if [[ $answer == y* ]]; then
    while :
    do
      echo "Choose your platform"
      echo "Arch: 1"
      echo "Don't install: 0"
      read platform

      case $platform in
        0)
      	  break
          ;;
        1)
          sudo pacman -S fzf
	        break
          ;;
        2)
          echo "Your choice doesn't exist"
          ;;
      esac
    done
  fi

  rm ~/.gitconfig 2> /dev/null
  ln -s $DOT_FILES/git/.gitconfig ~/.gitconfig
  
  # install gtm
  curl -Lo $TMP/gtm.tar.gz https://github.com/git-time-metric/gtm/releases/download/v1.3.5/gtm.v1.3.5.linux.tar.gz
  tar -xvzf $TMP/gtm.tar.gz -C $TMP
  mkdir $HOME/bin 2> /dev/null
  cp $TMP/gtm $HOME/bin/
fi
