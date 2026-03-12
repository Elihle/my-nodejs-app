# Backend service

Simple Express API for EC2 deployment via CodeDeploy.

## Local development
```bash
cd backend
npm install
npm run dev   # nodemon, listens on :3001
```

## Production (CodeDeploy)
- Files land in `/srv/my-nodejs-backend`
- PM2 process name: `my-nodejs-backend`
- Health endpoint: `GET /health`
