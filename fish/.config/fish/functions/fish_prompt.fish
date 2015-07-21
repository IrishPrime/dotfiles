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
	set -l branch (git rev-parse --abbrev-ref HEAD ^&-)
	if test -z $branch
		return
	end

	if [ $tty = tty ]
		echo -n '-'
	else
		echo -n '─'
	end

	set_color -o $argv
	echo -n '['
	set_color normal
	__fish_git_prompt | sed "s;\ (\(.*\));\1;"
	set_color -o $argv
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

	set_color -o $retc
	echo -n '['

	if [ $USER = root ]
		set_color -o red
	else
		set_color -o green
	end

	echo -n $USER
	set_color -o white
	echo -n @

	if [ -z "$SSH_CLIENT" ]
		set_color -o blue
	else
		set_color -o cyan
	end

	echo -n (hostname)
	set_color -o white
	#echo -n :(prompt_pwd)
	echo -n :(pwd|sed "s;$HOME;~;")
	set_color -o $retc
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

	echo
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
