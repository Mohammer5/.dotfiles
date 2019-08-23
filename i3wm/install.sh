#!/bin/bash
#
# This script should be executed with `sudo`
# Don't run this script as root user!
#

# install required packages for i3
apt install i3 network-manager-gnome feh dunst scrot arandr -y

# install required packages for multimedia keyboard keys
cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb
dpkg -yi playerctl-0.6.1_amd64.deb

# create symlink for config
rm $HOME/.config/i3/config 2>/dev/null
ln -s ./config $HOME/.config/i3/config
