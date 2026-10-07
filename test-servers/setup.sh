#!/usr/bin/env bash
# Deploy key banata hai + 5 test server container start karta hai
set -e
cd "$(dirname "$0")"
[ -f deploy_key ] || ssh-keygen -t ed25519 -f deploy_key -N "" -C "gh-actions-deploy"
cp deploy_key.pub authorized_keys
docker compose up -d --build
echo
echo "=== GitHub Secrets me ye daalo ==="
echo "SSH_USER        = deploy"
echo "SSH_HOST        = localhost      (single-node test ke liye)"
echo "SSH_PORT        = 2201           (single-node test ke liye)"
echo "SSH_PRIVATE_KEY = (neeche wali poori key, BEGIN/END lines samet)"
echo
cat deploy_key
