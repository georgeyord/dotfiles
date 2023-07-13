#!/usr/bin/env bash
set -e

set -x

brew install --cask slack
brew install --cask viber
brew install --cask whatsapp
brew install --cask skype
brew install --cask zoomus
brew install telegram
brew install rocket-chat

# if [ ! -d /Applications/Bitrix24.app ]; then
#   curl http://dl.bitrix24.com/b24/bitrix24_desktop.dmg -o /tmp/bitrix24_desktop.dmg
#   open /tmp/bitrix24_desktop.dmg
#   instruct "Finalize the bitrix installation manually..."
# fi

set +x
