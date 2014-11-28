#!/bin/bash

PROVISION_DIR="/var/vagrant_provision"
GIT_VERSION="git-2.2.0"

if [ -e "$PROVISION_DIR" ]; then
    exit 0
fi

mkdir $PROVISION_DIR && cd $PROVISION_DIR

## Git ##
echo Installing ${GIT_VERSION} ...
apt-get install -y zlib1g-dev gettext libcurl4-openssl-dev
wget https://www.kernel.org/pub/software/scm/git/${GIT_VERSION}.tar.gz
tar zxf ${GIT_VERSION}.tar.gz
cd ${GIT_VERSION}
./configure
make
make install
cd ..

## zsh
apt-get install -y zsh
