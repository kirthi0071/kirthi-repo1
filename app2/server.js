const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from App2!');
});

app.listen(5002, () => {
  console.log('App2 running on port 5002');
});
