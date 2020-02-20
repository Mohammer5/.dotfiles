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

  rm -f ~/.gitconfig ~/.gitignore_global
  ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
fi
