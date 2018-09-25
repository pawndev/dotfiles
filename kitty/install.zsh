#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm kitty
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install kitty
fi

echo "Creating kitty config directory"
mkdir -p ~/.config/kitty

echo "Linking nvimrc"
ln -sf $DIRNAME/kitty.conf ~/.config/kitty/
