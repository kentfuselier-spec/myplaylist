#!/usr/bin/env bash
dir="$1"
sourcefile="./playlist.txt"
if [ $1 == "help" ]; then
	echo "This script looks"
	echo "The contents of playlist.txt should be seperated by genera which is specified by"
	echo "# Genera"
	echo "each subsequent line in that genera needs to be specified like this"
	echo "Song Title \$\$ Artist \$\$ YT link"
	echo "After this file is made, rerun the script"
	echo ""
elif [[ -d $1 && -f $sourcefile ]]; then
	## Actual script starts here
	mkdir ./.tmp 
	while read -u 10 line; do
		if [[ $line == \#* ]]; then
			genre=$(echo $line | sed 's/\# //g')
		else
			title=$(awk -F' \\$\\$ ' '{print $1}' <<< $line)
			artist=$(awk -F' \\$\\$ ' '{print $2}' <<< $line)
			link=$(awk -F' \\$\\$ ' '{print $3}' <<< $line)
			echo "Working on $title, by $artist"
			cd ./.tmp
			yt-dlp "$link"	
			song=$(find ./ -type f); ffmpeg -i "$song" -vn -c:a libmp3lame -q:a 0 \
				-metadata title="$title" -metadata artist="$artist" -metadata genre="$genre" \
				"../$dir/$title.mp3"; rm "$song"
			cd .. 
		fi
	done 10<$sourcefile
	rmdir ./.tmp
	## Actual script ends here
elif [ -d $1 ]; then
	echo "Need a sourcefile 'playlist.txt' in active dir. See './playlist.sh help' for more info."
elif [ -f $sourcefile ]; then
	echo "Need to specifiy which dir the finished mp3 are to be placed. './playlist.sh \$HOME/Downloads' would be used to place all music in the download folder."
else
	echo "Need a sourcefile 'playlist.txt' in active dir. See './playlist.sh help' for more info."
fi
