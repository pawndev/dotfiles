#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm ncmpcpp
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install ncmpcpp
fi

mkdir -p ~/.config/ncmpcpp

ln -sf $DIRNAME/config ~/.config/ncmpcpp/

echo "You're done."
