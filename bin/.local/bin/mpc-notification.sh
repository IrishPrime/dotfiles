#!/bin/bash

ARTIST=$(mpc current -f %artist%)
TRACK=$(mpc current -f %title%)
ALBUM=$(mpc current -f %album%)
CURRENT=$(mpc | awk 'NR==2 {print $3}')
PROGRESS=$(mpc | awk -F '[()]' 'NR==2 {print $(NF-1)}' | tr -d '%')

notify-send -a mpc -c applications-multimedia -u normal "${TRACK}" "${ARTIST} - ${ALBUM}\n${CURRENT}" -h int:value:${PROGRESS}
