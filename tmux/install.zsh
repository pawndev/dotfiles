#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm tmux
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install tmux
fi


echo "You're done."
