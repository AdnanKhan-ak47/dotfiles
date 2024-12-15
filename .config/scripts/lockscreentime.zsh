#/bin/zsh

if [ -f "/usr/bin/swayidle" ]; then
  echo "swayidle is installed"
  swayidle -w timeout 300 'swaylock -f' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
  echo "swayidle is not installed."
fi;
