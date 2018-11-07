#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.functions

set -x

brew cask install docker
if [ -n "${DOCKER_MOUNTABLE_HOST_FOLDER}" ]; then
    defaults write com.docker.docker NSNavLastRootDirectory "${DOCKER_MOUNTABLE_HOST_FOLDER}"
fi

brew install kubectl
brew install kops

brew install awscli
# brew cask install minikube

set +x
