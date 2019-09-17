#!/bin/bash

xrandr --output eDP1 --off --output HDMI1 --primary --auto
bspc monitor eDP1 --remove
bspc monitor HDMI1 --reset-desktops I II III IV V VI
bspc desktop ^1 -l monocle
bspc desktop ^3 -l monocle
bspc wm --adopt-orphans
pkill polybar
polybar modern >/dev/null 2>&1 &
feh --bg-fill ~/Pictures/presentation.jpg
pkill xfce4-notifyd
