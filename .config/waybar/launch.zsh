#!/bin/zsh

# Quitting Waybar instances
killall waybar 

if [[ $USER == "adnan" ]];
then
  waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
  waybar &
fi
