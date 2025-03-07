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