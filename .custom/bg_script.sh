#/bin/bash
while true; do
        #(( RANDOM%2 ==0 )) && feh --randomize --bg-max --no-xinerama ~/Bilder/Wallpapers/2\ screens/* || feh --randomize --bg-max ~/Bilder/Wallpapers/Landscape/*
	#feh --bg-max ~/Bilder/Wallpapers/Landscape_new/$(ls ~/Bilder/Wallpapers/Landscape_new/ | shuf -n 1) ~/Bilder/Wallpapers/Portrait_new/$(ls ~/Bilder/Wallpapers/Portrait_new/ | shuf -n 1) ~/Bilder/Wallpapers/Portrait_new/$(ls ~/Bilder/Wallpapers/Portrait_new/ | shuf -n 1) 
	feh --bg-max $(find ~/Bilder/Wallpapers/Landscape_new/ | shuf -n 1) $(find ~/Bilder/Wallpapers/Portrait_new/ | shuf -n 1) $(find ~/Bilder/Wallpapers/Portrait_new | shuf -n 1)
        sleep 300
done

