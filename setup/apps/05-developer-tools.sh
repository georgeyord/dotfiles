#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash git 2> /dev/null || brew install git
# Github cli: https://github.com/cli/cli
hash gh 2> /dev/null || brew install gh
# Gitlint: https://jorisroovers.com/gitlint/
hash gitlint 2> /dev/null || brew install gitlint

hash java 2> /dev/null || (
  brew install --cask java
  brew install --cask homebrew/cask-versions/adoptopenjdk8
)
hash wget 2> /dev/null || brew install wget
hash jq 2> /dev/null || brew install jq
hash yq 2> /dev/null || brew install yq
hash caffeinate 2> /dev/null || brew install --cask caffeine
which iterm2_set_user_var 2> /dev/null || brew install --cask iterm2
which imgcat 2> /dev/null || curl -fsSL https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
hash zsh 2> /dev/null || (
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
  ~/.oh-my-zsh/tools/install.sh
  sudo chmod -R 755 /usr/local/share/zsh
  sudo chmod -R 755 /usr/local/share/zsh/site-functions
  if -f "${HISTORY_PATH}"; then
    mv "$HOME/.zsh_history" "$HOME/.zsh_history.bak" && \
    ln -s "${HISTORY_PATH}" "$HOME/.zsh_history"  && \
    fc -R # Reload shell history
  else
    instruct "HISTORY_PATH env found but to path it is pointing to, '${HISTORY_PATH}', is not valid..."
  fi

  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

  brew tap sambadevi/powerlevel9k
  brew install powerlevel9k
)

# Fuzzy search
hash fzf 2> /dev/null || ( brew install fzf && "$(brew --prefix)/opt/fzf/install" )
hash autojump 2> /dev/null || brew install autojump

hash ccze 2> /dev/null || brew install ccze
hash watch 2> /dev/null || brew install watch
hash envsubst 2> /dev/null || ( brew install gettext && brew link --force gettext)
hash socat 2> /dev/null || brew install socat
hash netcat 2> /dev/null || brew install netcat
hash shellcheck 2> /dev/null || brew install shellcheck

hash jfrog 2> /dev/null || brew install jfrog-cli
hash postman 2> /dev/null || brew install --cask postman
hash meld 2> /dev/null || brew install --cask meld
hash asciinema 2> /dev/null || brew install asciinema
# hash timeular 2> /dev/null || download-and-open https://timeular-desktop-packages.s3.amazonaws.com/mac/production/Timeular.dmg

hash supervisorctl 2> /dev/null || (
  brew install supervisor && \
  brew services start supervisor
)

# Bashhub saves every terminal command entered across all sessions and systems and provides powerful querying across all commands.
# https://github.com/rcaloras/bashhub-client
# You may need to run a docker container to connect:
# https://github.com/nicksherron/bashhub-server
hash bh 2> /dev/null || (
  curl -OL https://bashhub.com/setup && zsh setup
)

hash tunnelblick 2> /dev/null || brew install --cask tunnelblick
brew info openvpn || ( brew install openvpn && sudo brew services start openvpn )

# Install NodeJS
hash node 2> /dev/null || brew install node
hash yarn 2> /dev/null || brew install yarn

# Install Python
hash python 2> /dev/null || brew install python
hash python3 2> /dev/null || brew install python3
hash pipenv 2> /dev/null || brew install pipenv
hash pyenv 2> /dev/null || (
  brew install pyenv
  pyenv install 3.9.10
  pyenv global 3.9.10
  )
hash poetry 2> /dev/null || (
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    mkdir -p $ZSH/plugins/poetry
    poetry completions zsh > $ZSH/plugins/poetry/_poetry
  )

# Install Raspberry Pi related
brew install --cask balenaetcher

hash tldr 2> /dev/null || (
  sudo wget -qO /usr/local/bin/tldr https://4e4.win/tldr
  sudo chmod +x /usr/local/bin/tldr
)

# Install ag, a code-searching tool similar to ack, but faster: https://github.com/ggreer/the_silver_searcher
# Usage: https://tldr.ostera.io/ag
hash ag 2> /dev/null || brew install the_silver_searcher

# Install Go lang
hash go 2> /dev/null || (
	brew install go
	export GOBIN="$(go env GOPATH)/bin"
	export GOROOT="$(brew --prefix golang)/libexec"
)

hash gotop 2> /dev/null || ( brew tap cjbassi/gotop && brew install gotop)
# hash dlv 2> /dev/null || ( go get -u github.com/go-delve/delve/cmd/dlv )
hash gotest 2> /dev/null || ( go get -u github.com/rakyll/gotest )

# Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install Heroku
# brew install heroku-toolbelt
# heroku update

# Install Ansible
brew install ansible

# Install MongoDB shell
hash mongo 2> /dev/null || ( brew tap mongodb/brew && brew install mongodb-community-shell)

# Install Kafka
hash kafka-topics 2> /dev/null || ( brew install kafka)

# Install Rust language
hash cargo version 2> /dev/null || ( curl https://sh.rustup.rs -sSf | sh )

# Install bats a bash testing framework: https://bats-core.readthedocs.io/
hash bats 2> /dev/null || (
  brew tap kaos/shell
  brew install  bats-core \
                bats-support \
                bats-assert \
                bats-file
)

# Install bat: A cat(1) clone with wings - https://github.com/sharkdp/bat
# Bat like cat ;-)
hash bat 2> /dev/null || brew install bat

# watchexec is a simple, standalone tool that watches a path and runs a command whenever it detects modifications. - https://github.com/watchexec/watchexec
hash watchexec 2> /dev/null || brew install watchexec

# A Git GUI that offers a visual representation of your repositories: https://www.sourcetreeapp.com/
is-installed-application "Sourcetree" || brew install --cask sourcetree

hash hurl 2> /dev/null || (
  brew tap jcamiel/hurl && \
  brew install hurl
)

set +x
