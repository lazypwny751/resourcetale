#!/bin/sh

# requires: coreutils, yt-dlp

if [ ! -d "mp3" ] ; then
	mkdir "mp3"
fi

for f in "handclap:https://www.youtube.com/watch?v=K1AUw30gzQc" \
 "marble_machine:https://www.youtube.com/watch?v=IvUU8joBb1Q" \
 "switch_angel_doin_somethin:https://www.youtube.com/watch?v=-pDO2RhcGhM" \
 "marble_machine_zayin:https://www.youtube.com/watch?v=417UJLoQEZo" \
 "flashing_lights:https://www.youtube.com/watch?v=tkTeh5Irt28" \
 "snowflake002:https://www.youtube.com/watch?v=YQXzF1iKgf0" \
 "snowflake001:https://www.youtube.com/watch?v=GYotAHX1H3o" \
 "tetris_theme:https://www.youtube.com/watch?v=NmCCQxVBfyM"
do
	name="${f%%:*}"
	base="${f##*:}"
	if [ ! -f "mp3/${name}.mp3" ] ; then
		echo "======== ${name} ========"
		yt-dlp -x --audio-format mp3 --audio-quality 0 -o "mp3/${name}.mp3" "${base}"
	else
		echo "found \"${name}.mp3\", skipping..."
	fi
done
