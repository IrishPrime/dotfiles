#!/bin/bash

export SXHKD_SHELL="/bin/bash"
export TERMINAL="termite"
export EDITOR="vim"
export VISUAL="gvim -f"
export SUDO_EDITOR="vim"
export BROWSER="chromium"
export CALCULATOR="${TERMINAL} -e calc"
export FILE_BROWSER="pcmanfm"
export IM_CLIENT="google-hangouts.sh"
export IRC_CLIENT="hexchat"
export MAIL_CLIENT="${TERMINAL} -e mutt"
export MUSIC_PLAYER="google-music.sh"
export VIRTUALIZATION="virt-manager"

export PATH=$PATH:~/.local/bin/:

# Avoid errors about the accessibility bus
export NO_AT_BRIDGE=1

# Source unversioned local customizations if they exist
if [ -f .profile.local ]; then
	source .profile.local
fi
