#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM mcr.microsoft.com/powershell:preview

# This Dockerfile adds a non-root user with sudo access.
# This configuration step is done in the script /Scripts/Base/codespaces.sh
# Use the "remoteUser" property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ARG DEBIAN_FRONTEND=noninteractive
ARG BASE_SCRIPTS=/Scripts/Base
ARG INSTALL_SCRIPTS=/Scripts/Installers
ARG HELPER_SCRIPTS=/Scripts/Helpers
ARG METADATA_FILE=metadata.md
ARG IMAGE_VERSION='0.1.0'
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Preparing Image
COPY Scripts Scripts

RUN chmod +x -R Scripts \
    && $BASE_SCRIPTS/init.sh \
    && $BASE_SCRIPTS/common.sh \
    && $BASE_SCRIPTS/repos.sh \
    && $INSTALL_SCRIPTS/7zip.sh \
    && $INSTALL_SCRIPTS/ansible.sh \
    && $INSTALL_SCRIPTS/azcopy.sh \
    && $INSTALL_SCRIPTS/azcli.sh \
    && $INSTALL_SCRIPTS/azdevopscli.sh \
    && $INSTALL_SCRIPTS/git.sh \
    && $INSTALL_SCRIPTS/kubernetes-tools.sh \
    && $INSTALL_SCRIPTS/terraform.sh \
    && $INSTALL_SCRIPTS/packer.sh

# Install PowerShell Modules
RUN [ "pwsh", "-NoProfile", "-File", "/Scripts/Installers/pwsh.ps1" ]

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*