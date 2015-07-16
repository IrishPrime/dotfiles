function la --description "List contents of directory, including hidden files in directory using long format"
	set -l param --almost-all --human-readable
	ls $param $argv
end
