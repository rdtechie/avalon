#!/bin/bash
################################################################################
##  File:  azcopy.sh
##  Desc:  Installs AzCopy
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install AzCopy v10
wget -nv -O azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux
tar -xf azcopy.tar.gz > /dev/null
mv azcopy_linux_amd64_10.4.3/azcopy /usr/local/bin
rm -rf azcopy_linux_amd64_10.4.3
rm azcopy.tar.gz

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in azcopy; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "AzCopy ($(azcopy --version))"