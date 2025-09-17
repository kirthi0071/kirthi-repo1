const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from App1!');
});

app.listen(5001, () => {
  console.log('App1 running on port 5001');
});
