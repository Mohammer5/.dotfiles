#!/bin/sh
# On my machine VLC fails to connect to chromecast. If I specify the IP it fails to connect because of certificate errors. I can 
# manually download the certificate but it is only valid for 2 days. This little script gets it all working. 

# Set your ip address below and call this script with the filename.
CHROMECAST_IP=192.168.178.52

gnutls-cli --save-cert=chromecast.pem --insecure $CHROMECAST_IP:8009
mkdir -p ~/.local/share/vlc/certs
mv chromecast.pem ~/.local/share/vlc/certs

vlc "$1" --sout "#chromecast"  --gnutls-dir-trust=/home/$USER  --sout-chromecast-ip=$CHROMECAST_IP --demux-filter=demux_chromecast
