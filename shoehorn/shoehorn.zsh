function _print_if_no_pipe {
    if [ -t 1 ]; then
        echo $@
    fi
}

function _run_shoehorn {
    zstyle -s ':prezto:module:shoehorn' version '_shoehorn_version'

    local shoehorn_filename="shoehorn-${_shoehorn_version}-jar-with-dependencies.jar"
    local shoehorn_jar_path="${TMPDIR}/${shoehorn_filename}"
    echo $shoehorn_jar_path
    _print_if_no_pipe "$FX[bold]$FG[yellow]Using Shoehorn version ${_shoehorn_version}$FG[white]$FX[no-bold]"

    if [ ! -f ${shoehorn_jar_path} ]; then
        _print_if_no_pipe "$FX[bold]$FG[yellow]Downloading Shoehorn...$FG[white]$FX[no-bold]"
        curl -s "${_ARTIFACTORY}/${_ARTIFACTORY_REPOSITORY}/sonique/shoehorn/shoehorn/${_shoehorn_version}/${shoehorn_filename}" -o ${shoehorn_jar_path}
        _print_if_no_pipe "$FX[bold]$FG[yellow]Done$FG[white]$FX[no-bold]"
    fi

    java -cp ${shoehorn_jar_path} $@
}

function _is_in_docker_repo {
    local app="$1"

    echo ${app}
    if [[ ${non_docker_overrides[(r)${app}]} == ${app} ]] ; then
        return 1
    else
        local imageTags=$(docker run --rm -v ~/.gcloud/:/gcloud/:ro  google/cloud-sdk:alpine bash -c "gcloud auth activate-service-account --key-file=/gcloud/GCR_SERVICE_ACCOUNT_KEY.json && gcloud container images list-tags ${DOCKER_REGISTRY}/${app}")

        if [[ -n ${imageTags} ]]; then
            return 0
        else
            return 1
        fi
    fi
}

function _shoehorn_local {
    local goal="$1"
    local app="$2"
    local version="${3#*-}"
    local env="${3%%-*}"

    shoehorn ${goal} ${app} ${version} ${env}
}

function encrypt {
    _run_shoehorn shoehorn.Encrypt $@
}

function decrypt {
    _run_shoehorn shoehorn.Decrypt $@
}
