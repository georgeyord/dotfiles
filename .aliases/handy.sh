#!/usr/bin/env bash

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

alias youtube-to-mp3='youtube-dl -x --audio-format=mp3'

alias weather='ansiweather'

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

function instruct() {
    echo -e "*** ${1}"
    read -n 1 -s -r -p "Press any key to continue"
}

function is-running() {
	COUNT="$(ps aux | grep "${1}" | wc -l)"
	test "${COUNT}" -ne "1"
	return $?
}

function is-installed-application() {
	ls -lsa /Applications | grep $1 > /dev/null
}

function run-once-in-background() {
	CHECK="$(basename ${1})"
	echo "Checking for ${CHECK}"
	pgrep "${CHECK}" 2>&1 > /dev/null
	if [ $? -eq 1 ]; then
		echo "Inititating command in the background: ${@}"
		test -d "/var/log/background" || ( sudo mkdir -p "/var/log/background" && sudo chmod -R 777 "/var/log/background/" )
		${@} > "/var/log/background/${CHECK}.log" 2>&1 &
		# ${@} &
	# else
	# 	echo "Command ${CHECK} is running"
	fi
}

function download-to-tmp() {
	set -e
	TEMP_TARGET="/tmp/$(date +'%s')"
	mkdir -p "${TEMP_TARGET}"
	cd "${TEMP_TARGET}"
	# echo "Files will be saved in $(pwd)..."
	curl -L -J -O "${1}" || exit 1
  TEMP_FILE="$(ls | head -n 1)"
  echo "${TEMP_TARGET}/${TEMP_FILE}"
}

function download-and-add-to-path() {
	set -e
	TEMP_FILE="$(download-to-tmp $1)"
	chmod +x "${TEMP_FILE}"
	TARGET_PATH="/usr/local/bin"
  sudo mv "${TEMP_FILE}" "${TARGET_PATH}"
	BASENAME="$(basename ${TEMP_FILE})"
	which "${BASENAME}" 2>&1 > /dev/null
	RESULT=$?
	if [ "${RESULT}" == "0" ]; then
		echo "'${BASENAME}' was added successfully to path"
	else
		echo "Adding '${BASENAME}' to path failed..."
		exit 1
	fi
}

function backup-file() {
	cp "${1}" "${1}.$(date +%s).bak"
}

function download-and-open() {
	TEMP_FILE="$(download-to-tmp $1)"
  open "${TEMP_FILE}"
  instruct "Finalize the installation manually..."
}

function whatsmyip() {
	INTERNAL_IP="$(ifconfig | grep inet | grep -v inet6 | grep -v 127 | awk '{print $2}')"
	EXTERNAL_IP="$(curl -qsSL ipecho.net/plain)"

	echo -e "Internal: ${INTERNAL_IP}"
	echo -e "External: ${EXTERNAL_IP}"
}

alias hostname_i='whatsmyip'

function weather-at() {
	clear

	CMD="ansiweather"
	if [ -n "${1}" ]; then
		CMD="${CMD} -l ${1}"
	fi
	if [ -n "${2}" ]; then
		CMD="${CMD} -f ${2}"
	fi

	eval "${CMD}"
}

# Search with Fuzzy Finder
# An efficient way of searching is using bashhub in combination with fzf. Put this in your .bashrc.
function bhf {
  eval $(bh | fzf)
}