function sudo
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo -E $argv
	end
end
