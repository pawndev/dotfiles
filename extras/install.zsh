#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm neomutt
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
fi

echo "You're done."
