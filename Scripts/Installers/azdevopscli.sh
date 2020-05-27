#!/bin/bash
################################################################################
##  File:  azure-devops-cli.sh
##  Desc:  Installed Azure DevOps CLI (az devops)
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# AZURE_EXTENSION_DIR shell variable defines where modules are installed
# https://docs.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview
export AZURE_EXTENSION_DIR=/opt/az/azcliextensions
echo "AZURE_EXTENSION_DIR=$AZURE_EXTENSION_DIR" | tee -a /etc/environment

# Install azure devops Cli extension
az extension add -n azure-devops > /dev/null

# check to determine if extension was installed or not
if [ $? -eq 0 ]
then
    echo "azure DevOps Cli extension was installed"
else
    echo "azure DevOps Cli extension was not installed"
    exit 1
fi

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "Azure CLI ($(az -v | grep azure-devops))"