const sequelize = require('../config/database');
const { DataTypes } = require('sequelize');

const Solicitud_Adopción = sequelize.define('Solicitud_Adopción', {
    ID_Solicitud: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    ID_Usuario: DataTypes.INTEGER,
    ID_Mascota: DataTypes.INTEGER,
    Fecha_Solicitud: DataTypes.DATE,
    Estado: DataTypes.STRING
}, { tableName: 'Solicitud_Adopción', timestamps: false });