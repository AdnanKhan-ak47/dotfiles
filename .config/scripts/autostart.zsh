#!/bin/zsh

# variables
$scripts = ~/.config/scripts

# notification daemon
swaync &

# AUthentication Agent
/usr/lib/polkit-kde-authentication-agent-1


# waybar
~/.config/waybar/launch.zsh &

# wallpaper
$scripts/wall "$WALL_PATH/1_*" &

# swayidle
$scripts/lockscreen.zsh &

# Applets
blueman-applet &
