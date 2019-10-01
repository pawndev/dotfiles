#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm zsh bat jq tmux
  yay -S tmuxinator
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install zplug bat jq tmux
fi

echo "Installing zplug...."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

mkdir -p ~/bin
mkdir -p ~/.tmux/plugins

echo "Linking zshrc"
ln -sf $DIRNAME/tmux.conf ~/.tmux.conf
ln -sf $DIRNAME/zshrc ~/.zshrc
cp $DIRNAME/tmuxinator/* ~/.config/tmuxinator/
if [[ ! -a $DIRNAME/variables.zsh ]]; then
  cp $DIRNAME/variables.zsh.dist $DIRNAME/variables.zsh
fi

cp $DIRNAME/bin/* ~/bin/

source $ZPLUG_HOME/init.zsh

if ! zplug check; then
  echo "Zplug install..."
  zplug install
fi

zplug load

echo "Set-up tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf

echo "You're done."
