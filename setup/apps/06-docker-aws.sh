#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash docker 2> /dev/null 2> /dev/null || brew cask install docker
if [ -n "${DOCKER_MOUNTABLE_HOST_FOLDER}" ]; then
    defaults write com.docker.docker NSNavLastRootDirectory "${DOCKER_MOUNTABLE_HOST_FOLDER}"
fi

hash kubectl 2> /dev/null || brew install kubectl
mkdir -p ~/.kube

hash kops 2> /dev/null || brew install kops
hash ctop 2> /dev/null || brew install ctop

hash aws 2> /dev/null || ( \
  brew install awscli && \
  instruct "Run 'aws configure' and use the credentials from https://gitlab.com/Centech/centaur-tech/wikis/devops/kops/setup-kops-awscli"
)

# brew cask install minikube
hash kubetail 2> /dev/null || ( brew tap johanhaleby/kubetail && brew install kubetail )
# https://github.com/helm/helm
hash helm 2> /dev/null || brew install kubernetes-helm
# https://github.com/azure/draft
hash draft 2> /dev/null || ( brew tap azure/draft && brew install azure/draft/draft )
hash schelm 2> /dev/null || go get -u github.com/databus23/schelm

set +x
