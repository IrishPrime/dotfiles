#!/usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Colorize files
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

# enable completion with commands
complete -cf sudo
complete -cf man


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# Make colors easier
BLUE='\[\e[34m\]'
GREEN='\[\e[32m\]'
RED='\[\e[31m\]'
YELLOW='\[\e[33m\]'
RESET='\[\e[0m\]'

export EDITOR=vim
export VISUAL='gvim -f'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Git prompt
if [ -f ~/.local/bin/git-prompt.sh ]; then
	. ~/.local/bin/git-prompt.sh
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM='verbose'
	GIT_PS1_DESCRIBE_STYLE='tag'
	GIT_PS1_SHOWCOLORHINTS=1
fi

prompt() {
	local EXITSTATUS="$?"

	if [[ $EXITSTATUS == 0 ]]; then
		STATUSCOLOR=${GREEN}
	else
		STATUSCOLOR=${RED}
	fi

	if [[ $(whoami) == 'root' ]]; then
		USERCOLOR=$RED
		USERCHAR='#'
	else
		USERCOLOR=$GREEN
		USERCHAR='$'
	fi

	echo "┌─${STATUSCOLOR}[${USERCOLOR}\u${RESET}@${BLUE}\h${RESET}:\w${STATUSCOLOR}]${RESET}"
}
PROMPT_COMMAND='__git_ps1 "$(prompt)" "\n└─╼ "'
