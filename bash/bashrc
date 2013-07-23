#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

#PS1='\u@\h:\w\$ '
#PS1='\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
PS1='┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─╼ '
#PS1='┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]$(prompt_vcs)\n└─╼ ' # Slow...

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

# Version Control System Prompt Integration
prompt_git() {
	git branch &>/dev/null || return 1
	HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
	BRANCH="${HEAD##*/}"
	[[ -n "$(git status 2>/dev/null | grep -F 'working directory clean')" ]] || STATUS="!"
	printf '(git:%s)' "${BRANCH:-unknown}${STATUS}"
}

prompt_hg() {
	hg branch &>/dev/null || return 1
	BRANCH="$(hg branch 2>/dev/null)"
	[[ -n "$(hg status 2>/dev/null)" ]] && STATUS="!"
	printf '(hg:%s)' "${BRANCH:-unknown}${STATUS}"
}

prompt_svn() {
	svn info &>/dev/null || return 1
	URL="$(svn info 2>/dev/null | awk -F': ' '$1 == "URL" {print $2}')"
	ROOT="$(svn info 2>/dev/null | awk -F': ' '$1 == "Repository Root" {print $2}')"
	BRANCH=${URL/$ROOT}
	BRANCH=${BRANCH#/}
	BRANCH=${BRANCH#branches/}
	BRANCH=${BRANCH%%/*}
	[[ -n "$(svn status 2>/dev/null)" ]] && STATUS="!"
	printf '(svn:%s)' "${BRANCH:-unknown}${STATUS}"
}

prompt_vcs() {
	prompt_git || prompt_svn || prompt_hg
}
