#!/bin/bash

# Delete Nginx resources
kubectl delete -f ../k8s/nginx/configmap.yaml
kubectl delete -f ../k8s//nginx/deployment.yaml
kubectl delete -f ../k8s//nginx/service.yaml

# Delete ArgoCD resources
kubectl delete -f ../k8s//argocd/ingress.yaml
kubectl delete -f ../k8s//argocd/deployment.yaml
kubectl delete -f ../k8s//argocd/service.yaml

# Delete Certbot resources
kubectl delete -f ../certbot/certbot-job.yaml
kubectl delete -f ../certbot/renew-cron.yaml

# Optionally delete the namespace (if you created it solely for this setup)
kubectl delete namespace argocd
kubectl delete namespace certbot

echo "Deletion completed."
