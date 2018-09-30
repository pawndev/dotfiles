#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm cronie
  crontab $DIRNAME/wallpaper

  echo "You're done, don't forget to add cronie.service to systemctl services"

fi
