#!/usr/bin/zsh

# Some more ls aliases
alias ls='ls --color=auto --group-directories-first --human-readable --quoting-style=literal'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colorize diff output
alias diff='colordiff'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Preserve environment in sudo
alias sudo='sudo -E'

# Local mutt
alias mutt.local='mutt -f $MAIL'
