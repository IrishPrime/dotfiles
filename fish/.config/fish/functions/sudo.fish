function sudo
	if test "$argv" = "!!"
		eval command sudo $history[1]
	else if test "$argv" = "-i"
		command sudo -i
	else
		command sudo -E $argv
	end
end
