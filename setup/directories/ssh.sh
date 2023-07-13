#!/usr/bin/env bash
set -e
# set -x

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports

mkdir -p ~/.ssh
cd ~/.ssh

function setupSshKeys() {
  echo "SSH_KEYS_PATH=${SSH_KEYS_PATH}"
  if [ -d "${SSH_KEYS_PATH}" ]; then
    echo "Ssh keys '${SSH_KEYS_PATH}' updated"
    cp -n "${SSH_KEYS_PATH}"id_rsa* .
    chmod 400 id_rsa*
  elif [ -z "${SSH_KEYS_PATH}" ]; then
    echo "Env variable SSH_KEYS_PATH not set, ssh keys setup will not be performed"
    read -n 1 -s -r -p "Press any key to continue"
  else
    echo "Ssh keys path '${SSH_KEYS_PATH}' not found"
    read -n 1 -s -r -p "Press any key to continue"
  fi
}

function setupSshConfigs() {
  echo "SSH_KEYS_CONFIG=${SSH_KEYS_CONFIG}"
  if [ -f "${SSH_KEYS_CONFIG}" ]; then
    echo "Ssh config '${SSH_KEYS_CONFIG}' updated"
    ln -sf "${SSH_KEYS_CONFIG}" config
  elif [ -z "${SSH_KEYS_CONFIG}" ]; then
    echo "Env variable SSH_KEYS_CONFIG not set, ssh config setup will not be performed"
    read -n 1 -s -r -p "Press any key to continue"
  else
    echo "Ssh config '${SSH_KEYS_CONFIG}' not found"
    read -n 1 -s -r -p "Press any key to continue"
  fi
}

function setupWorkSshKeys() {
  if [ -d "${SSH_WORK_KEYS_PATH}" ]; then
    cp -n "${SSH_WORK_KEYS_PATH}"id_rsa devops.pem
    chmod 400 ~/.ssh/devops.pem
  fi
}

setupWorkSshKeys
setupSshConfigs
setupSshKeys