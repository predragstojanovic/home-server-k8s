# ArgoCD and Nginx Setup with Certbot

This project provides a setup for deploying ArgoCD and Nginx on a Kubernetes cluster, along with automated SSL certificate management using Certbot. The setup is designed to work with the domain `hellion-local.duckdns.org`.

## Project Structure

- **k8s/**: Contains Kubernetes manifests for deploying ArgoCD and Nginx.
  - **argocd/**: Manifests for ArgoCD deployment.
    - `deployment.yaml`: Deployment configuration for ArgoCD.
    - `ingress.yaml`: Ingress configuration for external access to ArgoCD.
    - `service.yaml`: Service definition for ArgoCD.
  - **nginx/**: Manifests for Nginx deployment.
    - `configmap.yaml`: ConfigMap for Nginx configuration.
    - `deployment.yaml`: Deployment configuration for Nginx.
    - `service.yaml`: Service definition for Nginx.

- **certbot/**: Contains configurations for SSL certificate management.
  - `certbot-job.yaml`: Kubernetes job for requesting the SSL certificate.
  - `renew-cron.yaml`: Cron job for automatic renewal of the SSL certificate.

- **nginx/**: Contains the main Nginx configuration file.
  - `nginx.conf`: Main configuration for Nginx, including server blocks and SSL settings.

- **scripts/**: Contains scripts for setup and certificate renewal.
  - `init-setup.sh`: Script to initialize the setup process.
  - `cert-renewal.sh`: Script to handle SSL certificate renewal.

## Setup Instructions

1. **Prerequisites**: Ensure you have a Kubernetes cluster running and `kubectl` configured to interact with it.

2. **Deploy Nginx**:
   - Apply the Nginx manifests:
     ```
     kubectl apply -f k8s/nginx/configmap.yaml
     kubectl apply -f k8s/nginx/deployment.yaml
     kubectl apply -f k8s/nginx/service.yaml
     ```

3. **Request SSL Certificate**:
   - Apply the Certbot job to request the SSL certificate:
     ```
     kubectl apply -f certbot/certbot-job.yaml
     ```

4. **Deploy ArgoCD**:
   - Apply the ArgoCD manifests:
     ```
     kubectl apply -f k8s/argocd/deployment.yaml
     kubectl apply -f k8s/argocd/service.yaml
     kubectl apply -f k8s/argocd/ingress.yaml
     ```

5. **Set Up Automatic Renewal**:
   - Apply the renewal cron job:
     ```
     kubectl apply -f certbot/renew-cron.yaml
     ```

## Usage

- Access the ArgoCD UI at `http://hellion-local.duckdns.org`.
- The SSL certificate will be automatically renewed based on the configuration in the cron job.

## Notes

- Ensure that your DNS is correctly configured to point to your Kubernetes cluster.
- Monitor the logs of the Certbot job and renewal cron job for any issues related to SSL certificate management.