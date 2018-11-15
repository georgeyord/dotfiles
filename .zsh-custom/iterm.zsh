#!/bin/bash

### SET TOUCHBAR FUNCTION LABELS PER APPLICATION ###

NAME="default"
~/.iterm2/it2setkeylabel set F1 "F1"
~/.iterm2/it2setkeylabel set F2 "F2"
~/.iterm2/it2setkeylabel set F3 "F3"
~/.iterm2/it2setkeylabel set F4 "F4"
~/.iterm2/it2setkeylabel set F5 "F5"
~/.iterm2/it2setkeylabel set F6 "F6"
~/.iterm2/it2setkeylabel set F7 "F7"
~/.iterm2/it2setkeylabel set F8 "F8"
~/.iterm2/it2setkeylabel set F9 "F9"
~/.iterm2/it2setkeylabel set F10 "10"
~/.iterm2/it2setkeylabel set F11 "11"
~/.iterm2/it2setkeylabel set F13 "13"
~/.iterm2/it2setkeylabel set F14 "14"
~/.iterm2/it2setkeylabel set F15 "15"
~/.iterm2/it2setkeylabel set F16 "16"
~/.iterm2/it2setkeylabel set F17 "17"
~/.iterm2/it2setkeylabel push "${NAME}"

NAME="byobu"
~/.iterm2/it2setkeylabel set F1 "F1"
~/.iterm2/it2setkeylabel set F2 "New"
~/.iterm2/it2setkeylabel set F3 "<-"
~/.iterm2/it2setkeylabel set F4 "->"
~/.iterm2/it2setkeylabel set F5 "F5"
~/.iterm2/it2setkeylabel set F6 "F6"
~/.iterm2/it2setkeylabel set F7 "Scrollback"
~/.iterm2/it2setkeylabel set F8 "Rename"
~/.iterm2/it2setkeylabel set F9 "Menu"
~/.iterm2/it2setkeylabel set F10 "10"
~/.iterm2/it2setkeylabel set F11 "11"
~/.iterm2/it2setkeylabel set F13 "13"
~/.iterm2/it2setkeylabel set F14 "14"
~/.iterm2/it2setkeylabel set F15 "15"
~/.iterm2/it2setkeylabel set F16 "16"
~/.iterm2/it2setkeylabel set F17 "17"
~/.iterm2/it2setkeylabel push "${NAME}"

function setGitStatusInTouchbar() {
    ~/.iterm2/it2setkeylabel set status "$(test -d .git && (git rev-parse --abbrev-ref HEAD) || (echo -n "Not a repo"))"
}

function setFnLabels() {
    env | grep BYOBU > /dev/null
    IS_BYOBU_ENABLED=$?

    if [ "${IS_BYOBU_ENABLED}" -eq 0 ]; then
        ~/.iterm2/it2setkeylabel pop "byobu"
    else
        ~/.iterm2/it2setkeylabel pop "default"
    fi
}

function modifyTouchbar() {
    setGitStatusInTouchbar
}
