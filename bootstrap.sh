#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
	rsync \
		--exclude ".git/" \
		--exclude "*.TODO" \
		--exclude ".history" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "plists" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "setup/" \
		-avh --no-perms . ~;
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
