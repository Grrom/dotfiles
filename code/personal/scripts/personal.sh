#!/bin/bash

#__     __         _       _     _           
#\ \   / /_ _ _ __(_) __ _| |__ | | ___  ___ 
# \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#  \ V / (_| | |  | | (_| | |_) | |  __/\__ \
#   \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
export PATH="$PATH:~/code/dart/channels/stable/bin"
export PATH="$PATH":"$HOME/code/dart/channels/stable/bin/cache/dart-sdk/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export external="/run/media/jerome/MANJARO"

#    _    _ _                     
#   / \  | (_) __ _ ___  ___  ___ 
#  / _ \ | | |/ _` / __|/ _ \/ __|
# / ___ \| | | (_| \__ \  __/\__ \
#/_/   \_\_|_|\__,_|___/\___||___/

# quick edits
alias nvimrc="cd ~/.config/nvim/; nvim ."
alias bashrc="nvim ~/.bashrc"
alias personalrc="nvim ~/code/personal/scripts/personal.sh"
alias note="nvim ~/code/personal/personalStuff/notes.json"

# command shortcuts
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias aniserve="mountExternal ; cd ${external}/anime/ ; node anime_server.js"

# sourcing stuff
source ~/code/personal/scripts/boiling_waters.sh
source ~/code/personal/scripts/project_shortcuts.sh


#  ____                                          _     
# / ___|___  _ __ ___  _ __ ___   __ _ _ __   __| |___ 
#| |   / _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __|
#| |__| (_) | | | | | | | | | | | (_| | | | | (_| \__ \
# \____\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/

figlets(){ # because I'm too lazy to pipe it myself 😉
  echo "$1" | figlet 
}

emu(){ # emulator shortcut
  ACTION=$1
  OPEN=$2

  case "$OPEN" in 
    "sm") OPEN="Pixel_3a_API_24";;
    "l") OPEN="Pixel_C_API_22";;
  esac
  
  case "$ACTION" in
    "l") ~/Android/Sdk/tools/emulator -list-avds;;
    "o") echo "Opening $OPEN" ; ~/Android/Sdk/tools/emulator @$OPEN;;
  esac
}

shrinkVideo(){
  ffmpeg -i $1 -vcodec libx264 -crf 28 -pix_fmt yuv420p output.mp4;
}

externalMounted(){
  HELLO=$(ls $external | wc -l)
  if [[ $HELLO == 0 ]]; 
  then echo false;
  else echo true;
  fi
}

mountExternal(){
  if [ $(externalMounted) == false ];
  then 
    echo "mounting $external..."
    echo "$(udisksctl mount -b /dev/sda3)"
  fi
}

animove(){ # for moving animes from download folder
  mountExternal

  ANIMENAME=$1
  WORDS_TO_TRIM1=$2
  WORDS_TO_TRIM2=$3

  # for movies 
  if [[ "$ANIMENAME" == "movies" ]]
  then 
    for f in *.mp4; do mv -- "$f" "movies$f";
    done
  fi;

  ANIME_FOLDER_NAME="${ANIMENAME//_/ }"
  
  DIR="${external}/anime/anime/${ANIME_FOLDER_NAME}"

  mkdir "$DIR" 
  mv *"$ANIMENAME"* "$DIR"

  cd "$DIR"

  if [ -n "$WORDS_TO_TRIM2" ]
  then
  for f in *"$ANIMENAME"*; do mv -- "$f" "${f/$WORDS_TO_TRIM2/}"; done
  fi

  if [ -n "$WORDS_TO_TRIM1" ]
  then
  for f in *"$ANIMENAME"*; do mv -- "$f" "${f/$WORDS_TO_TRIM1/}"; done
  fi
  cd ..
#  mv "$ANIMENAME" "${ANIMENAME//_/ }"
#  while read WORDS_TO_TRIM; do
#      for f in *.mp4; do mv -- "$f" "${f/$WORDS_TO_TRIM/}"; done
#      if [ "$WORDS_TO_TRIM" = "done" ] 
#      then break
#      fi
#    done 
}

