#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

sudo pacman -S --needed --noconfirm xfce4-power-manager exo playerctl xorg-xbacklight pamixer pamac inotify-tools awesome fortune-mod
yay -S --needed --noconfirm networkmanager-dmenu xst-git

#cp -rT $DIRNAME/config/ ~

rsync -aP --exclude=awesome $DIRNAME/config/ ~

ln -sf $DIRNAME/config/.config/awesome ~/.config/
ln -sf $DIRNAME/config/.Xresources ~/.Xresources

echo "You're done."
