#!/bin/sh

# install homebrew - http://brew.sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Rename system vim
sudo mv /usr/bin/vim /usr/bin/vim-system

# Base packages via vim
brew install zsh tmux vim postgres rbenv ruby-build nodejs phantomjs

# install vimified

# install ohmyzsh