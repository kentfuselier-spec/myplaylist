#!/usr/bin/env bash
path=$1
sourcefile="./playlist.txt"

if [[ -f $path && -f $sourcefile ]]; then
  if [[ $1 == "help" ]]; then
    echo "This script looks for a 'playlist.txt' to download and convert music."
    echo "The contents of playlist.txt should be seperated by genera which is specified by"
    echo "# Genera"
    echo "each subsequent line in that genera needs to be specified like this"
    echo "Song Title \$\$ Artist \$\$ YT link"
    echo "After this file is made, rerun the script"
    echo ""
  else
    ## Actual script starts here 
    ## Actual script ends here
  fi
elif [[ -f $path ]]; then
  echo "Need a sourcefile 'playlist.txt' in active dir. See './playlist.sh help' for more info."
elif [[ -f $sourcefile ]]; then
  echo "Need to specifiy which dir the finished mp3 are to be placed. './playlist.sh \$HOME/Downloads' would be used to place all music in the download folder."
else
  echo "Need a sourcefile 'playlist.txt' in active dir. See './playlist.sh help' for more info."
fi
