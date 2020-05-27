#!/bin/bash
################################################################################
##  File:  7-zip.sh
##  Desc:  Installs 7-zip
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install 7-Zip
printf "\e[36m===> Installing 7zip and related tools <=== \e[0m \n"
apt-get install -y p7zip p7zip-full p7zip-rar > /dev/null

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in 7z; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "7zip ($(7z i | head --lines=2 | cut -d ' ' -f 3 | tr -d '\n'))"