#!/bin/bash

BASEURL=https://raw.githubusercontent.com/arghideutis/utilities/main/docker

if command -v docker > /dev/null
then
    echo "Docker already installed, exiting."
    exit 0
fi

DISTRO=$(cat /etc/*-release | grep DISTRIB_CODENAME | awk -F '=' '{print tolower($2)}')
SCRIPT_URL=${BASEURL}/${DISTRO}.sh

status=$(curl --head --silent ${SCRIPT_URL} | head -n 1)

if echo "$status" | grep -q 404; 
then
   echo "Distro not supported: ${DISTRO}"
   exit -1
fi

curl -s ${SCRIPT_URL} | bash

echo Done, now please reboot or logout/login again.
