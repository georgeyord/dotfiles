#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

# Permanently Disable Gatekeeper
sudo spctl --master-disable

# brew install --cask flycut
# defaults write com.generalarcade.flycut loadOnStartup -bool true

# brew install --cask coconutbattery
brew install --cask menumeters

# brew install --cask growl-fork
brew install terminal-notifier
brew install --cask aerial
# Obsolete, now using bettertouchtool
# brew install --cask touchswitcher
# brew install --cask bettertouchtool
brew install --cask numi
brew install --cask KeyboardCleanTool
#http://hasseg.org/icalBuddy/examples.html
# hash icalBuddy 2> /dev/null || brew install ical-buddy
# f.lux makes your computer screen look like the room you're in, all the time.
# https://justgetflux.com/
# is-installed-application "Flux" 2> /dev/null || brew install --cask flux
# Window switcher for your Mac
# https://bahoom.com/hyperswitch
# is-installed-application "HyperSwitch" 2> /dev/null || brew install --cask hyperswitch

sudo gem install colorls || echo "Failed..."
sudo gem install lolcat || echo "Failed..."
sudo gem install artii || echo "Failed..."

# Read more: https://github.com/ng-vu/tomato
# if [ ! hash tomato 2> /dev/null ]; then
#   instruct "Manually install Tomato for BTT

# --> Download https://github.com/ng-vu/tomato/blob/master/others/tomato?raw=true
# --> make it executable
# --> move it to /usr/local/bin
# "
# fi

brew install --cask itsycal
defaults write com.mowglii.ItsycalApp HideIcon -bool false
defaults write com.mowglii.ItsycalApp HighlightedDOWs -bool true
defaults write com.mowglii.ItsycalApp ShowDayOfWeekInIcon -bool true
defaults write com.mowglii.ItsycalApp ShowEventDays 7
defaults write com.mowglii.ItsycalApp SizePreference -bool true
defaults write com.mowglii.ItsycalApp ShowMonthInIcon -bool true
defaults write com.mowglii.ItsycalApp UseOutlineIcon -bool true
defaults write com.mowglii.ItsycalApp WeekStartDOW -bool true

echo "Manually setup Alfred

Disable Spotlight:
--> System Preferences
--> Spotlight
--> Keyboard shortcuts
--> Untick 'Show spotlight search'

Setup Alfred:
- Open alfred
- Set Powerpack key to $(cat ${SYNCED_PATH}/apps/configurations/alfred/alfred.v3.key)
- Set preferences folder to '${SYNCED_PATH}/apps/configurations/alfred/Alfred.alfredpreferences'
"
sleep 10

# For X11Requirement
# brew install --cask xquartz
# brew install rdesktop

# Install Authy MFA manager
# brew install authy

# Install Grid clock wallpaper
# curl https://github.com/chrstphrknwtn/grid-clock/releases/download/0.0.4/Grid.Clock.0.0.4.saver.zip -o /tmp/Grid.Clock.0.0.4.saver.zip
# cd /tmp
# unzip Grid.Clock.0.0.4.saver.zip
# open Grid\ Clock.saver

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo

# if [ ! is-installed-application "Touch Bar Piano" ]; then
#   instruct "Manually setup Touch Bar Piano

#   Setup Alfred:
#   - Open https://www.utsire.com/touch-bar-piano/
#   - Download
#   - Unzip
#   - Move to Applications folder
#   "
# fi

# Remove outdated versions from the cellar.
brew cleanup

set +x
