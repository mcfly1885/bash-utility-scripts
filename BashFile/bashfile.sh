#!/bin/bash

#script that creates n empty bash files ready to be edit and make them executable.

HASHBANG="#!/bin/bash"

if [[ $# -eq 0 ]]; then
	echo "Error: file name is required!" >&2
	exit 1
fi

for args in $@; do

	if [ -e $args ]; then
		echo "File $args already exists!" >&2
	else
		touch $args
		echo $HASHBANG > $args
		chmod 700 $args
		echo "Bash file $args created"
	fi
done