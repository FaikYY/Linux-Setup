#!/bin/bash

padding=`bspc config top_padding`

if [[ $padding -eq 30 ]]
then
	bspc config top_padding 0
elif [[ $padding -eq 0 ]]
then
	bspc config top_padding 30
else
	echo "Top padding is neither 30 or 0"
fi
