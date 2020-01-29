#!/bin/sh
# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

xrandr --dpi 192
compton &
/usr/lib/notify-osd/notify-osd &
exec i3

