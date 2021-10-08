#!/usr/bin/env bash
set -e

set -x

is-installed-application "Spotify" || brew cask install spotify
is-installed-application "Gimp" || brew cask install gimp
hash HandBrakeCLI 2> /dev/null || brew cask install handbrake
hash makemkvcon 2> /dev/null || brew cask install makemkv

hash vlc 2> /dev/null || brew cask install vlc

# Torrent client
is-installed-application "Folx" || brew cask install folx

hash youtube-dl 2> /dev/null || (
  brew install ffmpeg &&
  brew install youtube-dl
)

set +x
