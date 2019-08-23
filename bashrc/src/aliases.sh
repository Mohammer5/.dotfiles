#!/bin/bash

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls="ls --color=auto"
fi

alias b-source="source ~/.bashrc"

# Dir navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

alias d="cd ~/.dotfiles"
alias x="cd ~/development"
alias xm="cd $DEV_DIR/market-maker-bot"
alias xmc="cd $DEV_DIR/market-maker-client"
alias xml="cd $DEV_DIR/market-maker-lib"

alias xd="cd ~/development/dhis2"
alias xdi="cd ~/development/dhis2/import-export-app"
alias xdm="cd ~/development/dhis2/maintenance-app"
alias xdn="cd ~/development/dhis2_notes"
alias xdr="cd ~/development/dhis2/reports-app"
alias xduc="cd ~/development/dhis2/ui-core"
alias xduw="cd ~/development/dhis2/ui-widgets"
alias xduf="cd ~/development/dhis2/ui-forms"
alias xdoom="cd ~/development/dhis2/project-doom"

BROWSER_NO=BROWER=NO

function yarnfpn () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://functionalprogramming.ninja
  CONFIG=DHIS2_HOME=$DHIS2_HOME
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

function yarn33 () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://play.dhis2.org/dev
  CONFIG=DHIS2_HOME=$DHIS2_HOME_PLAY_33
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

function yarn32 () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://play.dhis2.org/2.32dev
  CONFIG=DHIS2_HOME=$DHIS2_HOME_PLAY_32
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

function yarn31 () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://play.dhis2.org/2.31dev
  CONFIG=DHIS2_HOME=$DHIS2_HOME_PLAY_31
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

function yarn30 () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://play.dhis2.org/2.30
  CONFIG=DHIS2_HOME=$DHIS2_HOME_PLAY_30
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

function yarn29 () {
  PLAY_DEV_URL=REACT_APP_DHIS2_BASE_URL=https://play.dhis2.org/2.29
  CONFIG=DHIS2_HOME=$DHIS2_HOME_PLAY_29
  env "$BROWSER_NO" env "$CONFIG" env "$PLAY_DEV_URL" bash -c 'yarn start'
}

# Dir info
alias ll='ls -Flh --group-directories-first'

# System Info
alias df='df -h'                             # human-readable sizes
alias freem='free -m'                        # show sizes in MB

# Applications
alias g="git"
alias tmux-source="tmux source ~/.tmux.conf"

# Helpers
alias wrep="grep -Iwrm 1 --color"

# Displays
MAIN_SCREEN="eDP1"
alias h1onr="sudo xrandr --output HDMI1 --auto --right-of $MAIN_SCREEN"
alias h1onl="sudo xrandr --output HDMI1 --auto --left-of $MAIN_SCREEN"
alias h1off="sudo xrandr --output HDMI1 --off"

# connect to functionalprogramming.ninja
# @param $1 username
function sshfpn () { ssh $1@87.230.14.248; }

# copy to functionalprogramming.ninja
# @param $1 username
# @param $2 client-file
# @param $3 target-location
function scpfpn () { ssh $2 $1@87.230.14.248:$3; }

# function setExternalSoundCardAsOutput() {
#   number=$(cat /proc/asound/cards | grep "USB-Audio - Scarlett 2i2 USB" | cut -c2)
#   sudo sed -i -e "s/[0-9]/$number/g" /etc/asound.conf
#   pulseaudio -k && sudo alsa force-reload
# }

# Replace all occurrences
# WARNING! Escape regex special chars
# WARNING! Don't replace if .git folder is inside the dir!!!
#
# @param $1 directory
# @param @2 string to be replaced
# @param @3 string to replace with
function replaceRecursively() { find $1 -type f -print0 | xargs -0 sed -i "s/$2/$3/g"; }

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
