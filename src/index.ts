import express from 'express';

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, Azure App Service! Your app is securely signed.');
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
