const db = require("../config/db");

const buscar = async () => {
    const [participantes] = await db.query(
        "SELECT * FROM participantes;"
    );

    return participantes;
}

const criar = async (nome, email, telefone) => {
    const participante = await db.query(
        "INSERT INTO participantes (nome, email, telefone) VALUES (?,?,?)",
        [nome, email, telefone]
    );

    return {
        id: participante.insertId,
        nome,
        email,
        telefone
    };
}

const editar = async (id, nome, email, telefone) => {
    const participante = await db.query(
        "UPDATE participantes SET nome=?, email=?, telefone=? WHERE id=?",
        [nome, email, telefone, id]
    );

    return {
        id,
        nome,
        email,
        telefone
    }
}

const deletar = async (id) => {
    const participante = await db.query(
        "DELETE FROM participantes WHERE id=?",
        [id]
    );

    return participante.affectedRows;
}

module.exports = {
    buscar,
    criar,
    editar,
    deletar
}