#!/bin/bash

if [[ -z $1 ]]; then
    echo "Target substring is empty, please pass some value"
    exit 1
fi

containers=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Id}}"))
images=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Image}}"))

n_stopped=0

for i in ${!containers[@]}; do
    if grep -q "$1" <<< $(docker inspect ${images[$i]} --format "{{.RepoTags}}"); then
        n_stopped=$((n_stopped + 1))
        sudo docker stop ${containers[$i]} >> /dev/null
    fi
done

echo "Stopped $n_stopped containers"
