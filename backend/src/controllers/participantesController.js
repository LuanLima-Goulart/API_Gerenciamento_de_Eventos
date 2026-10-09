const listaParticipantes = require("../models/participantesModel");

const consultarParticipantes = async (req, res) => {
    const participantes = await listaParticipantes.buscar();

    res.json(participantes);
}

module.exports = {
    consultarParticipantes
}