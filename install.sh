#!/bin/sh

# install homebrew - http://brew.sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Rename system vim
sudo mv /usr/bin/vim /usr/bin/vim-system

# Base packages via vim
brew install git tmux vim ssh-copy-id postgres mysql rbenv nodejs the_silver_searcher qt unrar

npm install -g phantomjs

brew tap homebrew/dupes ; brew install apple-gcc42 # for ruby 1.8 compilation

# install vimified
