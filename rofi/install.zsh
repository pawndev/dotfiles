#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm rofi
  yay -S rofi-1pass rofi-autorandr

  echo "Creating rofi conf dir"
  mkdir -p ~/.config/rofi
  ln -sf $DIRNAME/config ~/.config/rofi/
  ln -sf $DIRNAME/earthsong.rasi ~/.config/rofi/
fi
