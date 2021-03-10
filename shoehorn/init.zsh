#!/usr/bin/env zsh
typeset -g _ARTIFACTORY="https://artifactory.bmtapps.bskyb.com/artifactory"
typeset -g _SHOEHORN_VERSION=620
typeset -g _gocd_cache_minutes=5

    # app         "Description : signed-off-repo : artifact path "
typeset -gA APPLICATIONS=( \
    aview         "AView" \
    battenberg    "Battenberg:gocd" \
    bullwinkle    "Bullwinkle:gocd" \
    bran          "Bran:gocd" \
    doogal        "Doogal:gocd" \
    dudley        "Dudley:gocd" \
    eclair        "Eclair:gocd" \
    erebor        "Erebor:gocd" \
    felix         "Felix:gocd" \
    ffestiniog    "Ffestiniog::sonique/ffestiniog/ffestiniog-core" \
    garibaldi     "Garibaldi:gocd" \
    gruffalo      "Gruffalo::sonique/gruffalo/gruffalo-build" \
    hector        "Hector" \
    kiki          "Kiki" \
    luthor        "Luthor::sonique/luthor/luthor-core" \
    marzipan      "Marzipan:gocd" \
    optimusprimer "Optimus Primer" \
    raiden        "Raiden" \
    redqueen      "Redqueen:gocd" \
    rocky         "Rocky:gocd" \
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

mkdir -p /tmp/shoehorn/{gocd,af}
