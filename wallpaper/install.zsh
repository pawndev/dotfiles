#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm ruby ruby-rdoc
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
fi

mkdir -p ~/Pictures/Wallpapers

gem install nokogiri
gem install ruby-progressbar

ruby $DIRNAME/maller-downloader/init.rb --folder=~/Pictures/Wallpapers

echo "You're done."
