#!/bin/bash

mkdir -p ~/.local/bin
cp update_dotfiles.sh ~/.local/bin/
chmod +x ~/.local/bin/update_dotfiles.sh

cp -r .i3 ~/
cp .zshrc ~/
cp .Xresources ~/
cp -r .vim ~/
cp dunstrc ~/.config/dunst/
cp -r .themes ~/

