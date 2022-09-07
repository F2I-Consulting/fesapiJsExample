'use strict';

import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url'; // in Browser, the URL in native accessible on window


// Constants
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(fileURLToPath(import.meta.url));
const HOST = '0.0.0.0';

// sets port 8080 to default or unless otherwise specified in the environment
const PORT = process.env.PORT || 8080;


// App
const app = express();

app.use(express.static(path.join(__dirname, './dist/')));
app.get('/', (req,res) => {
  res.sendFile(path.join(__dirname, './index.html'));
});

app.listen(PORT, HOST, () => console.log(`Serving at http://${HOST}:${PORT}`));
