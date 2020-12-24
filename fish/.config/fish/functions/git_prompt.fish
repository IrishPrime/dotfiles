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
