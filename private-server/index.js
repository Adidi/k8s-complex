const express = require('express');
const app = express();


app.get('/adiel', async (req, res) => {
    res.json({
        private: 'server'
    })
  });

const port = 9999;

app.listen(port, (err) => {
    console.log('Listening private server on port:', port);
  });