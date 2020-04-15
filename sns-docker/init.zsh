DOCKER_CONFIG=~/Library/Group\ Containers/group.com.docker/settings.json

if [[ -e "${DOCKER_CONFIG}" ]]; then
  BEFORE="$(md5 -q ${DOCKER_CONFIG})"
  CONFIG="$(jq -r '.filesharingDirectories = ( ( .filesharingDirectories + ["/data", "/logs"] ) | unique )' "${DOCKER_CONFIG}")"
  AFTER="$(echo ${CONFIG} | md5 -q)"

  if [[ "${BEFORE}" != "${AFTER}" ]]; then
    echo "${CONFIG}" >! "${DOCKER_CONFIG}"
    echo "$FX[bold]$FG[red]DOCKER CONFIG FILE UPDATED!$FG[white]$FX[no-bold] - please restart docker!"
  fi
fi
