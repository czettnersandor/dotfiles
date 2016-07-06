#!/bin/bash

shopt -s nullglob
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/anim

while true; do
    files=()
    for i in *.gif *.png; do
	[[ -f $i ]] && files+=("$i")
	feh --bg-center $i --no-fehbg
	sleep 0.2s
    done
done

