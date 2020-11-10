if [[ ! -e "${0:h}/external" ]]; then
  mkdir ${0:h}/external
fi

ln -sf /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion ${0:h}/external/_docker

fpath=("${0:h}/external" $fpath)
