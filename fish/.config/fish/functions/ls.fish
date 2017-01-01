# Make ls use colors if we are on a system that supports this
if command ls --version 1>/dev/null 2>/dev/null
	# This is GNU ls
	function ls --description "List contents of directory"
		set -l param --color=auto --group-directories-first --quoting-style=literal --human-readable
		command ls $param $argv
	end

	if not set -q LS_COLORS
		if type -f dircolors >/dev/null
			eval (dircolors -c)
		end
	end

else
	# BSD, OS X and a few more support colors through the -G switch instead
	if command ls -G / 1>/dev/null 2>/dev/null
		function ls --description "List contents of directory"
			command ls -G $argv
		end
	end
end
