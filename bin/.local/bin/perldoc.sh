#!/usr/bin/env bash

SEARCH_TERM="$1"

if [ -z "${SEARCH_TERM}" ]; then
	echo "no search term"
	exit 1
fi

if echo ${SEARCH_TERM} | grep -q "::"; then
	perldoc ${SEARCH_TERM}
else
	perldoc -f ${SEARCH_TERM}
fi
