import express from 'express';

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, Secure World! Your app is signed and deployed securely.');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});