#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm alacritty
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install alacritty
fi

mkdir ~/.config/alacritty

echo "Linking alacritty"
ln -sf $DIRNAME/alacritty.yml ~/.config/alacritty/

echo "You're done."
