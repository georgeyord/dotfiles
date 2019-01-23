#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash docker || brew cask install docker
if [ -n "${DOCKER_MOUNTABLE_HOST_FOLDER}" ]; then
    defaults write com.docker.docker NSNavLastRootDirectory "${DOCKER_MOUNTABLE_HOST_FOLDER}"
fi

hash kubectl || brew install kubectl
mkdir -p ~/.kube

hash kops || brew install kops
hash ctop || brew install ctop

hash aws || ( \
  brew install awscli && \
  instruct "Run 'aws configure' and use the credentials from https://gitlab.com/Centech/centaur-tech/wikis/devops/setup-kops-awscli#setup-aws-cli"
)

# brew cask install minikube
hash kubetail || ( brew tap johanhaleby/kubetail && brew install kubetail )

set +x
