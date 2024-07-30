#!/bin/bash

if command -v docker > /dev/null
then
    echo "Docker already installed, exiting."
    exit 0
fi

DISTRO=$(cat /etc/*-release | grep DISTRIB_ID | awk -F '=' '{print tolower($2)}')

if [ ! -f ./docker/${DISTRO}.sh ]; then
   echo "Distro not supported: $DISTRO"
   exit -1
fi

sh ./docker/${DISTRO}.sh