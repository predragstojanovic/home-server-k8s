# ArgoCD Installation Guide

This repository contains scripts and configurations for installing ArgoCD on a Kubernetes cluster with Traefik ingress.

## Overview

[ArgoCD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes. This setup provides:

- ArgoCD server deployed using Helm charts
- Ingress configuration for accessing the ArgoCD UI
- Simple initialization script for quick deployment

## Prerequisites

- Kubernetes cluster
- kubectl configured to access your cluster
- Helm v3 installed
- Traefik ingress controller installed and configured on your cluster

## Installation

### Quick Start

Run the initialization script:
```bash
./init.sh



### Troubleshooting


Configure kubectl
```sh
mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config
```

### Uninstall k3s ###
```sh
sudo /usr/local/bin/k3s-uninstall.sh
```

### Delete TRAEFIK ###

```sh
kubectl delete deployment traefik -n kube-system
kubectl delete service traefik -n kube-system
```
