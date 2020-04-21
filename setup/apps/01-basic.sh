#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

# Load the shell aliases:
for file in ~/.aliases/*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Install Homebrew
hash brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

set -x

# Update Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install cURL
brew install curl

# Install git
brew install git
brew install git-extras

# Install Cask
brew install cask

# Install dropbox
brew cask install dropbox

# Install Google chrome
brew cask install google-chrome

# Install Google chrome canaruy
brew cask install google-chrome-canary

# Install Browser
brew cask install brave-browser

is-running "Dropbox" || instruct "Manually log-in to Dropbox"
is-running "Dropbox" || instruct "Manually log-in to Chrome"

set +x
