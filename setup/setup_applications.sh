#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports
source ../.alias

function runApply() {
    echo -e "*** Applying '$(basename ${1})'..."
    read -n 1 -s -r -p "Press any key to continue"
    source ${1}
}

for ITEM in ./apps/*; do
    runApply "${ITEM}"
done