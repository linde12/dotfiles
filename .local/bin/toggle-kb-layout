#!/bin/bash
layout=$(setxkbmap -query | grep "layout" | tr -s ' ' | sed -r 's/layout: (\w)/\1/')

if [ "$layout" == "us" ]; then
  setxkbmap se
else
  setxkbmap us
fi

xset r rate 240 40
xset m 1/1
