#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

brew cask install sublime-text
brew cask install atom
brew cask install visual-studio-code
code --install-extension shan.code-settings-sync

brew cask install microsoft-office

set +x
