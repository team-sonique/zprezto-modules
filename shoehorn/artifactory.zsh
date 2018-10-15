typeset -g _ARTIFACTORY="http://repo.sns.sky.com:8081/artifactory"
typeset -g _ARTIFACTORY_REPOSITORY="libs-releases-local"

non_docker_overrides=(
    luthor
)

function _get_latest_version {
   local app=$1
   local level=${2:-'dev'}

   local devRepo="libs-releases-local"
   local testRepo="test-releases-local"
   local prodRepo="production-releases-local"

   local repo appDescription releaseRepo appPath appType
   IFS=":" read appDescription releaseRepo appPath appType <<< ${APPLICATIONS[${app}]}

   if [[ ${level} == 'dev' ]]; then
       repo=${devRepo}
   else
       repo=${releaseRepo:-$testRepo}
   fi

   {
      function $0_version {
          aql="items.find({
            \"repo\": { \"\$eq\": \"$1\" },
            \"path\": { \"\$match\": \"$2/*\" },
            \"name\": { \"\$match\": \"*$3\" }
          })
          .include( \"name\", \"repo\", \"path\", \"created\")
          .sort({ \"\$desc\" : [\"created\"]})"

          response=$(curl -X POST -s -u team.sonique:password -H "Content-Type: text/plain" -d "${aql}" ${_ARTIFACTORY}/api/search/aql)
          path=`echo ${response} | jq  -r '.results[0].path'`
          echo ${path##*/}
      }

      local appVersion=$($0_version ${repo} ${appPath:-"sonique/${app}/${app}-deploy"} ${appType:-"bin.zip"})
      local propertiesVersion=$($0_version ${repo} "sonique/${app}/${app}-properties" "jar")

      echo "${appVersion}-${propertiesVersion}"

  } always {
      unfunction $0_version
  }
}
