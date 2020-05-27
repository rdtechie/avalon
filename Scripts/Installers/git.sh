#!/bin/bash
################################################################################
##  File:  git.sh
##  Desc:  Installs Git
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

## Install git
apt-get install -y --no-install-recommends git > /dev/null

# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash > /dev/null
apt-get install -y --no-install-recommends git-lfs > /dev/null

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in git git-lfs; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
# git version 2.20.1
DocumentInstalledItem "Git ($(git --version 2>&1 | cut -d ' ' -f 3))"
# git-lfs/2.6.1 (GitHub; linux amd64; go 1.11.1)
DocumentInstalledItem "Git Large File Storage (LFS) ($(git-lfs --version 2>&1 | cut -d ' ' -f 1 | cut -d '/' -f 2))"