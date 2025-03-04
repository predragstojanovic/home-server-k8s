
helm install argocd argo/argo-cd --version 7.8.7 --namespace=argocd \
  --set global.domain=argo.config.guru \
  --set server.ingress.enabled=true \
  --set server.ingress.ingressClassName=nginx \
  --set server.ingress.annotations."nginx.ingress.kubernetes.io/rewrite-target"="/$2" \
  --set server.ingress.hosts="{argo.config.guru}" \
  --set server.service.type=ClusterIP \
  --set server.service.nodePortHttp=30000 \
  --set server.service.nodePortHttps=30100
