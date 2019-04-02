#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash git 2> /dev/null || brew install git

brew cask install java
hash wget 2> /dev/null || brew install wget
hash jq 2> /dev/null || brew install jq
hash caffeine 2> /dev/null || brew cask install caffeine
hash iterm2 2> /dev/null || brew cask install iterm2
hash imgcat 2> /dev/null || curl -fsSL https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
hash zsh 2> /dev/null || curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

hash ccze 2> /dev/null || brew install ccze
hash watch 2> /dev/null || brew install watch
hash envsubst 2> /dev/null || ( brew install gettext && brew link --force gettext)

# hash timeular 2> /dev/null || download-and-open https://timeular-desktop-packages.s3.amazonaws.com/mac/production/Timeular.dmg
hash postman 2> /dev/null || brew cask install postman
hash meld 2> /dev/null || brew cask install meld
brew info openvpn || ( brew install openvpn && sudo brew services start openvpn )

set +x

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

# Install Go lang
brew install go
hash gotop 2> /dev/null || ( brew tap cjbassi/gotop && brew install gotop)

# Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install Heroku
# brew install heroku-toolbelt
# heroku update

brew install ansible

# Fuzzy search
brew install fzf
(brew --prefix)/opt/fzf/install

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Install Rust language
curl https://sh.rustup.rs -sSf | sh

# Install bat: A cat(1) clone with wings - https://github.com/sharkdp/bat
# Bat like cat ;-)
brew install bat

set +x
