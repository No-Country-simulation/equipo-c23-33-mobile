
const express = require('express')
const morgan = require('morgan')
const app = express();

app.use(morgan('dev'))
const router = require("./routes/users.js");
// Middleware para parsear JSON
app.use(express.json());
app.use(router);



module.exports = app;
