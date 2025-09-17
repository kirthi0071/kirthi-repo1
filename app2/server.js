const express = require("express");
const app = express();
app.get("/", (req, res) => res.send("Hello from Service 2 (Port 8080)!"));
app.listen(8080, () => console.log("Service 2 running on port 8080"));
