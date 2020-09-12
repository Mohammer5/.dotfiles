#! /bin/sh

MACHINE=$(hostname)

if [ $MACHINE == 'nixos' ]; then
  CENTER="HDMI-0"
  RIGHT="DVI-I-1"
  LEFT="DVI-D-0"

  xrandr --output $CENTER --auto --primary --brightness 0.6
  xrandr --output $RIGHT --auto --left-of $CENTER --brightness 0.6
  xrandr --output $LEFT --auto --right-of $CENTER --brightness 0.6
else
  # absolute path of this file
  LOCATION="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

  echo "Monitor setup does not exist for host with name '$MACHINE'"
  echo "Please edit '$LOCATION/monitor_setup.sh'"
fi
