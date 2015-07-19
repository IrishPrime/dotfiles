#!/bin/bash

notify-send -u normal "Battery" "$(acpi -b | sed 's/Battery [[:digit:]]\+: //')"
