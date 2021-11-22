#!/bin/sh

/usr/bin/setxkbmap -print | /usr/bin/awk -F"+" '/xkb_symbols/ {print $2}'
