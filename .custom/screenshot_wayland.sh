#!/usr/bin/env sh
# Take a screenshot on wayland with swaymsg, jq, grim, slurp, and swappy
#
# Make sure the script is executable (chmod +x ./screenshot.sh)
#
# If you don't use sway, replace `swaymsg` with whatever your window manager
# gives you to query window information.
#
# Example sway configuration
#
# bindsym Print             exec ~/.local/bin/screenshot.sh region
# bindsym Shift+Print       exec ~/.local/bin/screenshot.sh window
# bindsym Ctrl+Print        exec ~/.local/bin/screenshot.sh output
# bindsym Ctrl+Shift+Print  exec ~/.local/bin/screenshot.sh all


# region|window|output|all
mode="$1"
saveloc=/home/erlend/Bilder/Screenshots/`date "+%F_%H%M%S.png"`

case $mode in
    "region")
        grim -g "$(slurp)" - | swappy -f - -o $saveloc
        ;;
    "window")
        grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | swappy -f - -o $saveloc
        ;;
    "output")
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | swappy -f - -o $saveloc
        ;;
    "all")
        grim - | swappy -f - -o $saveloc
        ;;
    *)
        echo >&2 "unsupported command \"$mode\""
        echo >&2 "Usage:"
        echo >&2 "screenshot.sh <region|window|output|all>"
        exit 1
esac

