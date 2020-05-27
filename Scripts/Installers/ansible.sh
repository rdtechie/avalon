#!/bin/bash
################################################################################
##  File:  ansible.sh
##  Desc:  Installs Ansible
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install latest Ansible
printf "\e[36m===> Installing Ansible and related tools <=== \e[0m \n"
pip3 install --quiet setuptools
pip3 install --quiet wheel
pip3 install --quiet ansible
pip3 install --quiet openshift # https://github.com/openshift/openshift-restclient-python
pip3 install --quiet PyYAML
pip3 install --quiet pywinrm[kerberos] # https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#installing-the-kerberos-library

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in ansible; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "Ansible ($(ansible --version | head -n1))"