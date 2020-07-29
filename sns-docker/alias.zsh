alias gcrLogin='cat ~/.gcloud/GCR_SERVICE_ACCOUNT_KEY.json | docker login -u _json_key --password-stdin eu.gcr.io'
alias gcrLogout='docker logout eu.gcr.io'
