#!/bin/bash
set -euo pipefail

PROJECT_ROOT=$(pwd)
cd $PROJECT_ROOT

KNATIVE_VERSION=v0.16.0

# Install serving components
kubectl apply -f https://github.com/knative/serving/releases/download/$KNATIVE_VERSION/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/$KNATIVE_VERSION/serving-core.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/$KNATIVE_VERSION/release.yaml

# Make Istio specific changes
kubectl label namespace knative-serving istio-injection=enabled
kubectl apply -f manifests/kn-istio-security.yaml

# Configure DNS with xip.io
kubectl apply -f https://github.com/knative/serving/releases/download/$KNATIVE_VERSION/serving-default-domain.yaml