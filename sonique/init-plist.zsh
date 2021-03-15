
if [[ ! ${commands[xq]} ]]; then
  echo "${FG[red]}${FX[bold]} PList loading Requires xq ${FG[none]}${FX[none]}"
  return 1;
fi

pushd "${0:h}/plist" || exit

for i in *.plist; do
    agentFile="${HOME}/Library/LaunchAgents/${i}"
    if [[ -e ${agentFile} ]]; then
      NEW=$(md5 -q "${i}")
      EXISTING=$(md5 -q "${agentFile}")
      if [[ "${NEW}" != "${EXISTING}" ]]; then
         echo "${FG[red]}${FX[bold]}New data for ${i} Launch Agent${FG[none]}${FX[none]}"
         cp "${i}" "${agentFile}"
         key=$(xq -r ".plist.dict.string" setenv.MAVEN_OPTS.plist)
         /bin/launchctl remove "${key}"
         /bin/launchctl load -w "${agentFile}"
      fi
    else
       echo "${FG[yellow]}Loading ${i} Launch Agent${FG[none]}"
       cp "${i}" "${agentFile}"
       /bin/launchctl load -w "${agentFile}"
    fi
done

popd || true