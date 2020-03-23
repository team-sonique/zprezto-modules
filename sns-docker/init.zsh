DOCKER_CONFIG=~/Library/Group\ Containers/group.com.docker/settings.json

if [[ -e "${DOCKER_CONFIG}" ]] ; then
  CONFIG="$(jq -r '.filesharingDirectories = ( ( .filesharingDirectories + ["/data", "/logs"] ) | unique )' "${DOCKER_CONFIG}")"
  echo "${CONFIG}" >! "${DOCKER_CONFIG}"
fi

