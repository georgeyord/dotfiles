#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports

if [ -f ./repos.csv ]; then
  while IFS=, read -r REPO_PATH REPO_URL; do
    if [[ "${REPO_PATH}" != "" ]]; then
      if [ ! -d "${REPO_PATH}" ]; then
        echo "Git clone '${REPO_URL}' to '${REPO_PATH}'"
        REPO_BASE_PATH="$(dirname ${REPO_PATH})"

        mkdir -p "${REPO_BASE_PATH}"
        cd "${REPO_BASE_PATH}"
        git clone "${REPO_URL}"
      else
        echo "Git repo '${REPO_URL}' already exists in '${REPO_PATH}', moving on..."
      fi
    fi
  done < ./repos.csv
else
  echo "CSV file './repos.csv' not found, repos cloning will not be performed"
  read -n 1 -s -r -p "Press any key to continue"
fi