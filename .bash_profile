#!/bin/bash

if [ "$DISPLAY" = "" ]
then
   exec startx 
fi
