#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

# Permanently Disable Gatekeeper
sudo spctl --master-disable

# Core casks
brew cask install alfred

brew cask install flycut
defaults write com.generalarcade.flycut loadOnStartup -bool true

brew cask install coconutbattery

# brew cask install growl-fork
brew install terminal-notifier
brew cask install aerial
# Obsolete, now using bettertouchtool
# brew cask install touchswitcher
brew cask install bettertouchtool
brew cask install numi
brew cask install KeyboardCleanTool
#http://hasseg.org/icalBuddy/examples.html
hash icalBuddy 2> /dev/null || brew install ical-buddy

sudo gem install colorls
sudo gem install lolcat
sudo gem install artii

# Read more: https://github.com/ng-vu/tomato
if [ ! hash tomato 2> /dev/null ]; then
  instruct "Manually install Tomato for BTT

--> Download https://github.com/ng-vu/tomato/blob/master/others/tomato?raw=true
--> make it executable
--> move it to /usr/local/bin
"
fi

brew cask install itsycal
defaults write com.mowglii.ItsycalApp HideIcon -bool false
defaults write com.mowglii.ItsycalApp HighlightedDOWs -bool true
defaults write com.mowglii.ItsycalApp ShowDayOfWeekInIcon -bool true
defaults write com.mowglii.ItsycalApp ShowEventDays 7
defaults write com.mowglii.ItsycalApp SizePreference -bool true
defaults write com.mowglii.ItsycalApp ShowMonthInIcon -bool true
defaults write com.mowglii.ItsycalApp UseOutlineIcon -bool true
defaults write com.mowglii.ItsycalApp WeekStartDOW -bool true

if [ ! is-running "Alfred" ]; then

instruct "Manually setup Alfred

Disable Spotlight:
--> System Preferences
--> Spotlight
--> Keyboard shortcuts
--> Untick 'Show spotlight search'

Setup Alfred:
- Open alfred
- Set Powerpack key to $(cat $HOME/Dropbox/Dev/apps/mac-apps/alfred.v3.key)
- Set preferences fodler to '$HOME/Dropbox/Dev/apps/mac-apps/configurations/alfred/Alfred.alfredpreferences'
"
fi

# For X11Requirement
brew cask install xquartz
brew install rdesktop

# Install Grid clock wallpaper
curl https://github.com/chrstphrknwtn/grid-clock/releases/download/0.0.4/Grid.Clock.0.0.4.saver.zip -o /tmp/Grid.Clock.0.0.4.saver.zip
cd /tmp
unzip Grid.Clock.0.0.4.saver.zip
open Grid\ Clock.saver

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo

set +x
