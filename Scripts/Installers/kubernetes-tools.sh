#!/bin/bash
################################################################################
##  File:  kubernetes-tools.sh
##  Desc:  Installs kubectl, helm, istioctl
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

## Install kubectl
printf "\e[36m===> Installing kubectl <=== \e[0m \n"
apt-get install -y kubectl > /dev/null

# Install Helm
printf "\e[36m===> Installing Helm <=== \e[0m \n"
curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash > /dev/null

# Install Istioctl
printf "\e[36m===> Installing Istioctl <=== \e[0m \n"
curl -s https://raw.githubusercontent.com/istio/istio/master/release/downloadIstioCtl.sh | sh - > /dev/null
export PATH=$PATH:$HOME/.istioctl/bin

# Run tests to determine that the software installed as expected
printf "\e[36mBasic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in kubectl helm istioctl; do
    if ! command -v $cmd; then
        printf "\e[36m$cmd was not installed <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "kubectl ($(kubectl version --client=true --short |& head -n 1))"
DocumentInstalledItem "helm ($(helm version --template='{{ .Version }}' |& head -n 1))"
DocumentInstalledItem "istioctl ($(istioctl --log_output_level none version --short |& head -n 1))"