#!/bin/bash
set -euo pipefail

APP_DIR=/srv/my-nodejs-backend/backend
APP_NAME=my-nodejs-backend

cd "$APP_DIR"

# Start (or restart) the app with PM2
if pm2 list | grep -q "$APP_NAME"; then
  pm2 restart "$APP_NAME" --update-env
else
  pm2 start server.js --name "$APP_NAME" --update-env
fi

# Persist PM2 list across restarts
pm2 save
