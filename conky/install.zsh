#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm conky
fi

mkdir ~/.config/conky

echo "Linking alacritty"
ln -sf $DIRNAME/conky.conf ~/.config/conky/

echo "You're done."
