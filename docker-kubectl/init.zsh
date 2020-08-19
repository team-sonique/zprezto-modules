#!/usr/bin/env zsh

export DOCKER_KUBECTL_IMAGE="eu.gcr.io/skyuk-uk-ukiss-registry-prod/docker-kubectl:1.16-latest"

if [ ! -d ~/.k ] ; then
  mkdir ~/.k
  cp ${0:h}/files/.* ~/.k/.
fi