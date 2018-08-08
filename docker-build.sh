#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script builds docker images.                    #
#####################################################################

# Set env vars
. ./env-vars.sh

# Build docker images
docker build -t mstk-${OS}-base \
    -f ${DOCKERFILE_FOLDER}/Dockerfile.${OS} .

docker build --rm -t mstk-${OS} \
    --build-arg OS=$OS \
    --build-arg TOOLKIT_VERSION=1.4.0 \
    -f ${DOCKERFILE_FOLDER}/Dockerfile.mstk .
