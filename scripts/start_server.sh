#!/bin/bash
set -euo pipefail

APP_DIR=/srv/my-nodejs-backend/backend
APP_NAME=my-nodejs-backend

cd "$APP_DIR"

export PORT="${PORT:-80}"
export NODE_ENV=production
export PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"

# Start (or restart) the app with PM2
NODE_BIN="$(command -v node || true)"
START_CMD="${NODE_BIN:-node} server.js"

if pm2 list | grep -q "$APP_NAME"; then
  pm2 restart "$APP_NAME" --update-env
else
  pm2 start $START_CMD --name "$APP_NAME" --update-env
fi

# Persist PM2 list across restarts
pm2 save
