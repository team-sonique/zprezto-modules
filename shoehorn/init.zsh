#!/usr/bin/env zsh
typeset -g _ARTIFACTORY="http://repo.sns.sky.com:8081/artifactory"
typeset -g _SHOEHORN_VERSION=614
typeset -g _gocd_cache_minutes=5

    # app         "Description : signed-off-repo : artifact path : artifact type"
typeset -gA APPLICATIONS=( \
    aview         "AView" \
    battenberg    "Battenberg:gocd" \
    bullwinkle    "Bullwinkle:production-releases-local:charts/bullwinkle-chart:.tgz" \
    bran          "Bran:gocd" \
    doogal        "Doogal:gocd" \
    dudley        "Dudley:gocd" \
    eclair        "Eclair:gocd" \
    erebor        "Erebor:gocd" \
    felix         "Felix:gocd" \
    ffestiniog    "Ffestiniog::sonique/ffestiniog/ffestiniog-core:bin.zip" \
    garibaldi     "Garibaldi:production-releases-local:charts/garibaldi-chart:.tgz" \
    gruffalo      "Gruffalo::sonique/gruffalo/gruffalo-build:bin.zip" \
    hector        "Hector" \
    kiki          "Kiki" \
    luthor        "Luthor::sonique/luthor/luthor-core:bin.zip" \
    marzipan      "Marzipan:gocd" \
    optimusprimer "Optimus Primer" \
    raiden        "Raiden" \
    redqueen      "Redqueen:gocd" \
    rocky         "Rocky:production-releases-local:charts/rocky-chart:.tgz" \
    roobarb       "Roobarb:gocd" \
    shovel        "Shovel" \
    smaug         "Smaug:gocd" \
    superman      "Superman" \
)

source "${0:h}/artifactory.zsh"
source "${0:h}/gocd.zsh"
source "${0:h}/docker.zsh"
source "${0:h}/completion_helpers.zsh"
source "${0:h}/shoehorn.zsh"

mkdir -p /tmp/shoehorn/gocd
