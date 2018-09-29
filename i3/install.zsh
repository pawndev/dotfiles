#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm i3 libmpdclient
  yaourt -S --needed --noconfirm polybar

  echo "Creating i3 config directory"
  mkdir -p ~/.config/i3/scripts
  echo "Creating polybar config directory"
  mkdir -p ~/.config/polybar

  echo "Linking i3 conf"
  ln -sf $DIRNAME/config ~/.config/i3/
  ln -sf $DIRNAME/scripts/i3exit ~/.config/i3/scripts/
  ln -sf $DIRNAME/polybar/config ~/.config/polybar/
  ln -sf $DIRNAME/polybar/launch.sh ~/.config/polybar/
fi
