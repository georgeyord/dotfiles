#!/usr/bin/env bash
set -e

set -x

is-installed-application "Spotify" || brew install --cask spotify
is-installed-application "Gimp" || brew install --cask gimp
hash HandBrakeCLI 2> /dev/null || brew install --cask handbrake
hash makemkvcon 2> /dev/null || brew install --cask makemkv

hash vlc 2> /dev/null || brew install --cask vlc

# Torrent client
is-installed-application "Folx" || brew install --cask folx

hash youtube-dl 2> /dev/null || (
  brew install ffmpeg &&
  brew install youtube-dl
)

set +x
