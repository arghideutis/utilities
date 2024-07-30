#!/bin/bash

BASEURL=https://raw.githubusercontent.com/arghideutis/utilities/main/docker

if command -v docker > /dev/null
then
    echo "Docker already installed, exiting."
    exit 0
fi

DISTRO=$(cat /etc/*-release | grep DISTRIB_ID | awk -F '=' '{print tolower($2)}')
SCRIPT_PATH=./${BASEURL}/${DISTRO}.sh

if [ ! -f ${SCRIPT_PATH} ]; then
   echo "Distro not supported: ${DISTRO}"
   exit -1
fi

curl ${SCRIPT_PATH} | bash

echo Done, now please reboot or logout/login again.