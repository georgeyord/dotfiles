#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

source ../.exports
source ../.functions

function runApply() {
    echo -e "*** Applying '${1}'..."
    source ${1}
}

for ITEM in ./apps/*; do
    runApply "${ITEM}"
done