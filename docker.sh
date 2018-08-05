#!/bin/sh

# **************************************************************************
# Copyright (c) 2016 siva prathap 
# Licensed under the MIT license 
# See https://github.com/prathap1041220272/docker-shell-script-for-installation-in-ubuntu.git
# This script will install Docker and will configure 
# to use it from commandline as any normal command
# **************************************************************************

#to produce colored output in STDOUT
red="$(tput setaf 1)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"
reset="$(tput sgr0)"
bold="$(tput bold)"

#remover the old versions of a docker
sudo apt-get remove docker docker-engine docker.io
echo '$green $bold Uninstalled the old versions of docker. $reset'

sudo apt-get update
echo '$blue $bold updated the apt package. $reset'

sudo apt-get libcurl4
#Installing packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

#Adding Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo '$green $bold Verifying that you now have the key with the fingerprint $reset'
sudo apt-key fingerprint 0EBFCD88


sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo '$green $bold ubuntu installation $reset'

sudo apt-get update
echo '$green $bold updated the apt $reset'

echo '$blue $bold Installing the docker-ce version the ubuntu $reset'
sudo apt-get install docker-ce

apt-cache madison docker-ce

sudo apt-get install docker-ce=18.06.0~ce~3-0~ubuntu .

