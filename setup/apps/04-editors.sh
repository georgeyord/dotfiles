#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash code 2> /dev/null || (
	brew install --cask visual-studio-code
)
hash subl 2> /dev/null || brew install --cask sublime-text
hash atom 2> /dev/null || brew install --cask atom

# brew install --cask microsoft-office

# Remove outdated versions from the cellar.
brew cleanup

set +x
