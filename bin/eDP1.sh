#!/bin/bash

xrandr --output HDMI1 --off --output eDP1 --primary --auto
bspc monitor HDMI1 --remove
bspc monitor eDP1 --reset-desktops I II III IV V VI
bspc desktop ^1 -l monocle
bspc desktop ^3 -l monocle
bspc wm --adopt-orphans
pkill polybar
polybar modern >/dev/null 2>&1 &
feh --bg-fill ~/Pictures/background.jpg
pkill synergy
systemctl --user start xfce4-notifyd &
