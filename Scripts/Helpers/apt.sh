#!/bin/bash
################################################################################
##  File:  apt.sh
##  Desc:  Helper file for configuring apt
################################################################################

# Configure apt to always assume Y
echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

printf "\e[36m===> Adding apt-fast Repository <=== \e[0m \n"
add-apt-repository -y -u ppa:apt-fast/stable > /dev/null

printf "\e[36m===> Installing apt helper Software Packages <=== \e[0m \n"
apt-get install -y --no-install-recommends aria2 apt-fast > /dev/null
