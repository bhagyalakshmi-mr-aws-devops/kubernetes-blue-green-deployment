#!/usr/bin/env bash
set -euo pipefail
kubectl -n bluegreen patch svc web -p '{"spec":{"selector":{"app":"web","version":"green"}}}'
kubectl -n bluegreen get svc web -o wide
echo "Traffic switched to GREEN."
