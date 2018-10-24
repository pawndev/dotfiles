#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if [[ `uname` == 'Linux' ]]; then
  echo "We're on linux"
  sudo pacman -S --needed --noconfirm neovim python python-neovim curl
elif [[ `uname` == 'Darwin' ]]; then
  echo "We're on MacOS"
  brew install neovim python python@2
fi

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Curl vim-plug"
  curl \
    -fLo ~/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Creating nvim config directory"
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/snips
mkdir -p ~/.config/nvim/undodir
mkdir -p ~/.config/nvim/backups

echo "Linking nvimrc"
ln -sf $DIRNAME/init.vim ~/.config/nvim/
ln -sf $DIRNAME/snips/* ~/.config/nvim/snips/

echo "Install vim plugin"
nvim +PlugInstall +qa
