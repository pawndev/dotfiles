#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm i3 libmpdclient feh scrot xclip acpi networkmanager network-manager-applet cbatticon dunst
  yaourt -S --needed --noconfirm polybar light

  echo "Creating i3 config directory"
  mkdir -p ~/.config/i3/scripts
  echo "Creating polybar config directory"
  mkdir -p ~/.config/polybar
  mkdir -p ~/Pictures/Screenshots
  echo "Creating dunst config directory"
  mkdir -p ~/.config/dunst

  cp -R $DIRNAME/scripts/assets ~/.config/i3/scripts/

  echo "Linking i3 conf"
  ln -sf $DIRNAME/config ~/.config/i3/
  ln -sf $DIRNAME/scripts/i3exit ~/.config/i3/scripts/
  ln -sf $DIRNAME/scripts/random-wallpaper ~/.config/i3/scripts/
  ln -sf $DIRNAME/scripts/take-screenshot ~/.config/i3/scripts/
  ln -sf $DIRNAME/polybar/config ~/.config/polybar/
  ln -sf $DIRNAME/polybar/launch.sh ~/.config/polybar/
  ln -sf $DIRNAME/dunst/dunstrc ~/.config/dunst
fi
