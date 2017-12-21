#!/bin/bash

# Since this command doesnt exit non zero when it fails, do it in a loop until I can see the results, and CTRL+C it

while true; do
    xrandr --output eDP-1-1 --mode auto --output DP-3.1 --mode 1920x1080  --same-as eDP-1-1
    sleep 1
done

