#!/bin/bash

# This script handles the renewal of the SSL certificate for the domain hellion-local.duckdns.org.
# It uses Certbot to renew the certificate and reloads Nginx to apply the new certificate.

DOMAIN="hellion-local.duckdns.org"
CERTBOT_CMD="certbot renew"

# Renew the SSL certificate
$CERTBOT_CMD --quiet

# Check if the renewal was successful
if [ $? -eq 0 ]; then
    echo "SSL certificate for $DOMAIN renewed successfully."
    # Reload Nginx to apply the new certificate
    kubectl rollout restart deployment nginx-deployment
else
    echo "Failed to renew SSL certificate for $DOMAIN."
fi