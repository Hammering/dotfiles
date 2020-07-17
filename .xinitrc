#!/bin/sh
# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --output HDMI-A-0 --primary --right-of DVI-D-0 --output HDMI-A-1 --right-of HDMI-A-0 --rotate left
picom &
/usr/lib/notify-osd/notify-osd &
exec i3

