
const express = require('express')
const morgan = require('morgan')
const app = express();

app.use(morgan('dev'))
const usersRouter = require("./routes/users.js");
const refugioRouter = require("./routes/refugio.js");
const solicitudRouter = require("./routes/solicitud.js");
const mascotasRouter = require("./routes/mascotas.js");
// Middleware para parsear JSON
app.use(express.json());

app.use("/api/usuarios", usersRouter);
app.use("/api/refugios", refugioRouter);
app.use("/api/solicitud", solicitudRouter);
app.use("/api/mascotas", mascotasRouter);




module.exports = app;
