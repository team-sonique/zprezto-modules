#!/usr/bin/env zsh
typeset -g _ARTIFACTORY="http://repo.sns.sky.com:8081/artifactory"
typeset -g _SHOEHORN_VERSION=614
typeset -g _gocd_cache_minutes=5

    # app         "Description : signed-off-repo : artifact path : artifact type"
typeset -gA APPLICATIONS=( \
    aview         "AView" \
    hector        "Hector" \
    kiki          "Kiki" \
    optimusprimer "Optimus Primer" \
    raiden        "Raiden" \
    shovel        "Shovel" \
    superman      "Superman" \
    battenberg    "Battenberg:gocd" \
    bran          "Bran:production-releases-local:charts/bran-chart:.tgz" \
    bullwinkle    "Bullwinkle:production-releases-local:charts/bullwinkle-chart:.tgz" \
    doogal        "Doogal:gocd" \
    dudley        "Dudley:libs-releases-local:charts/dudley-chart:.tgz" \
    eclair        "Eclair:gocd" \
    erebor        "Erebor:gocd" \
    felix         "Felix:gocd" \
    ffestiniog    "Ffestiniog::sonique/ffestiniog/ffestiniog-core:bin.zip" \
    garibaldi     "Garibaldi:production-releases-local:charts/garibaldi-chart:.tgz" \
    gruffalo      "Gruffalo::sonique/gruffalo/gruffalo-build:bin.zip" \
    luthor        "Luthor::sonique/luthor/luthor-core:bin.zip" \
    marzipan      "Marzipan:libs-releases-local:charts/marzipan-chart:.tgz" \
    redqueen      "Redqueen:production-releases-local:charts/redqueen-chart:.tgz" \
    rocky         "Rocky:production-releases-local:charts/rocky-chart:.tgz" \
    roobarb       "Roobarb:production-releases-local:charts/roobarb-chart:.tgz" \
    smaug         "Smaug:gocd" \
)

source "${0:h}/artifactory.zsh"
source "${0:h}/gocd.zsh"
source "${0:h}/docker.zsh"
source "${0:h}/completion_helpers.zsh"
source "${0:h}/shoehorn.zsh"

mkdir -p /tmp/shoehorn/gocd
