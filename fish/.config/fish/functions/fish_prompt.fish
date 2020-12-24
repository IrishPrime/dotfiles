# name: Irish
# author: Guilhem "Nim" Saurel − https://github.com/nim65s/dotfiles/
# modified: Michael "Irish" O'Neill

function clock_prompt
	set_color normal
	if [ $tty = tty ]
		echo -n '-'
	else
		echo -n '─'
	end
	set_color -o $argv[1]
	echo -n '['
	set_color normal
	set_color $argv[1]
	echo -n (date +%X)
	set_color -o $argv[1]
	echo -n ']'
end

function git_prompt
	set_color normal
	set -l branch (git rev-parse --is-inside-work-tree 2>/dev/null)
	if test -z $branch
		return
	end

	if [ $tty = tty ]
		echo -n '-'
	else
		echo -n '─'
	end

	set_color $argv
	echo -n '['
	set_color normal
	fish_git_prompt | sed "s;\ (\(.*\));\1;"
	set_color $argv
	echo -n ']'
end

function python_venv_prompt
	set_color normal
	if test -z $VIRTUAL_ENV
		return
	end

	if [ $tty = tty ]
		echo -n '-'
	else
		echo -n '─'
	end

	set_color $argv
	echo -n '['
	set_color normal
	echo -n (basename $VIRTUAL_ENV)
	set_color $argv
	echo -n ']'
end

function fish_prompt
	and set retc green; or set retc red
	set_color normal

	if [ $tty = tty ]
		echo -n '.-'
	else
		echo -n '┌─'
	end

	set_color $retc
	echo -n '['

	if [ $USER = root ]
		set_color red
	else
		set_color green
	end

	echo -n $USER
	set_color white
	echo -n @

	if [ -z "$SSH_CLIENT" ]
		set_color blue
	else
		set_color cyan
	end

	echo -n (hostnamectl --static)
	set_color white
	#echo -n :(prompt_pwd)
	echo -n :(pwd|sed "s;$HOME;~;")
	set_color $retc
	echo -n ']'
	set_color normal

	# ACPI Support
	# Check if acpi exists
	if not set -q __fish_nim_prompt_has_acpi
		if type acpi > /dev/null
			set -g __fish_nim_prompt_has_acpi ''
		else
			set -g __fish_nim_prompt_has_acpi '' # empty string
		end
	end

	if test -n $__fish_nim_prompt_has_acpi
		if [ (acpi -a 2> /dev/null | grep off) ]
			echo -n '─['
			set_color -o red
			echo -n (acpi -b|cut -d' ' -f 4-)
			set_color -o green
			echo -n ']'
		end
	end

	# Clock
	#clock_prompt $retc

	# Git integration
	git_prompt $retc

	# Python Virtual Env
	python_venv_prompt $retc

	echo # Start the second line
	set_color normal
	for job in (jobs)
		set_color $retc
		if [ $tty = tty ]
			echo -n '; '
		else
			echo -n '│ '
		end
		set_color brown
		echo $job
	end

	set_color normal
	if [ $tty = tty ]
		echo -n "`->"
	else
		echo -n '└─╼'
	end

	set_color -o red
	echo -n ' '
	set_color normal
end
