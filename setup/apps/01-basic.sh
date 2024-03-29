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

set -x

# Update Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install cURL / httpie
brew install curl
brew install httpie

# Install git
brew install git
brew install git-extras

# Install Cask
brew install cask
brew tap homebrew/cask-versions

# Core casks
# launcher
brew install --cask alfred
# clipboard manager
brew install --cask copyq
# password manager
brew install --cask bitwarden

# Install dropbox
# is-installed-application "Dropbox" 2> /dev/null || brew install --cask dropbox

# Install Synology sync tool, like Dropbox; see https://www.synology.com/en-global/support/download/DS920+#utilities
is-installed-application "Synology Drive Client" 2> /dev/null || (
  brew install synology-drive
)

# Install all Google chrome flavors (stable, canary, beta)
is-installed-application "Google Chrome" || brew install --cask google-chrome
# is-installed-application "Google Chrome Canary" || brew install --cask google-chrome-canary
is-installed-application "Google Chrome Beta" || brew install --cask google-chrome-beta

# Install Brave browser
# is-installed-application "Brave" || brew install --cask brave-browser

# is-running "Dropbox" || instruct "Manually log-in to Dropbox"
is-running "Chrome" || instruct "Manually log-in to Chrome"

set +x
