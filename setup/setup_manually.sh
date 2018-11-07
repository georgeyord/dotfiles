#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports
source ../.functions

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
