#!/bin/bash

# Shell Configs
set -euo pipefail

# Make the prject root out working directory
PROJECT_ROOT=$(pwd)
cd $PROJECT_ROOT

ISTIO_VERSION=1.6.3
ISTIO_DIRECTORY=istio-$ISTIO_VERSION

if [ ! -d "$ISTIO_DIRECTORY" ]; then
    ### Take action if DIR DOES NOT exists ###
    echo "Installing Istio..."
    
    curl -L https://istio.io/downloadIstio | $ISTIO_VERSION sh -
fi

# Make istioctl avaliable to shell
export PATH=$PWD/$ISTIO_DIRECTORY/bin:$PATH

# Apply operator
istioctl manifest apply -f manifests/istio-minimal-operator.yaml