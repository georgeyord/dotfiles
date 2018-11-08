#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.functions

set -x

# Core casks
brew cask install flycut
defaults write com.generalarcade.flycut loadOnStartup -bool true

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

# Install alfred
brew cask install alfred

if [ ! appIsRunning "Alfred" ]; then
  
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

set +x
