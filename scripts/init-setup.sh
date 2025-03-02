#!/bin/bash

# This script initializes the setup process for ArgoCD and Nginx with Certbot for SSL certificate management.

# Set the domain name
DOMAIN="hellion-local.duckdns.org"

# Apply the Nginx ConfigMap
kubectl apply -f ../k8s/nginx/configmap.yaml

# Deploy Nginx
kubectl apply -f ../k8s/nginx/deployment.yaml

# Expose Nginx service
kubectl apply -f ../k8s/nginx/service.yaml

# Deploy ArgoCD
kubectl apply -f ../k8s/argocd/deployment.yaml

# Expose ArgoCD service
kubectl apply -f ../k8s/argocd/service.yaml

# Configure Ingress for ArgoCD
kubectl apply -f ../k8s/argocd/ingress.yaml

# Create Certbot job for SSL certificate
kubectl apply -f ../certbot/certbot-job.yaml

# Set up the renewal cron job for Certbot
kubectl apply -f ../certbot/renew-cron.yaml

echo "Setup completed for Nginx, ArgoCD, and Certbot."