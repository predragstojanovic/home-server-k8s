#!/bin/bash

set -e

# Create namespace for ArgoCD
kubectl create namespace argocd || true

# Add ArgoCD Helm repository
helm repo add argo https://argoproj.github.io/argo-helm

# Update Helm repositories
helm repo update
echo ""
echo ""

echo "Starting ArgoCD installation..."

helm install argocd argo/argo-cd --version 7.8.7 --namespace=argocd \
  --set global.domain=argo.config.guru \
  --set server.ingress.enabled=true \
  --set server.ingress.ingressClassName=nginx \
  --set server.ingress.hosts[0]=argo.config.guru \
  --set server.service.type=ClusterIP \
  --set server.extraArgs="{--insecure}" > /dev/null


kubectl apply -f argocd-ingress.yaml

echo ""
echo ""
sleep 10

# Retrieve the admin password
ADMIN_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

sleep 10

echo "✅ ArgoCD installation complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🌐 Access URL: https://argo.config.guru"
echo ""
echo "🔐 LOGIN CREDENTIALS 🔐"
echo "┌─────────────┬────────────────────────────────┐"
echo "│ Username    │ admin                          │"
echo "├─────────────┼────────────────────────────────┤"
echo "│ Password    │ $ADMIN_PASSWORD               │"
echo "└─────────────┴────────────────────────────────┘"
echo ""
echo "⚠️  Important: Save these credentials securely. The initial admin"
echo "   secret will be automatically deleted after first login."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

