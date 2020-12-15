#!/usr/bin/env bash

MUSIC_DIR=$HOME/Music/ # Your music directory
COVER=/tmp/cover.jpg

{
    album="$(mpc --format %album% current -p 6600)"
    file="$(mpc --format %file% current -p 6600)"
    album_dir="${file%/*}"
    [[ -z "$album_dir" ]] && exit 1
    album_dir="$MUSIC_DIR/$album_dir"
    covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    src="$(echo -n "$covers" | head -n1)"
    rm -f "$COVER" 
    
    # For Notifications
    if [[ -n "$src" ]] ; then
        # Resize the image's width to 64px
        convert "$src" -resize 64x "$COVER"
        if [[ -f "$COVER" ]] ; then
            notify-send -u low -i ${COVER} " Now Playing" "`mpc current`"
        fi
    fi
} &