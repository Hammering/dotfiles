#!/usr/bin/bash

saveloc=/home/erlend/Bilder/Screenshots/`date "+%F_%H%M%S.png"`

maim -s $saveloc -c 0,1,1,0.2 -l -m 9 &&
xclip -selection clipboard -t image/png -i $saveloc
#notify-send -a "screenshot" "SCREEN SHOT TAKEN"
