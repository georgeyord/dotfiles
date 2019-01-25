#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports

if [ -d "${SSH_KEYS_PATH}" ]; then
  mkdir -p ~/.ssh
  cd ~/.ssh

  cp -n "${SSH_KEYS_PATH}"id_rsa* .
  chmod 400 id_rsa*


  ln -sf "${SSH_KEYS_PATH}"config .
elif [ -z "${SSH_KEYS_PATH}" ]; then
  echo "Env variable SSH_KEYS_PATH not set, ssh keys setup will not be performed"
  read -n 1 -s -r -p "Press any key to continue"
else
  echo "Ssh keys path '${SSH_KEYS_PATH}' not found"
  read -n 1 -s -r -p "Press any key to continue"
fi

if [ -d "${SSH_WORK_KEYS_PATH}" ]; then
  cp -n "${SSH_WORK_KEYS_PATH}"id_rsa devops.pem
  chmod 400 ~/.ssh/devops.pem
fi