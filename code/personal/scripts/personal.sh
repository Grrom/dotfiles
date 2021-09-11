#!/bin/bash

# aliases
alias bashrc="nvim ~/.bashrc"
alias nvimrc="cd ~/.config/nvim/; nvim ."
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias memorylamp="code ~/code/dart/memorylamp-mobile"

alias note="nvim ~/code/personal/personalStuff/notes.json"
alias aniserve="cd ~/code/personal/Grrom.github.io/anime/ ; node anime_server.js"


# paths
export PATH="$PATH:~/code/dart/channels/stable/bin"


# commands

# android emulators 
emu(){
  ACTION=$1
  OPEN=$2

  case "$OPEN" in 
    "sm") OPEN="Pixel_3a_API_24";;
  esac
  
  case "$ACTION" in
    "l") ~/Android/Sdk/tools/emulator -list-avds;;
    "o") echo "Opening $OPEN" ; ~/Android/Sdk/tools/emulator @$OPEN;;
  esac
}

# for moving animes from download folder
animove(){
  ANIMENAME=$1
  WORDS_TO_TRIM1=$2
  WORDS_TO_TRIM2=$3

  ANIME_FOLDER_NAME="${ANIMENAME//_/ }"
  
  DIR=~/code/personal/Grrom.github.io/anime/anime/$ANIME_FOLDER_NAME

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
