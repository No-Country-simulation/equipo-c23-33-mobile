const sequelize = require('../database');
const { DataTypes } = require('sequelize');

const Refugio = sequelize.define('Refugio', {
    ID_Refugio: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Nombre: DataTypes.STRING,
    Dirección: DataTypes.STRING,
    Teléfono: DataTypes.STRING,
    Email: DataTypes.STRING,
    Capacidad_Mascotas: DataTypes.INTEGER,
    ID_Usuario: DataTypes.INTEGER,
    ID_Administrador: DataTypes.INTEGER
}, { tableName: 'Refugio', timestamps: false });

module.exports = Refugio;