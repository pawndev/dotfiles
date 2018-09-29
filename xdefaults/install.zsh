#!/usr/bin/env zsh

OS=$(uname)
DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Linking Xdefaults"
ln -sf $DIRNAME/.Xdefaults ~/.Xdefaults

echo "You're done."
