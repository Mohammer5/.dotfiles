#!/bin/bash

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium

# Development
export DEV_DIR=$HOME/development
export DEV_DIR_DHIS2=$DEV_DIR/dhis2
export FZF_DEFAULT_COMMAND='ag -g ""'

# dhis2
BROWSER_DEFAULT=NO

export DHIS2_PLAY_BASE_URL=https://debug.dhis2.org
export PLAY_DEV_PATH=dev
export PLAY_33_PATH=2.33dev
export PLAY_32_PATH=2.32dev
export PLAY_31_PATH=2.31dev
export PLAY_30_PATH=2.30
export PLAY_29_PATH=2.29

export DHIS2_HOME=$HOME/.dotfiles/dhis2
export DHIS2_HOME_FPN=$DHIS2_HOME
export DHIS2_HOME_PLAY_DEV=$HOME/.dotfiles/dhis2/play
export DHIS2_HOME_PLAY_33=$HOME/.dotfiles/dhis2/play-2.33
export DHIS2_HOME_PLAY_32=$HOME/.dotfiles/dhis2/play-2.32
export DHIS2_HOME_PLAY_31=$HOME/.dotfiles/dhis2/play-2.31
export DHIS2_HOME_PLAY_30=$HOME/.dotfiles/dhis2/play-2.30
export DHIS2_HOME_PLAY_29=$HOME/.dotfiles/dhis2/play-2.29

source $DOT_FILES/bashrc/src/env_vars/dhis.server-env.sh
source $DOT_FILES/bashrc/src/env_vars/dhis.d2-ui.env.sh
