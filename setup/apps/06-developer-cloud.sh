#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";

source ../../.exports
source ../../.alias

set -x

hash docker 2> /dev/null 2> /dev/null || brew install --cask docker
if [ -n "${DOCKER_MOUNTABLE_HOST_FOLDER}" ]; then
    defaults write com.docker.docker NSNavLastRootDirectory "${DOCKER_MOUNTABLE_HOST_FOLDER}"
fi

hash kubectl 2> /dev/null || brew install kubectl
is-installed-application "Kube Forwarder" 2> /dev/null || brew install --cask kube-forwarder
mkdir -p ~/.kube

hash kops 2> /dev/null || brew install kops
hash ctop 2> /dev/null || brew install ctop
hash minikube 2> /dev/null || brew install minikube

# Amazon AWS
hash aws 2> /dev/null || ( \
  brew install awscli && \
  instruct "Run 'aws configure'"
)
hash mssh 2> /dev/null || pip install ec2instanceconnectcli

# Google cloud
hash gcloud 2> /dev/null || ( brew install --cask google-cloud-sdk )

# Digital ocean
hash doctl 2> /dev/null || ( brew install doctl )

# Terraform
hash terraform 2> /dev/null || (
  brew install terraform
  brew install hashicorp/tap/terraform-ls
)

# ArgoCD cli
# https://argoproj.github.io/argo-cd/cli_installation/
hash argocd 2> /dev/null || brew install argocd

hash kubectl-krew 2> /dev/null || ( \
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://storage.googleapis.com/krew/v0.2.1/krew.{tar.gz,yaml}" &&
  tar zxvf krew.tar.gz &&
  ./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" install \
    --manifest=krew.yaml --archive=krew.tar.gz
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
kubectl krew install exec-as
kubectl krew install ingress-nginx
kubectl krew install get-all
kubectl krew install resource-capacity
kubectl krew install sniff
kubectl krew install view-utilization

# brew install --cask minikube
hash kubetail 2> /dev/null || ( brew tap johanhaleby/kubetail && brew install kubetail )
# Tail multiple pods on Kubernetes
# https://github.com/wercker/stern
hash stern 2> /dev/null || ( brew install stern )
# https://github.com/helm/helm
hash helm 2> /dev/null || brew install helm
hash helm2 2> /dev/null || (
  brew install helm@2
  ln -s /usr/local/opt/helm@2/bin/helm /usr/local/bin/helm2
  ln -s /usr/local/opt/helm@2/bin/tiller /usr/local/bin/tiller
  ln -s /usr/local/bin/helm /usr/local/bin/helm3
)
hash yamllint 2> /dev/null || brew install yamllint
# Render helm charts to a directory
# https://github.com/databus23/schelm
hash schelm 2> /dev/null || go get -u github.com/databus23/schelm
# K9s: htop for Kubernetes
# https://github.com/derailed/k9s
hash k9s 2> /dev/null || ( brew tap derailed/k9s && brew install k9s )
# Popeye scans live Kubernetes cluster and reports potential issues with deployed resources and configurations
# https://github.com/derailed/popeye
hash popeye 2> /dev/null || ( brew tap derailed/popeye && brew install popeye )
# kubectx: manage and switch between kubectl contexts
# kubens: switch between Kubernetes namespaces
# https://github.com/ahmetb/kubectx#installation
hash kubectx 2> /dev/null || ( brew install kubectx )

mkdir -p "$(helm home)/plugins"
helm plugin list | grep "^env" >/dev/null 2>&1 || helm plugin install https://github.com/adamreese/helm-env
helm plugin list | grep "^diff" >/dev/null 2>&1 || (
  helm plugin install https://github.com/databus23/helm-diff --version master
  cd "$(helm home)/plugins/helm-diff"
  make bootstrap build
)

set +x
