#!/bin/bash

padding=`bspc config top_padding`

if [[ $padding -eq 20 ]]
then
	bspc config top_padding 0
elif [[ $padding -eq 0 ]]
then
	bspc config top_padding 20
else
	echo "Top padding is neither 20 or 0"
fi
