#!/bin/bash

SETUP_TMUX=true
TMUX_CONF_DIR="$DOT_FILES/tmux"
TPM_DIR="$HOME/.tmux/plugins/tpm"
TPM_GIT_REPO="https://github.com/tmux-plugins/tpm"

if [ "$SETUP_TMUX" = true ]; then
  rm ~/.tmux.conf 2> /dev/null
  rm -Rf $TMP_DIR 2> /dev/null
  
  ln -s $TMUX_CONF_DIR/tmux.conf $HOME/.tmux.conf
  git clone $TPM_GIT_REPO $TPM_DIR

  tmux source $HOME/.tmux.conf
  tmux start-server
  tmux new-session -d
  $TPM_DIR/scripts/install_plugins.sh
  tmux kill-server
fi
