const sequelize = require('../database');
const { DataTypes } = require('sequelize');

const Mascota = sequelize.define('Mascota', {
    ID_Mascota: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Nombre: DataTypes.STRING,
    Edad: DataTypes.INTEGER, //aplica filtro
    Especie: DataTypes.STRING, //aplica filtro
    Tamaño: DataTypes.STRING, // aplica filtro
    Estado_Salud: DataTypes.STRING,
    Foto_URL: DataTypes.STRING,
    ID_Refugio: DataTypes.INTEGER
}, { tableName: 'Mascota', timestamps: false });

module.exports = Mascota;
