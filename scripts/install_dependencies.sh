#!/bin/bash
set -euo pipefail

export PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"

cd /srv/my-nodejs-backend/backend

# Ensure hooks are executable
chmod +x /srv/my-nodejs-backend/scripts/*.sh || true

# Install Node.js if missing (supports yum or apt)
if ! command -v npm >/dev/null 2>&1; then
  if command -v yum >/dev/null 2>&1; then
    curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
    yum install -y nodejs
  elif command -v apt-get >/dev/null 2>&1; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
    apt-get update
    apt-get install -y nodejs
  else
    echo "No supported package manager found for Node.js install" >&2
    exit 1
  fi
fi

# Ensure PM2 is available to manage the process
if ! command -v pm2 >/dev/null 2>&1; then
  npm install -g pm2
fi

# Allow node to bind to privileged ports (e.g., 80) for ALB health checks
if command -v node >/dev/null 2>&1; then
  setcap 'cap_net_bind_service=+ep' "$(command -v node)" || true
fi

# Install production dependencies for the backend
npm install --production
