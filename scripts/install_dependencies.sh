#!/bin/bash
set -euo pipefail

cd /srv/my-nodejs-backend/backend

# Ensure hooks are executable
chmod +x /srv/my-nodejs-backend/scripts/*.sh

# Ensure PM2 is available to manage the process
if ! command -v pm2 >/dev/null 2>&1; then
  npm install -g pm2
fi

# Install production dependencies for the backend
npm install --production
