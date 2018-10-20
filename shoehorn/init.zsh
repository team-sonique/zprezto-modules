#!/usr/bin/env zsh

typeset -gA APPLICATIONS
zstyle -a ':prezto:module:shoehorn' applications 'APPLICATIONS'

source "${0:h}/artifactory.zsh"
source "${0:h}/docker.zsh"
source "${0:h}/completion_helpers.zsh"
source "${0:h}/shoehorn.zsh"
