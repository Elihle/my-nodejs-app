#!/bin/bash
set -euo pipefail

HOST=127.0.0.1
PORT=${PORT:-3001}
PATH_HEALTH=${HEALTH_PATH:-/health}

curl -fs "http://${HOST}:${PORT}${PATH_HEALTH}"
