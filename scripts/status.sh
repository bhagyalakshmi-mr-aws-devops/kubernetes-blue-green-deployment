#!/usr/bin/env bash
set -euo pipefail
echo "=== Deployments ==="
kubectl -n bluegreen get deploy -o wide
echo
echo "=== Pods ==="
kubectl -n bluegreen get pods -o wide
echo
echo "=== Service ==="
kubectl -n bluegreen get svc web -o wide
