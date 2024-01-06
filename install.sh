#!/usr/bin/env bash

# deploy kind cluster
kind delete clusters awx && kind create cluster --name awx --config kind/kind-config.yaml
kind export kubeconfig --name awx

# deploy ingress-nginx
kubectl label nodes awx-control-plane ingress-ready="true"
kubectl apply -f ingress-nginx/deploy.yaml

# deploy the awx operator
git clone git@github.com:ansible/awx-operator.git
cd awx-operator
git checkout 2.10.0
IMG=quay.io/ansible/awx-operator:2.10.0 make deploy
cd ..
rm -rf awx-operator

# deploy the awx instance
kubectl apply -f awx/awx.yaml
