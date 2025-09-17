const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello from App1!");
});

// ✅ Must listen on 0.0.0.0 so Cloud Run/NGINX can reach it
app.listen(5001, "0.0.0.0", () => {
  console.log("App1 running on port 5001");
});
