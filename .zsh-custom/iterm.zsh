#!/bin/bash

### SET TOUCHBAR FUNCTION LABELS PER APPLICATION ###

NAME="default"
it2setkeylabel set F1 "F1"
it2setkeylabel set F2 "F2"
it2setkeylabel set F3 "F3"
it2setkeylabel set F4 "F4"
it2setkeylabel set F5 "F5"
it2setkeylabel set F6 "F6"
it2setkeylabel set F7 "F7"
it2setkeylabel set F8 "F8"
it2setkeylabel set F9 "F9"
it2setkeylabel set F10 "10"
it2setkeylabel set F11 "11"
it2setkeylabel set F13 "13"
it2setkeylabel set F14 "14"
it2setkeylabel set F15 "15"
it2setkeylabel set F16 "16"
it2setkeylabel set F17 "17"
it2setkeylabel push "${NAME}"

NAME="byobu"
it2setkeylabel set F1 "F1"
it2setkeylabel set F2 "New"
it2setkeylabel set F3 "<-"
it2setkeylabel set F4 "->"
it2setkeylabel set F5 "F5"
it2setkeylabel set F6 "F6"
it2setkeylabel set F7 "Scrollback"
it2setkeylabel set F8 "Rename"
it2setkeylabel set F9 "Menu"
it2setkeylabel set F10 "10"
it2setkeylabel set F11 "11"
it2setkeylabel set F13 "13"
it2setkeylabel set F14 "14"
it2setkeylabel set F15 "15"
it2setkeylabel set F16 "16"
it2setkeylabel set F17 "17"
it2setkeylabel push "${NAME}"

function setGitStatusInTouchbar() {
    it2setkeylabel set status "$(test -d .git && (git rev-parse --abbrev-ref HEAD) || (echo -n "Not a repo"))"
}

function setFnLabels() {
<<<<<<< HEAD
    env | grep BYOBU > /dev/null
    IS_BYOBU_ENABLED=$?

    if [ "${IS_BYOBU_ENABLED}" -eq 0 ]; then
        it2setkeylabel pop "byobu"
    else
        it2setkeylabel pop "default"
    fi
}

function modifyTouchbar() {
    # setFnLabels
=======
    it2setkeylabel pop "default"
}

function modifyTouchbar() {
>>>>>>> Customize zsh promt
    setGitStatusInTouchbar
}
