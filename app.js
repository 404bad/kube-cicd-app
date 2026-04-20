const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('<h1>Kube CI/CD App v2</h1><p>Deployed via GitHub Actions</p>');
});

app.listen(3000, () => {
  console.log('App running on port 3000');
})i;
