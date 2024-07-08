#!/bin/bash

REPOSITORY=${REPOSITORY:="hellworld"}
REGISTRY=${REGISTRY:="111111111111.dkr.ecr.us-west-2.amazonaws.com"}
REGISTRY_URL="${REGISTRY}/${REPOSITORY}"
VERSION=${VERSION:$1}

nerdctl build -f server.dockerfile . -t ${REPOSITORY}
nerdctl tag helloworld:latest ${REGISTRY_URL}:latest
nerdctl push ${REGISTRY_URL}:latest
if [ -n "${VERSION}" ]; then
    nerdctl tag ${REPOSITORY}:latest ${REGISTRY_URL}:"${VERSION}"
    nerdctl push ${REGISTRY_URL}:"${VERSION}"
fi
