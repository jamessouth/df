#!/usr/bin/env bash

current_index=$(cat ~/.config/polybar/nlindex)

len=$(wc -l ~/.config/polybar/nldata | cut -d' ' -f1)

case "$1" in
	"+" )   new=$((current_index + 1))
		new_index=$((new > len ? len : new));;

	"-" )   new=$((current_index - 1))
		new_index=$((new < 1 ? 1 : new));;
esac

gamma=$(awk "NR == ${new_index}" ~/.config/polybar/nldata)

xrandr --output eDP-1 --gamma ${gamma}

echo ${new_index} > ~/.config/polybar/nlindex

