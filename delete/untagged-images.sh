#!/bin/bash

sudo docker images -q -a |\
  xargs sudo docker inspect --format='{{index (split .Id ":") 1}}{{range $rt := .RepoTags}} {{$rt}} {{end}}' |\
  grep -v ':' |\
  xargs sudo docker rmi -f
