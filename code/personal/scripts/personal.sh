#!/bin/bash

# aliases
alias bashrc="nvim ~/.bashrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


# paths
export PATH="$PATH:/code/dart/channels/stable/bin"


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
