#!/bin/bash

DIR="$(cd $(dirname $0) && pwd)/src"

echo "Installing .zshrc"
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
ln -s $DIR/.zshrc ~/.zshrc

echo "Installing lazygit config"
if [ ! -f ~/.config/lazygit/config.yml ]; then
    mkdir -p ~/.config/lazygit
else
    mv ~/.config/lazygit/config.yml ~/.config/lazygit/config.yml.bak
fi
ln -s $DIR/lazygit/config.yml ~/.config/lazygit/config.yml

echo "Installing lazydocker config"
if [ ! -f ~/.config/lazydocker/config.yml ]; then
    mkdir -p ~/.config/lazydocker
else
    mv ~/.config/lazydocker/config.yml ~/.config/lazydocker/config.yml.bak
fi
ln -s $DIR/lazydocker/config.yml ~/.config/lazydocker/config.yml

echo "Installing tmux"
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
else
ln -s $DIR/tmux/.tmux.conf ~/.tmux.conf

read -p "Do you want to clear backup files? [Y/n] " yn
[ -z $yn ] && yn="Y"
if [[ $yn =~ ^[Yy]$ ]]; then
    rm -f ~/.zshrc.bak

    if [ -f ~/.config/lazygit/config.yml.bak ]; then
        rm -f ~/.config/lazygit/config.yml.bak
    fi

    if [ -f ~/.config/lazydocker/config.yml.bak ]; then
        rm -f ~/.config/lazydocker/config.yml.bak
    fi

    if [ -f ~/.tmux.conf.bak ]; then
        rm -f ~/.tmux.conf.bak
    fi

    echo "Backup files cleared."
fi

echo "Installation complete! Please restart your terminal."
