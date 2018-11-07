#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports

cd "${HOME}"

git init

if [ ! -f ~/.gitignore ]; then
  echo "
	.CFUserTextEncoding
	.Trash/
	Applications/
	Desktop/
	Documents/
	Downloads/
	Dropbox/
	Library/
	Movies/
	Music/
	Pictures/
	Public/
  " > .gitignore
fi
