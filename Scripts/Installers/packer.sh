#!/bin/bash
################################################################################
##  File:  packer.sh
##  Desc:  Installs packer
################################################################################
# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Packer
printf "\e[36m===> Installing Packer <=== \e[0m \n"
PACKER_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r .current_version)
wget -nv -O packer.zip "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
unzip "packer.zip" -d /usr/local/bin
rm -f "packer.zip"

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in packer; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "Packer ($(packer --version))"