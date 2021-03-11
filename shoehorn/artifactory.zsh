
non_docker_overrides=(
    luthor
)

function echoErr() { echo "$@" 1>&2; }

function _get_latest_version_af {
   local app=$1 level=${2:-'dev'} shoeTmpFile="/tmp/shoehorn/af/${1}.json"

   local devRepo="libs-releases-local"
   local prodRepo="production-releases-local"

   local repo appDescription releaseRepo appPath appType
   IFS=":" read appDescription releaseRepo appPath appType <<< ${APPLICATIONS[${app}]}

   {
      function $0_version {
         local path=$(jq -r  "[ .results[] | select(.repo == \"${1}\") | select(.path | contains(\"${2}\")) ][0].path" "${shoeTmpFile}" 2> /dev/null)
         echo "${path##*/}"
      }

      if [[ ( ! -e ${shoeTmpFile} ) || -z $(find ${shoeTmpFile} -mmin -${_af_cache_minutes}) ]]; then
        curl -X POST \
            --insecure -s \
            -u "team.sonique:password" \
            -H "Content-Type: text/plain" \
            -d "items.find({
                  \"repo\": { \"\$eq\": \"libs-releases\" },
                  \"\$or\": [
                    {
                      \"\$and\" : [
                        { \"path\": { \"\$match\": \"${appPath:-"sonique/${app}/${app}-deploy"}/*\" } },
                        { \"name\": { \"\$match\": \"*${appType:-"bin.zip"}\" } }
                      ]
                    },
                    {
                       \"\$and\" : [
                         { \"path\": { \"\$match\": \"sonique/${app}/${app}-properties/*\" } },
                         { \"name\": { \"\$match\": \"*.jar\" } }
                       ]
                   }
                  ],
                  \"type\": { \"\$eq\": \"file\" }
                })
                .include( \"repo\", \"path\", \"name\", \"created\" )
                .sort({ \"\$desc\" : [\"created\"]})
                " \
            "${_ARTIFACTORY}/api/search/aql" \
            -o "${shoeTmpFile}"

      fi

      if [[ ${level} == 'dev' ]]; then
         repo=${devRepo}
      else
         repo=${releaseRepo:-$prodRepo}
      fi

      local appVersion=$($0_version ${repo} "${appPath}")
      local propertiesVersion=$($0_version ${repo} "properties")

      echo "${appVersion}-${propertiesVersion}"

  } always {
      unfunction $0_version
  }
}
