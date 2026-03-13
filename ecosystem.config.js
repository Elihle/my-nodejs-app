module.exports = {
  apps: [
    {
      name: "my-nodejs-backend",
      script: "server.js",
      cwd: "/srv/my-nodejs-backend/backend",
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        PORT: "80",
        NODE_ENV: "production"
      }
    }
  ]
};
