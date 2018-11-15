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

git_status_for_touchbar() {
  source /opt/codebase/others/zsh-git-prompt/zshrc.sh
  precmd_update_git_vars
  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    DELIMETER=" "
    STATUS="$GIT_BRANCH"
    
    if [ "$GIT_BEHIND" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER↓$GIT_BEHIND"
    fi
    if [ "$GIT_AHEAD" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER↑$GIT_AHEAD"
    fi
    if [ "$GIT_STAGED" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER●$GIT_STAGED"
    fi
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER✖$GIT_CONFLICTS"
    fi
    if [ "$GIT_CHANGED" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER✚$GIT_CHANGED"
    fi
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      STATUS="$STATUS$DELIMETER…$GIT_UNTRACKED"
    fi
    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      STATUS="$STATUS$DELIMETER✔"
    fi
    echo "$STATUS"
  fi
}

function setGitStatusInTouchbar() {
    ~/.iterm2/it2setkeylabel set status "$(git_status_for_touchbar)"
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
