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
