#!/bin/bash
################################################################################
##  File:  init.sh
##  Desc:  Installs basic command line utilities and dev packages
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Telling bash to exit on any non-true return value
set -e

# Telling apt-get to be non-interactive
export DEBIAN_FRONTEND=noninteractive

apt-get update -qq

printf "\e[36m===> Installing apt-utils                  <=== \e[0m \n"
apt-get install -y --no-install-recommends apt-utils > /dev/null

printf "\e[36m===> Installing openssh-client             <=== \e[0m \n"
apt-get install -y --no-install-recommends openssh-client > /dev/null

printf "\e[36m===> Installing less                       <=== \e[0m \n"
apt-get install -y --no-install-recommends less > /dev/null

printf "\e[36m===> Installing iproute2                   <=== \e[0m \n"
apt-get install -y --no-install-recommends iproute2 > /dev/null

printf "\e[36m===> Installing procps                     <=== \e[0m \n"
apt-get install -y --no-install-recommends procps > /dev/null

printf "\e[36m===> Installing apt-transport-https        <=== \e[0m \n"
apt-get install -y --no-install-recommends apt-transport-https > /dev/null

printf "\e[36m===> Installing ca-certificates            <=== \e[0m \n"
apt-get install -y --no-install-recommends ca-certificates > /dev/null

printf "\e[36m===> Installing libcurl3                   <=== \e[0m \n"
apt-get install -y --no-install-recommends libcurl3 > /dev/null

printf "\e[36m===> Installing curl                       <=== \e[0m \n"
apt-get install -y --no-install-recommends curl > /dev/null

printf "\e[36m===> Installing gnupg                      <=== \e[0m \n"
apt-get install -y --no-install-recommends gnupg > /dev/null

printf "\e[36m===> Installing lsb-release                <=== \e[0m \n"
apt-get install -y --no-install-recommends lsb-release > /dev/null

printf "\e[36m===> Installing sudo                       <=== \e[0m \n"
apt-get install -y --no-install-recommends sudo > /dev/null

printf "\e[36m===> Installing software-properties-common <=== \e[0m \n"
apt-get install -y --no-install-recommends software-properties-common > /dev/null

printf "\e[36m===> Installing python-pip                 <=== \e[0m \n"
apt-get install -y --no-install-recommends python-pip > /dev/null

printf "\e[36m===> Installing python3-pip                <=== \e[0m \n"
apt-get install -y --no-install-recommends python3-pip > /dev/null

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in curl sudo pip pip3 lsb_release; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
AddTitle "$(lsb_release -ds)"
WriteItem "The following software is installed on machines with the $IMAGE_VERSION update."
WriteItem "***"
DocumentInstalledItem "Basic Command Line Tools and Development Software:"
DocumentInstalledItemIndent "apt-transport-https"
DocumentInstalledItemIndent "apt-utils"
DocumentInstalledItemIndent "ca-certificates"
DocumentInstalledItemIndent "curl"
DocumentInstalledItemIndent "gnupg"
DocumentInstalledItemIndent "lsb-release"
DocumentInstalledItemIndent "sudo"
DocumentInstalledItemIndent "python-pip"
DocumentInstalledItemIndent "python3-pip"
DocumentInstalledItemIndent "software-properties-common"
