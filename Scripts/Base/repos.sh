#!/bin/bash
################################################################################
##  File:  repos.sh
##  Desc:  Installs official Microsoft package repos for the distribution
################################################################################

# Telling bash to exit on any non-true return value
set -e

export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

printf "\e[36m===> Adding Microsoft GPG public key & Repositories <=== \e[0m \n"
curl -sL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - > /dev/null
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

printf "\e[36m===> Adding Microsoft Repositories <=== \e[0m \n"
OS_VERSION=$(lsb_release -rs)
wget --quiet "https://packages.microsoft.com/config/ubuntu/${OS_VERSION}/packages-microsoft-prod.deb"
dpkg -i packages-microsoft-prod.deb > /dev/null
rm -f packages-microsoft-prod.deb

# Install Azure CLI Software Repository
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list > /dev/null

printf "\e[36m===> Adding Ansible Repository <=== \e[0m \n"
apt-add-repository -y ppa:ansible/ansible > /dev/null

printf "\e[36m===> Adding Git Repository <=== \e[0m \n"
add-apt-repository -y ppa:git-core/ppa > /dev/null

printf "\e[36m===> Adding Kubernetes Repository <=== \e[0m \n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - > /dev/null
touch /etc/apt/sources.list.d/kubernetes.list > /dev/null
# Based on https://kubernetes.io/docs/tasks/tools/install-kubectl/, package is still called xenial
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list > /dev/null

printf "\e[36m===> Updating Package Cache <=== \e[0m \n"
apt-get update -qq
