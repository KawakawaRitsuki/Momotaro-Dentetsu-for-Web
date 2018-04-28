#!/bin/bash

ruby main.rb -o 0.0.0.0 -p 5588 >& /dev/null&

Xvfb :1 -screen 0 640x480x24&
export DISPLAY=:1

while true; do import -window root /tmp.png;cp /tmp.png /public/example.png;done&
dolphin-emu -e /game.iso&


