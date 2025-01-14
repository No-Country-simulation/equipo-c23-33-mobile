// Define models
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Usuario = sequelize.define('Usuario', {
    ID_Usuario: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Nombre: DataTypes.STRING,
    Email: DataTypes.STRING,
    Contraseña: DataTypes.STRING,
    Rol: DataTypes.STRING
}, { tableName: 'Usuario', timestamps: false });




