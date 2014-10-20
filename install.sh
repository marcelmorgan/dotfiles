#!/bin/sh

# install homebrew - http://brew.sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Rename system vim
sudo mv /usr/bin/vim /usr/bin/vim-system

# Base packages via vim
brew install zsh tmux vim postgres myqsql rbenv ruby-build nodejs the_silver_searcher qt

npm install -g phantomjs

brew tap homebrew/dupes ; brew install apple-gcc42 # for ruby 1.8 compilation

# install vimified

# install ohmyzsh