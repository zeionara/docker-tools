#!/bin/bash

DOCKER_TOOLS_ROOT="$HOME/docker-tools"

. $DOCKER_TOOLS_ROOT/docker-compose.sh

# build

alias drb='sudo docker build . --tag'

# delete (remove)

alias drdac="$DOCKER_TOOLS_ROOT/delete/all-containers.sh"
alias drdui="$DOCKER_TOOLS_ROOT/delete/untagged-images.sh"

# exec

alias dre='sudo docker exec'

dreb () {
    sudo docker exec -it $1 /bin/bash
}

# run

alias drr='sudo docker run'

# stop

alias drs='sudo docker stop'
alias drss="$DOCKER_TOOLS_ROOT/stop/using-image-repo-tag-substring.sh"

# view (inspect)

alias drv='sudo docker ps'
alias drva='sudo docker ps -a'

alias drvi='sudo docker images'
alias drvia='sudo docker images -a'

alias drvis="$DOCKER_TOOLS_ROOT/inspect/ip-address-using-image-repo-tag-substring.sh"

# up (start)

alias dru='sudo docker start'
