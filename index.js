const express = require('express');
const app = express();

const port = process.env.PORT || 3000;

app.get('/', (_req, res) => {
  res.send('Hello from Node.js app!');
});

app.get('/health', (_req, res) => {
    res.status(200).send('OK');
});

module.exports = app;

if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
  });
}