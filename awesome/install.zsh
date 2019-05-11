#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

sudo pacman -S --needed --noconfirm awesomemxfce4-power-manager exo playerctl xorg-xbacklight pamixer pamac inotify-tools awesome
yaourt -S --needed --noconfirm networkmanager-dmenu

#cp -rT $DIRNAME/config/ ~

rsync -aP --exclude=awesome $DIRNAME/config/ ~

ln -sf $DIRNAME/config/.config/awesome ~/.config/

echo "You're done."
