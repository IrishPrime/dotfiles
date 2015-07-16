#!/bin/bash

ARTIST=$(mpc current -f %artist%)
TRACK=$(mpc current -f %title%)
ALBUM=$(mpc current -f %album%)
CURRENT=$(mpc | awk '/\[/ {print $3}')

notify-send "$ARTIST - $TRACK\n$ALBUM\n$CURRENT\n"
