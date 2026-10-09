const express = require("express");
const app = express();

const participantesRoute = require("./routes/participantesRoute");

app.use(express.json());
app.use(participantesRoute);

module.exports = app;