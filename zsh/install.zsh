#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm zsh
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install zplug
fi

echo "Installing zplug...."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo "Linking zshrc"
ln -sf $DIRNAME/zshrc ~/.zshrc

source $ZPLUG_HOME/init.zsh

if ! zplug check; then
  echo "Zplug install..."
  zplug install
fi

zplug load

echo "You're done."
