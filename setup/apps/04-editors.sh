#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash code 2> /dev/null || (
	brew cask install visual-studio-code && \
	code --install-extension shan.code-settings-sync
)
hash subl 2> /dev/null || brew cask install sublime-text
hash atom 2> /dev/null || brew cask install atom

brew cask install microsoft-office

set +x
