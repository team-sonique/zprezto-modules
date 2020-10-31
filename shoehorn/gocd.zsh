function _get_latest_version_gocd {
    local app=$1 level=${2:-'dev'} shoeTmp="/tmp/shoehorn/gocd"
    {
        function $0_getVersion {
            local stage=${1} fileName=${app}-${2}
            echo $(jq -r "[.pipelines[] | select( .stages[] | .name == \"${stage}\" and .status == \"Passed\")][0].label" ${shoeTmp}/${fileName%-}.json 2> /dev/null)
        }

        if [[ ( ! -e ${shoeTmp}/${app}.json ) || -z $(find ${shoeTmp}/${app}.json -mmin -${_gocd_cache_minutes}) ]]; then
            local _gocd_token
            zstyle -s ':prezto:module:shoehorn' gocd-token '_gocd_token'

            $(curl -s \
              -H "Authorization: Bearer ${_gocd_token}" \
              -H "Accept: application/vnd.go.cd.v1+json" \
              -H "Connection: keep-alive" \
              -c ${shoeTmp}/gocd-cookies.txt -b /${shoeTmp}/gocd-cookies.txt \
              "https://gocd-cicd.bmtapps.bskyb.com/go/api/pipelines/${app}{,-properties,-deployment}/history" \
              -o "${shoeTmp}/${app}#1.json")
        fi

        if [[ ${level} == 'dev' ]]; then
            local appVersion=$($0_getVersion "CI")
            local propertiesVersion=$($0_getVersion "CI" "properties")

            echo "${appVersion}-${propertiesVersion}"
        else
            local version=$($0_getVersion "completed" "deployment")
            echo "${version%-*}"
        fi

  } always {
      unfunction $0_getVersion
  }
}