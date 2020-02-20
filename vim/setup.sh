#!/bin/bash

SETUP_NEOVIM=true

if [[ ! -d ~/.config/nvim ]]; then
  echo "The folder ~/.config/nvim does not exist. Do you want to setup neovim anyways?"
  read answer

  if [[ $answer == y* ]]; then
    SETUP_NEOVIM=true
  else
    SETUP_NEOVIM=false
  fi
fi

if [ "$SETUP_NEOVIM" = true ]; then

  echo "Do you want to install starscope (needed for ctags) (y/N)?"
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
          curl -L get.rvm.io > rvm-install
          bash < ./rvm-install
          source $HOME/.bashrc
          rvm install ruby-head
          gem install starscope
	        break
          ;;
        2)
          echo "Your choice doesn't exist"
          ;;
      esac
    done
  fi

  echo "Do you want to install import-js (needed for ctags) (y/N)?"
  read answer

  if [[ $answer == y* ]]; then
    sudo npm i --unsafe-perm -g import-js
  fi

  echo "Do you want to install the_silver_search (needed for :Ag) (y/N)?"
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
          sudo pacman -S the_silver_searcher
	        break
          ;;
        2)
          echo "Your choice doesn't exist"
          ;;
      esac
    done
  fi

  echo "Do you want to install neovim (y/N)?"
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
          sudo pacman -S neovim python2-neovim python-neovim
	        break
          ;;
        2)
          echo "Your choice doesn't exist"
          ;;
      esac
    done
  fi

  mkdir -p ~/.config/nvim 2> /dev/null
  mkdir -p ~/.vim 2> /dev/null
  rm ~/.config/nvim/init.vim 2> /dev/null
  rm -Rf ~/.config/nvim/colors 2> /dev/null
  ln -s ~/.dotfiles/vim/init.vim ~/.config/nvim/init.vim
  ln -s ~/.dotfiles/vim/src/colors ~/.config/nvim/colors
  ln -s ~/.dotfiles/vim/src/ftplugins ~/.config/nvim/ftplugins
  ln -s ~/.config/nvim/ftplugins ~/.vim/ftplugins

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +silent +PlugInstall +qall
fi
