const { DataTypes } = require('sequelize'); 
const sequelize = require('../database'); 

// Define el modelo Usuario
const Usuario = sequelize.define('Usuario', {
    ID_Usuario: { 
        type: DataTypes.INTEGER, 
        primaryKey: true, 
        autoIncrement: true 
    },
    Nombre: { 
        type: DataTypes.STRING 
    },
    Email: { 
        type: DataTypes.STRING 
    },
    Contraseña: { 
        type: DataTypes.STRING 
    },
    Rol: { 
        type: DataTypes.STRING // persona interesada, refugio, administrador
    }
}, { 
    tableName: 'Usuarios', // Nombre de la tabla en la base de datos
    timestamps: false // Desactiva las columnas `createdAt` y `updatedAt`
});

module.exports = Usuario;
