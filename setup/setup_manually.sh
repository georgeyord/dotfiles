#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports
source ../.alias

instruct "Allow installations from unidentified developer

--> System Preferences
--> Security & Privacy
--> General Tab
--> click the little lock in the lower left corner to unlock the general preference pane
--> select the Anywhere radio button beneath Allow applications downloaded from
"

instruct "Add Greek as input source

--> System Preferences
--> Keyboard
--> Input sources
--> +
--> Greek
"

instruct "Install iMovie

--> open https://itunes.apple.com/gr/app/imovie/id408981434
--> Download
--> Install
"

cd ../iterm
instruct "Setup iTerm2

--> open iterm2 preferences
--> Change 'Load preferences from a custom folder or URL' to '$(pwd)'
"