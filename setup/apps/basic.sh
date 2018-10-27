#!/usr/bin/env bash

# Install Homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update Homebrew
brew update

# Install git
brew install git

# Install Cask
brew install cask

# Install dropbox
brew cask install dropbox

# Install Google chrome
brew cask install google-chrome
