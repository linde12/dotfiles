#!/bin/bash
layout=$(cat $HOME/.cache/kblayout)
new_layout=""
if [ "$layout" == "us" ]; then
	new_layout="se"
else
	new_layout="us"
fi
riverctl keyboard-layout "$new_layout"
echo $new_layout > $HOME/.cache/kblayout
