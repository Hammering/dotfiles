#!/bin/sh
# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --output DisplayPort-2 --mode 2560x1440  --primary --right-of HDMI-A-0 --output HDMI-A-0 --rotate right --output DisplayPort-1 --right-of DisplayPort-2 --rotate right
picom &
redshift &
/usr/lib/notify-osd/notify-osd &
exec i3

