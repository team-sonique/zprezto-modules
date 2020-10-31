#!/usr/bin/env zsh

typeset -gA APPLICATIONS
typeset -g SHOEHORN_VERSION=609

zstyle -a ':prezto:module:shoehorn' applications 'APPLICATIONS'

source "${0:h}/artifactory.zsh"
#source "${0:h}/gocd.zsh"
source "${0:h}/docker.zsh"
source "${0:h}/completion_helpers.zsh"
source "${0:h}/shoehorn.zsh"

mkdir -p /tmp/shoehorn
