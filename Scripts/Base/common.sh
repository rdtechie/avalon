#!/bin/bash
################################################################################
##  File:  common.sh
##  Desc:  Installs basic command line utilities and dev packages
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Telling bash to exit on any non-true return value
set -e

# Configuring apt get
export DEBIAN_FRONTEND=noninteractive

printf "\e[36m===> Installing openssh-client  <=== \e[0m \n"
apt-get install -y --no-install-recommends openssh-client > /dev/null

printf "\e[36m===> Installing less            <=== \e[0m \n"
apt-get install -y --no-install-recommends less > /dev/null

printf "\e[36m===> Installing iproute2        <=== \e[0m \n"
apt-get install -y --no-install-recommends iproute2 > /dev/null

printf "\e[36m===> Installing procps          <=== \e[0m \n"
apt-get install -y --no-install-recommends procps > /dev/null

printf "\e[36m===> Installing dnsutils        <=== \e[0m \n"
apt-get install -y --no-install-recommends dnsutils > /dev/null

printf "\e[36m===> Installing file            <=== \e[0m \n"
apt-get install -y --no-install-recommends file > /dev/null

printf "\e[36m===> Installing ftp             <=== \e[0m \n"
apt-get install -y --no-install-recommends ftp > /dev/null

printf "\e[36m===> Installing iproute2        <=== \e[0m \n"
apt-get install -y --no-install-recommends iproute2 > /dev/null

printf "\e[36m===> Installing iputils-ping    <=== \e[0m \n"
apt-get install -y --no-install-recommends iputils-ping > /dev/null

printf "\e[36m===> Installing jq              <=== \e[0m \n"
apt-get install -y --no-install-recommends jq > /dev/null

printf "\e[36m===> Installing libunwind8      <=== \e[0m \n"
apt-get install -y --no-install-recommends libunwind8 > /dev/null

printf "\e[36m===> Installing locales         <=== \e[0m \n"
apt-get install -y --no-install-recommends locales > /dev/null

printf "\e[36m===> Installing netcat          <=== \e[0m \n"
apt-get install -y --no-install-recommends netcat > /dev/null

printf "\e[36m===> Installing openssh-client  <=== \e[0m \n"
apt-get install -y --no-install-recommends openssh-client > /dev/null

printf "\e[36m===> Installing rsync           <=== \e[0m \n"
apt-get install -y --no-install-recommends rsync > /dev/null

printf "\e[36m===> Installing shellcheck      <=== \e[0m \n"
apt-get install -y --no-install-recommends shellcheck > /dev/null

printf "\e[36m===> Installing telnet          <=== \e[0m \n"
apt-get install -y --no-install-recommends telnet > /dev/null

printf "\e[36m===> Installing time            <=== \e[0m \n"
apt-get install -y --no-install-recommends time > /dev/null

printf "\e[36m===> Installing tzdata          <=== \e[0m \n"
apt-get install -y --no-install-recommends tzdata > /dev/null

printf "\e[36m===> Installing unzip           <=== \e[0m \n"
apt-get install -y --no-install-recommends unzip > /dev/null

printf "\e[36m===> Installing upx             <=== \e[0m \n"
apt-get install -y --no-install-recommends upx > /dev/null

printf "\e[36m===> Installing wget            <=== \e[0m \n"
apt-get install -y --no-install-recommends wget > /dev/null

printf "\e[36m===> Installing zip             <=== \e[0m \n"
apt-get install -y --no-install-recommends zip > /dev/null

printf "\e[36m===> Installing zstd            <=== \e[0m \n"
apt-get install -y --no-install-recommends zstd > /dev/null

printf "\e[36m===> Installing libxkbfile      <=== \e[0m \n"
apt-get install -y --no-install-recommends libxkbfile-dev > /dev/null

printf "\e[36m===> Installing pkg-config      <=== \e[0m \n"
apt-get install -y --no-install-recommends pkg-config > /dev/null

printf "\e[36m===> Installing libsecret-1-dev <=== \e[0m \n"
apt-get install -y --no-install-recommends libsecret-1-dev > /dev/null

printf "\e[36m===> Installing libxss1         <=== \e[0m \n"
apt-get install -y --no-install-recommends libxss1 > /dev/null

printf "\e[36m===> Installing libgconf-2-4    <=== \e[0m \n"
apt-get install -y --no-install-recommends libgconf-2-4 > /dev/null

printf "\e[36m===> Installing dbus            <=== \e[0m \n"
apt-get install -y --no-install-recommends dbus > /dev/null

printf "\e[36m===> Installing xvfb            <=== \e[0m \n"
apt-get install -y --no-install-recommends xvfb > /dev/null

printf "\e[36m===> Installing libgbm-dev      <=== \e[0m \n"
apt-get install -y --no-install-recommends libgbm-dev > /dev/null

printf "\e[36m===> Installing libgtk          <=== \e[0m \n"
apt-get install -y --no-install-recommends libgtk-3-0 > /dev/null

printf "\e[36m===> Installing tk              <=== \e[0m \n"
apt-get install -y --no-install-recommends tk > /dev/null

printf "\e[36m===> Installing fakeroot        <=== \e[0m \n"
apt-get install -y --no-install-recommends fakeroot > /dev/null

printf "\e[36m===> Installing dpkg            <=== \e[0m \n"
apt-get install -y --no-install-recommends dpkg > /dev/null

printf "\e[36m===> Installing rpm             <=== \e[0m \n"
apt-get install -y --no-install-recommends rpm > /dev/null

printf "\e[36m===> Installing xz-utils        <=== \e[0m \n"
apt-get install -y --no-install-recommends xz-utils > /dev/null

printf "\e[36m===> Installing xorriso         <=== \e[0m \n"
apt-get install -y --no-install-recommends xorriso > /dev/null

printf "\e[36m===> Installing zsync           <=== \e[0m \n"
apt-get install -y --no-install-recommends zsync > /dev/null

printf "\e[36m===> Installing parallel        <=== \e[0m \n"
apt-get install -y --no-install-recommends parallel > /dev/null

printf "\e[36m===> Installing build-essential <=== \e[0m \n"
apt-get install -y --no-install-recommends build-essential > /dev/null

printf "\e[36m===> Installing python-dev      <=== \e[0m \n"
apt-get install -y --no-install-recommends python-dev > /dev/null

printf "\e[36m===> Installing python3-dev     <=== \e[0m \n"
apt-get install -y --no-install-recommends python3-dev > /dev/null

printf "\e[36m===> Installing libkrb5-dev     <=== \e[0m \n"
apt-get install -y --no-install-recommends libkrb5-dev > /dev/null

printf "\e[36m===> Installing krb5-user       <=== \e[0m \n"
apt-get install -y --no-install-recommends krb5-user > /dev/null

printf "\e[36m===> Installing krb5-config     <=== \e[0m \n"
apt-get install -y --no-install-recommends krb5-config > /dev/null

# Run tests to determine that the software installed as expected
printf "\e[36m\e[36m===> Basic testing to make sure that installation went as expected <=== \e[0m \n"
for cmd in file ftp jq netcat ssh parallel rsync shellcheck telnet time unzip wget zip; do
    if ! command -v $cmd; then
        printf "\e[36m\e[36m===> $cmd was not installed or found on PATH <=== \e[0m \n"
        exit 1
    fi
done

# Document what was added to the image
printf "\e[36m\e[36m===> Documenting what is installed to the metadata file <=== \e[0m \n"
DocumentInstalledItemIndent "dnsutils"
DocumentInstalledItemIndent "file"
DocumentInstalledItemIndent "ftp"
DocumentInstalledItemIndent "iproute2"
DocumentInstalledItemIndent "iputils-ping"
DocumentInstalledItemIndent "jq"
DocumentInstalledItemIndent "libcurl3"
DocumentInstalledItemIndent "libgbm-dev"
DocumentInstalledItemIndent "libicu55"
DocumentInstalledItemIndent "libunwind8"
DocumentInstalledItemIndent "locales"
DocumentInstalledItemIndent "netcat"
DocumentInstalledItemIndent "openssh-client"
DocumentInstalledItemIndent "parallel"
DocumentInstalledItemIndent "rsync"
DocumentInstalledItemIndent "shellcheck"
DocumentInstalledItemIndent "telnet"
DocumentInstalledItemIndent "time"
DocumentInstalledItemIndent "tzdata"
DocumentInstalledItemIndent "unzip"
DocumentInstalledItemIndent "upx"
DocumentInstalledItemIndent "wget"
DocumentInstalledItemIndent "zip"
DocumentInstalledItemIndent "zstd"