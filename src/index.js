const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello, Secure World! Your app is signed and deployed securely.');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});