#! /bin/sh
MACHINE=$(hostname)

if [ $MACHINE == 'nixos' ]; then
  xrandr \
    --output "HDMI-1" --auto --primary \
    --output "DVI-D-1" --auto --right-of "HDMI-1" \
    --output "DVI-I-1" --auto --left-of "HDMI-1"
fi

if [ $MACHINE == 'gerkules' ]; then
  xrandr --output "ePD1" --auto --primary
fi
