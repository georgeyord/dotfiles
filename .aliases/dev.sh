#!/usr/bin/env bash

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
alias gpatch='git commit --amend --no-edit'
alias gs='git st'

alias timestamp='date +%s'
