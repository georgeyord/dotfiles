#!/usr/bin/env bash
set -e

hash brew 2> /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

hash git 2> /dev/null || brew install git

echo "Run 'git clone https://github.com/georgeyord/dotfiles' in the folder of your taste to start using the dotfiles"
