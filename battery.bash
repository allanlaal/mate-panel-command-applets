#!/bin/bash

# black:
#~ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | sed 's/state://' | sed 's/ //g' | sed 's/discharging/➖/'  | sed 's/fully-charged/➕/' | sed 's/charging/➕/'

# white:
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | sed 's/state://' | sed 's/ //g' | sed 's/discharging/- PLUG DISCONNECTED -/'  | sed 's/fully-charged/+/' | sed 's/charging/+/'
