#!/bin/bash
################################################################################
##  File:  azcli.sh
##  Desc:  Installed Azure CLI (az)
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Azure CLI
apt-get install -y --no-install-recommends azure-cli > /dev/null

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in az; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "Azure CLI ($(az -v | grep azure-cli))"