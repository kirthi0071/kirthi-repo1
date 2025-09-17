const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello from App1 root!");
});

app.get("/app1", (req, res) => {
  res.send("Hello from App1 /app1 route!");
});

app.listen(5001, "0.0.0.0", () => {
  console.log("App1 running on port 5001");
});
