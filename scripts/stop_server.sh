#!/bin/bash
set -euo pipefail

APP_NAME=my-nodejs-backend

if command -v pm2 >/dev/null 2>&1; then
  pm2 stop "$APP_NAME" || true
  pm2 delete "$APP_NAME" || true
fi
