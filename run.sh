#!/bin/sh

# exit if something fails
set -e

{
	EVAL_PATH="$PWD"
	TREX_PATH="./TRex"

	# clone the library repo if not done already
	if [ ! -d "$TREX_PATH" ]; then
		git clone "https://github.com/deib-polimi/TRex.git" "$TREX_PATH"
	fi

	cd "$TREX_PATH"
	git fetch
	if [ -z "$1" ]; then
		git checkout origin/master
	else
		git checkout "$1"
	fi
	cd "./TRex2-lib"
	autoreconf --install
	./configure
	make clean
	make

	cd $EVAL_PATH
	export TREX_PATH
	make clean
	make
} 1>&2
make run
