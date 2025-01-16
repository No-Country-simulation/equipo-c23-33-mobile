const Usuario = require('./users');  
const Solicitud_Adopción = require('./solicitud');  
const Mascota = require('./mascotas');  
const Refugio = require('./refugio');  
const sequelize = require('../database');
// Relación: Un Usuario puede tener muchas Solicitudes de Adopción
Usuario.hasMany(Solicitud_Adopción, {
    foreignKey: 'ID_Usuario',  // Este es el campo en la tabla Solicitud_Adopción que hace referencia a Usuario
    onDelete: 'CASCADE'         // Si se elimina un usuario, se eliminan las solicitudes de adopción asociadas
});

// Relación inversa: Una Solicitud de Adopción pertenece a un Usuario
Solicitud_Adopción.belongsTo(Usuario, {
    foreignKey: 'ID_Usuario', 
    onDelete: 'CASCADE'         
});
Mascota.belongsTo(Refugio, {
    foreignKey: 'ID_Refugio', 
    onDelete: 'CASCADE'         
});

module.exports = { Usuario, Solicitud_Adopción, Mascota, Refugio };
