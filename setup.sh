#!/bin/sh
cd ~/dotfiles
git submodule init
git submodule update
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.ackrc ~/.ackrc

if [[ "$(uname)" = "Darwin" ]]; then
  ln -s ~/dotfiles/.tmux.conf.osx ~/.tmux.conf
else
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
fi
