const express = require("express");
const app = express();
app.get("/", (req, res) => res.send("Hello from Service 1 (Port 80)!"));
app.listen(80, () => console.log("Service 1 running on port 80"));
