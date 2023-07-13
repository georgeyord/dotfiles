#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

# Install Raspberry Pi related
brew install --cask balenaetcher

brew install --cask sonic-pi

set +x
