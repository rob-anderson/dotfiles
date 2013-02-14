#!/bin/sh
cd ~/dotfiles
git submodule init
git submodule update
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.gemrc ~/.gemrc
