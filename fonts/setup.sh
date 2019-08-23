#!/bin/bash

echo "Do you want to install Meslo nerd font (y/N)?"
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
        sudo cp $DOT_FILES/fonts/ttf/Meslo\ LG\ M\ Regular\ Nerd\ Font\ Complete\ Mono.ttf /usr/share/fonts/TTF/
        fc-cache -fv
        echo "You will have to restart your terminal to be able to choose the font"
        break
        ;;
      2)
        echo "Your choice doesn't exist"
        ;;
    esac
  done
fi
