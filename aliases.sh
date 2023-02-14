#!/bin/bash

DOCKER_TOOLS_ROOT="$HOME/docker-tools"

# build

alias drb='sudo docker build . --tag'

# print

alias drp='sudo docker ps'
alias drpa='sudo docker ps -a'

alias dri='sudo docker images'
alias dria='sudo docker images -a'

# run

alias drr='sudo docker run'

# remove (delete)

alias drdac="$DOCKER_TOOLS_ROOT/delete/all-containers.sh"
alias drdui="$DOCKER_TOOLS_ROOT/delete/untagged-images.sh"

# stop

alias drs='sudo docker stop'
alias drss="$DOCKER_TOOLS_ROOT/stop/using-image-repo-tag-substring.sh"

# inspect

alias driis="$DOCKER_TOOLS_ROOT/inspect/ip-address-using-image-repo-tag-substring.sh"
