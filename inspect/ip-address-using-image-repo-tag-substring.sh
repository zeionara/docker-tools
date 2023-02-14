#!/bin/bash

containers=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Id}}"))
images=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Image}}"))

for i in ${!containers[@]}; do
    tags=$(docker inspect ${images[$i]} --format "{{range .RepoTags}}{{.}}{{end}}")
    if grep -q "$1" <<< $tags; then
        if [ "$2" == '-v' ]; then
            sudo docker inspect ${containers[$i]} --format="{{ range \$key, \$value := .NetworkSettings.Networks}}{{\$value.IPAddress}} {{\$key}} $tags{{end}}"
        else
            sudo docker inspect ${containers[$i]} --format="{{ range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"
        fi
    fi
done
