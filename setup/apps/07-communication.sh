#!/usr/bin/env bash
set -e

set -x

brew cask install slack
brew cask install viber
brew cask install skype
brew cask install zoomus

# if [ ! -d /Applications/Bitrix24.app ]; then
#   curl http://dl.bitrix24.com/b24/bitrix24_desktop.dmg -o /tmp/bitrix24_desktop.dmg
#   open /tmp/bitrix24_desktop.dmg
#   instruct "Finalize the bitrix installation manually..."
# fi

set +x
