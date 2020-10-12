#!/usr/bin/bash

#
# Fetch sub modules
#
git submodule init
git submodule update

#
# Setup ZSH
#
sudo apt install -y zsh curl git
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#
# Install base utilities
#
sudo apt install -y curl build-essential htop neofetch

#
# ACK
#
# sudo apt install -y ack
# ln -sr .ackrc $HOME/

#
# PBCopy/Paste
#
sudo apt install -y xsel
ln -sr .oh-my-zsh/plugins/pasteboard $HOME/.oh-my-zsh/plugins/
echo "\nplugins+=pasteboard" >> $HOME/.zshrc
echo "\nsource \$ZSH/oh-my-zsh.sh" >> $HOME/.zshrc

#
# Git
#
sudo apt install -y git tig
ln -sr .gitconfig $HOME/

#
# VIM
#
sudo apt install -y vim ruby
ln -sr .vimrc $HOME/
ln -sr .vim $HOME/
