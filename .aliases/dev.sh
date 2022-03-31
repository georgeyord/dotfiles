#!/usr/bin/env bash

alias tailf='tail -f'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

alias g='git'
alias gt='git'
alias gti='git'

alias ga='git add'
alias gc='git commit -am'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glb='git lb'
alias gp='git push'
alias gfp='git fetch -p'
alias gpatch='git commit --amend --no-edit'
alias gs='git st'
alias gwhat='git whatchanged'
alias grepnocomment='egrep -v "^\s*(#|$)"'
# alias gitlint='/usr/local/bin/gitlint -C ~/.gitlint'

alias timestamp='date +%s'

alias opt="cd /opt"

alias wh="which"
alias wtch="watch -d -n 15"

alias prp="pipenv run python"

function applescript() {
	if [[ -z "$1" ]] || [[ "$1" == "list" ]]; then
		echo "Available options:"
		ls ~/applescript/
		echo -e "\nUse '$0 list' for a list of available options"
	elif [[ "$1" == "help" ]]; then
		echo "Enhanced 'osascript', use '$0 list' for a list of available options"
	else
		osascript ~/applescript/$1
	fi
}

function ntlp() {
	sudo lsof -PiTCP -sTCP:LISTEN | awk '{print $2"\t"$3"\t"$1"\t\t"$9}'
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}";
	local ip=$(ipconfig getifaddr en1);
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}

# Compare original and gzipped file size
function gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

function clr() {
	$@ | ccze
}

function backup-plists() {
	if [ -n "${PLISTS_BACKUP_PATH}" ]; then
		TARGET_DIR="${PLISTS_BACKUP_PATH}"
	elif [ -n "${1}" ]; then
		TARGET_DIR="${1}"
	else
		echo "Directory target is missing as first argument, exiting..."
		return 1
	fi

	mkdir -p "${TARGET_DIR}"
	# rm -f "${TARGET_DIR}"/./*
	for FILE in /Users/user/Library/Preferences/*.plist ; do
		BASENAME="$(basename ${FILE})"
		echo "Reading ${BASENAME}..."
		defaults read ${FILE} > "${TARGET_DIR}/${BASENAME}"
	done
}

# Read more: https://github.com/ng-vu/tomato
function tomato-start() {
	run-once-in-background tomato -n=3 -colon=: -work=25m -short=300s -long=15m -uuid=4FB70D65-DB91-45AD-A604-E772C2BBB540 -port=12345 -command='terminal-notifier -title Pomodoro -message "Hey, time is over!" -sound default'
}

function whl() {
	while true; do
		$@
		date
		sleep "${S:-1}"
	done
}

function untilsuccess() {
	until $@; do
		date
		sleep "${S:-1}"
	done
}

# Broot for git: https://dystroy.org/blog/gg/
alias gg="br --conf ~/.config/broot/git-diff-conf.toml --git-status"

function git_owners() {
	git ls-files ${1:-} | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr
}
