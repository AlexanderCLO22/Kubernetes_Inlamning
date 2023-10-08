#!/bin/bash

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

echo "Your argocd password is:"

argocd admin initial-password -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443

