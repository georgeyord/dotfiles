#!/usr/bin/env bash
set -e

mkdir -p .ssh
cd .ssh

cp ~/Dropbox/Dev/Private/ssh_keys/aio/id_rsa* .
chmod 400 id_rsa*

ln -s ~/Dropbox/Dev/Private/ssh_keys/aio/config .
