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
