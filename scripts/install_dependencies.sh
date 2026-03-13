#!/bin/bash
set -euo pipefail

export PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"

cd /srv/my-nodejs-backend/backend

# Ensure hooks are executable
chmod +x /srv/my-nodejs-backend/scripts/*.sh || true

# Install Node.js if missing
if ! command -v npm >/dev/null 2>&1; then
  curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
  yum install -y nodejs
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
