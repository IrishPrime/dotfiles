#!/bin/bash

STOW_DIR=$(realpath $(dirname ${0}))
TARGET="${HOME}"
ACTION="--stow"
VERBOSE=0
USAGE="Usage: $(basename ${0}) [-t <TARGET_PATH>] [-a <ACTION>] [-n] [-v <VERBOSITY>] [-h]"
HELP="If run with no arguments, quietly attempt to install all files to the user's home directory using GNU stow.
-t <TARGET_PATH>\tPath to install to. Default: \${HOME}
-a <ACTION>\t\tAction to take: -S|--stow|-R|--restow|-D|--delete. Default: --stow
-n\t\t\tDo not actually make any filesystem changes.
-v <VERBOSITY>\t\tVerbosity level, 0..5. Default: 0
-h\t\t\tShow this help.
See Stow's documentation for more on actions."

while getopts "a:t:nv:h" OPT; do
	case $OPT in
		t) TARGET=${OPTARG};;
		a) ACTION=${OPTARG};;
		n) NO="--no";;
		v) VERBOSE=${OPTARG};;
		h|*) echo -e "${USAGE}\n${HELP}"; exit;;
	esac
done

shift $((OPTIND-1))

if ! command -v stow &> /dev/null; then
	echo "Requires GNU stow."
	exit 1;
fi

case $ACTION in
	-[SDR]|--stow|--delete|--restow);;
	*) echo "Action must be one of: -S|--stow|-R|--restow|-D|--delete."; exit 1;;
esac

case $VERBOSE in
	[0-5]);;
	*) echo "Verbosity must be between 0 and 5."; exit 1;;
esac

mkdir -p "${TARGET}"

stow --dir="${STOW_DIR}" --target="${TARGET}" ${NO} --verbose="${VERBOSE}" ${ACTION} */
