#!/bin/bash

## Install Packages
sudo pacman -Syu
sudo pacman -Sy --needed fish neovim python-neovim python2-neovim tmux ack the_silver_searcher git wget curl sed ctags

# Enable Fish by Default
grep -q -F 'fish' ~/.bashrc || echo 'fish' >> ~/.bashrc

# Install dotfiles
cp -rv ../config/fish/config.fish ~/.config/fish/config.fish
cp -rv ../config/tmux/tmux.conf ~/.tmux.conf

## Install Vim
mkdir ~/.config/nvim
cp ../config/nvim/init.vim  ~/.config/nvim/init.vim

# required dirs
cd ~/.vim
mkdir tmp
cd tmp/
mkdir swap backup undo
cd

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
nvim +BundleInstall

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --gocode-completer --clang-completer

