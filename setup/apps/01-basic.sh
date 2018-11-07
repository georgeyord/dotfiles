#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.functions

# Install Homebrew
hash brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

set -x

# Update Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install git
brew install git

# Install Cask
brew install cask

# Install dropbox
brew cask install dropbox
appIsRunning "Dropbox" || instruct "Manually log-in to Dropbox"

# Install Google chrome
brew cask install google-chrome
appIsRunning "Dropbox" || instruct "Manually log-in to Chrome"

set +x
