#!/usr/bin/sh

#
## Fetch sub modules
#
git submodule init
git submodule update

#
## Install base utilities
#
sudo apt install -y vim git curl xsel tig ruby build-essential htop zsh neofetch
# sudo apt install -y ack

#
## Symlinks config files/directories
#
# ln -sr .ackrc $HOME/
ln -sr .oh-my-zsh/plugins/odoo $HOME/.oh-my-zsh/plugins/
# ln -sr .oh-my-zsh/plugins/nodenv $HOME/.oh-my-zsh/plugins/
ln -sr .oh-my-zsh/plugins/pasteboard $HOME/.oh-my-zsh/plugins/
ln -sr .gitconfig $HOME/
ln -sr .vimrc $HOME/
ln -sr .vim $HOME/
