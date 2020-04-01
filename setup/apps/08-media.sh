#!/usr/bin/env bash
set -e

set -x

brew cask install spotify
brew cask install gimp

hash vlc 2> /dev/null || brew cask install vlc

# Torrent client
brew cask install folx

hash youtube-dl 2> /dev/null || brew install youtube-dl

set +x
