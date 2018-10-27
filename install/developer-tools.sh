#!/usr/bin/env bash

brew install wget
brew install jq

brew cask install iterm2
brew install git

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
