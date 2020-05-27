#!/bin/bash
################################################################################
##  File:  terraform.sh
##  Desc:  Installs terraform
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Terraform
printf "\e[36m===> Installing Terraform <=== \e[0m \n"
TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r .current_version)
wget -nv -O terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip "terraform.zip" -d /usr/local/bin
rm -f "terraform.zip"

printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in terraform; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItem "Terraform ($(terraform --version))"