#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.functions

set -x

brew cask install java
hash wget 2> /dev/null || brew install wget
hash jq 2> /dev/null || brew install jq
hash caffeine 2> /dev/null || brew cask install caffeine
hash iterm2 2> /dev/null || brew cask install iterm2
hash imgcat 2> /dev/null || curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
hash ccze 2> /dev/null || brew install ccze
hash watch 2> /dev/null || brew install watch
hash zsh 2> /dev/null || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

has timeular || (
    curl https://timeular-desktop-packages.s3.amazonaws.com/mac/production/Timeular.dmg -o /tmp/Timeular.dmg && \
    open /tmp/Timeular.dmg
)

hash timeular 2> /dev/null || brew cask install postman

hash git 2> /dev/null || brew install git

set +x

git config --global alias.addi add --interactive
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.ct commit -m
# Displays commit graph is a nice colored view for just the current branch
git config --global alias.lb "log --graph --pretty=format:'%Cred%h%Creset -%C(green)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
# Displays commit graph is a nice colored view for all branches including stashes
git config --global alias.lba "log --graph --all --pretty=format:'%Cred%h%Creset -%C(blue)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
# Displays each commit as 1 line. It is mainly used to see commits in one shot.
git config --global alias.lc "log --stat --pretty=oneline"
# Displays each commit with full details one after another in a list view
git config --global alias.la "log --format=fuller"
# List of commits in oneline with date, description and user
git config --global alias.ls "log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short"
git config --global alias.pr 'pull --rebase'
git config --global alias.st status -sb
git config --global core.editor 'vim'
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global core.autocrlf input
#git config --global push.default simple

set -x

# Install NodeJS
# brew install nvm

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install Heroku
# brew install heroku-toolbelt
# heroku update

brew install ansible

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

set +x
