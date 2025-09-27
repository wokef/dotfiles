#!/bin/bash

DIR="$(cd $(dirname $0) && pwd)/src"

echo "Installing .zshrc"
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
ln -s $DIR/.zshrc ~/.zshrc

read -p "Do you want to clear backup files? [Y/n] " yn
[ -z $yn ] && yn="Y"
if [[ $yn =~ ^[Yy]$ ]]; then
    rm -f ~/.zshrc.bak

    echo "Backup files cleared."
fi

echo "Installation complete! Please restart your terminal."
