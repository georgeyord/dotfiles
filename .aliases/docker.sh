#!/bin/sh

# Reference: https://hackernoon.com/handy-docker-aliases-4bd85089a3b8

alias dc='docker-compose'
alias dm='docker-machine'
alias dmx='docker-machine ssh'
alias dk='docker'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dkl='docker logs'
alias dklf='docker logs -f'
alias dkflush='docker rm `docker ps --no-trunc -aq`'
alias dkflush2='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dkt='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"'
alias dkps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"

dkln() {
  docker logs -f `docker ps | grep $1 | awk '{print $1}'`
}

dkp() {
  if [ ! -f .dockerignore ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LABEL="$1/$NAME:$VERSION"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} -t $LABEL .

  read -p "Press enter to publish"
  docker push $LABEL
}

dkpnc() {
  if [ ! -f .dockerignore ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LABEL="$1/$NAME:$VERSION"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} --no-cache=true -t $LABEL .
  read -p "Press enter to publish"
  docker push $LABEL
}

dkpl() {
  if [ ! -f .dockerignore ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LATEST="$1/$NAME:latest"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} --no-cache=true -t $LATEST .
  read -p "Press enter to publish"
  docker push $LATEST
}

dkclean() {
  docker rm $(docker ps --all -q -f status=exited)
  docker volume rm $(docker volume ls -qf dangling=true)
}

dkprune() {
  docker system prune -af
}

dktop() {
  docker stats --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}  {{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"
}

dkstats() {
  if [ $# -eq 0 ]
    then docker stats --no-stream;
    else docker stats --no-stream | grep $1;
  fi
}

dke() {
  docker exec -it $1 /bin/sh
}

dkexe() {
  docker exec -it $1 $2
}

dkreboot() {
  osascript -e 'quit app "Docker"'
  sleep 2
  open -a Docker
  echo "Restarting Docker engine"
  sleep 120
}

dkstate() {
  docker inspect $1 | jq .[0].State
}

dksb() {
  docker service scale $1=0
  sleep 2
  docker service scale $1=$2
}

mongo() {
  mongoLabel=`docker ps | grep mongo | awk '{print $NF}'`
  docker exec -it $mongoLabel mongo "$@"
}

redis() {
  redisLabel=`docker ps | grep redis | awk '{print $NF}'`
  docker exec -it $redisLabel redis-cli
}

alias kb-events='kubectl get events --watch --sort-by=.metadata.creationTimestamp'
alias kb-tail='kubetail --since 1m --timestamps --colored-output'
alias kb-run-temp='kubectl run --rm -i --tty --restart=Never temp'
alias kb-run-curl='kubectl run --rm -i --tty --restart=Never temp --image=byrnedo/alpine-curl '

function kb-dashboard() {
	clear && \
	export KOPS_STATE_STORE=s3://state.kops.store.centaur && \
	echo "Admin password: $(kops get secrets admin --type secret -oplaintext)" | grep password && \
	echo -e '\nKubernetes dashboard: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/service?namespace=_all'
	kubectl proxy > /dev/null
}
