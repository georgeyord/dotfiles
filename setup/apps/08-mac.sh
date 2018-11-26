#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.functions

set -x

# Core casks
brew cask install flycut
defaults write com.generalarcade.flycut loadOnStartup -bool true
brew cask install growl-fork
brew install aerial
# Obsolete, now using bettertouchtool
# brew cask install touchswitcher
brew cask install bettertouchtool
brew cask install numi
brew cask install KeyboardCleanTool
#http://hasseg.org/icalBuddy/examples.html
hash icalBuddy 2> /dev/null || brew cask install icalBuddy

hash wallpaper 2> /dev/null || brew install wallpaper
../setup_wallpapers.sh

brew cask install itsycal
defaults write com.mowglii.ItsycalApp HideIcon -bool false
defaults write com.mowglii.ItsycalApp HighlightedDOWs -bool true
defaults write com.mowglii.ItsycalApp ShowDayOfWeekInIcon -bool true
defaults write com.mowglii.ItsycalApp ShowEventDays 7
defaults write com.mowglii.ItsycalApp SizePreference -bool true
defaults write com.mowglii.ItsycalApp ShowMonthInIcon -bool true
defaults write com.mowglii.ItsycalApp UseOutlineIcon -bool true
defaults write com.mowglii.ItsycalApp WeekStartDOW -bool true

brew install findutils
# brew cask install java

brew cask install alfred

if [ ! is-running "Alfred" ]; then

instruct "Manually setup Alfred

Disable Spotlight:
--> System Preferences
--> Spotlight
--> Keyboard shortcuts
--> Untick 'Show spotlight search'

Setup Alfred:
- Open alfred
- Set Powerpack key to $(cat ~/Dropbox/Dev/apps/mac-apps/alfred.v3.key)
- Set preferences fodler to '~/Dropbox/Dev/apps/mac-apps/configurations/alfred/Alfred.alfredpreferences'
"
fi

# brew cask install xquartz

# Install Grid clock wallpaper
curl https://github.com/chrstphrknwtn/grid-clock/releases/download/0.0.4/Grid.Clock.0.0.4.saver.zip -o /tmp/Grid.Clock.0.0.4.saver.zip
cd /tmp
unzip Grid.Clock.0.0.4.saver.zip
open Grid\ Clock.saver

set +x
