#!/bin/bash
################################################################################
##  File:  codespaces.sh
##  Desc:  Configures the image to be used in Visual Studio CodeSpaces
################################################################################

# Telling bash to exit on any non-true return value
set -e

# Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
groupadd --gid $USER_GID $USERNAME
useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# [Optional] Add sudo support for the non-root user
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME