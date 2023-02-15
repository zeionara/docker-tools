#!/bin/bash

. $HOME/docker-tools/util/quit.sh

containers=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Id}}" 2> /dev/null)) || quit 'No running containers'
images=($(sudo docker ps -q | xargs sudo docker inspect --format="{{.Image}}"))

port_format=$(echo '{{ range $key, $value := .NetworkSettings.Ports }}{{$key}} <- {{ range $value }}{{ .HostIp }}:{{ .HostPort }} {{ end }}{{ end }}')

for i in ${!containers[@]}; do
    if [[ -z $1 ]]; then
        tags=$(docker inspect ${images[$i]} --format "{{range .RepoTags}}{{.}}{{end}}")
        ports=$(sudo docker inspect ${containers[$i]} --format="$port_format")
        sudo docker inspect ${containers[$i]} --format="{{ range \$key, \$value := .NetworkSettings.Networks}}{{\$value.IPAddress}} {{\$key}} $tags $ports{{end}}"
    else
        if grep -q "$1" <<< $tags; then
            sudo docker inspect ${containers[$i]} --format="{{ range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"
        fi
    fi
done
