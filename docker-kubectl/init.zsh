#!/usr/bin/env zsh

export DOCKER_KUBECTL_IMAGE="repo.sns.sky.com:8186/dost/docker-kubectl:1.16-latest"

if [ ! -d ~/.k ] ; then
  mkdir ~/.k
  cp ${0:h}/files/.* ~/.k/.
fi