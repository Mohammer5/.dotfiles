#!/bin/bash

i3-msg "exec spotify"
i3-msg "exec telegram"

i3-msg "workspace 1:Chats, move workspace to output DVI-I-1" &&\
i3-msg "workspace 2, move workspace to output HDMI-0" &&\
i3-msg "workspace 3, move workspace to output DVI-D-0" &&\
i3-msg "workspace 0:Spotify, move workspace to output DVI-I-1"

i3-msg "workspace 2;"
