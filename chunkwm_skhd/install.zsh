#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  echo "Linking skhdrc and chunkwmrc"
  ln -sf $DIRNAME/zshrc ~/.zshrc
  brew tap crisidev/homebrew-chunkwm
  echo "Install chunkwm"
  brew install chunkwm
  echo "Install skhd"
  brew install koekeishiya/formulae/skhd
  echo "Start services for skhd and chunkwm"
  brew services start chunkwm
  brew services start skhd
fi
