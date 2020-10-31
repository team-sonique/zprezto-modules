function echoErr() {
  echo "$@" 1>&2;
}

function _get_latest_version {
   local app=$1
   local level=${2:-'dev'}
   {
      function $0_version {
        local response=$(http --verify=no --session=/tmp/shoehorn/gocd-session.json \
            GET "https://gocd-cicd.bmtapps.bskyb.com/go/api/pipelines/${1}/history"  \
            Authorization:'Bearer 6a8e21df1cafb7d4ef0aeb39aa177faf95d8313b' \
            Accept:'application/vnd.go.cd.v1+json' \
            Connection:'keep-alive')

          echo $(echo ${response} | jq -r ".pipelines[0] | .label")
      }

      local appVersion=$($0_version ${app})
      local propertiesVersion=$($0_version "${app}-properties" )

      echo "${appVersion}-${propertiesVersion}"

  } always {
      unfunction $0_version
  }
}