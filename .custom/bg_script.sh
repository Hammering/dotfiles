#/bin/bash
while true; do
        #(( RANDOM%2 ==0 )) && feh --randomize --bg-max --no-xinerama ~/Bilder/Wallpapers/2\ screens/* || feh --randomize --bg-max ~/Bilder/Wallpapers/Landscape/*
	feh --bg-max ~/Bilder/Wallpapers/2560x1440/$(ls ~/Bilder/Wallpapers/2560x1440/ | shuf -n 1) ~/Bilder/Wallpapers/Portrait/$(ls ~/Bilder/Wallpapers/Portrait/ | shuf -n 1) ~/Bilder/Wallpapers/Portrait/$(ls ~/Bilder/Wallpapers/Portrait/ | shuf -n 1) 
        sleep 300
done

