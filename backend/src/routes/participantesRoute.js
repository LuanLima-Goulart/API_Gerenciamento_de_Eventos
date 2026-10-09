const express = require("express");
const router = express.Router();
const participantesController = require("../controllers/participantesController");

router.get("/participantes", participantesController.consultarParticipantes);

module.exports = router;