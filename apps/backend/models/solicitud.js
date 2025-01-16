const sequelize = require('../database');
const { DataTypes } = require('sequelize');

const Solicitud_Adopción = sequelize.define('Solicitud_Adopción', {
    ID_Solicitud: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    ID_Usuario: DataTypes.INTEGER,
    ID_Mascota: DataTypes.INTEGER,
    Fecha_Solicitud: DataTypes.DATE,
    Estado: DataTypes.STRING // puede ser pendiente, aprobado, rechazado
}, { tableName: 'Solicitud_Adopción', timestamps: true });

module.exports = Solicitud_Adopción;