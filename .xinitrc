#!/bin/sh
# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --output DisplayPort-2 --primary --right-of HDMI-A-0 --output HDMI-A-0 --rotate right
#xrandr --output DisplayPort-0 --mode 2560x1440 --rate 144 --primary --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rotate right --output HDMI-A-1 --mode 1920x1080 --right-of DisplayPort-0 --rotate left
picom &
#redshift &
/usr/lib/notify-osd/notify-osd &
exec i3

