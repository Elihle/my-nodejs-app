const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const port = process.env.PORT || 3001;

app.get("/health", (_req, res) => {
  res.json({ status: "ok" });
});

app.get("/", (_req, res) => {
  res.json({ message: "Backend is running", env: process.env.NODE_ENV || "dev" });
});

app.listen(port, () => {
  console.log(`API listening on port ${port}`);
});
