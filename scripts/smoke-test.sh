#!/usr/bin/env bash
set -euo pipefail

NODE_IP="${1:-}"
PORT="${2:-30080}"

if [[ -z "$NODE_IP" ]]; then
  echo "Usage: ./smoke-test.sh <NODE_IP> [NODE_PORT]"
  exit 1
fi

echo "Curling: http://${NODE_IP}:${PORT}"
curl -s "http://${NODE_IP}:${PORT}" | head -n 5
echo
echo "OK"
