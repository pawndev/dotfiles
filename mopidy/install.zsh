#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm mopidy
  #yaourt -S --noconfirm --needed mopidy-spotify
  yaourt -S --needed --noconfirm libspotify
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew tap mopidy/mopidy
fi

echo "Fix spotify playlists connection"
# https://github.com/mopidy/mopidy-spotify/issues/182#issuecomment-392187937
git clone -b fix/incompatible_playlists --single-branch git@github.com:BlackLight/mopidy-spotify.git

sudo python2 ./mopidy-spotify/setup.py build install

rm -Rf ./mopidy-spotify

mkdir -p ~/.config/mopidy

echo "Copy mopidy config & replace env var"
envsubst < "$DIRNAME/mopidy.conf" > ~/.config/mopidy/mopidy.conf

echo "You're done."
