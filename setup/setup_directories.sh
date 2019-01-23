#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports

function runApply() {
    echo -e "*** Applying '$(basename ${1})'..."
    source ${1}
}

for ITEM in ./directories/*; do
    runApply "${ITEM}"
done