const Usuario = require('./users');  // Ajusta la ruta según sea necesario
const Solicitud_Adopción = require('./solicitud');  // Ajusta la ruta según sea necesario
const sequelize = require('../database');
// Relación: Un Usuario puede tener muchas Solicitudes de Adopción
Usuario.hasMany(Solicitud_Adopción, {
    foreignKey: 'ID_Usuario',  // Este es el campo en la tabla Solicitud_Adopción que hace referencia a Usuario
    onDelete: 'CASCADE'         // Si se elimina un usuario, se eliminan las solicitudes de adopción asociadas
});

// Relación inversa: Una Solicitud de Adopción pertenece a un Usuario
Solicitud_Adopción.belongsTo(Usuario, {
    foreignKey: 'ID_Usuario',  // Este es el campo en la tabla Solicitud_Adopción que hace referencia a Usuario
    onDelete: 'CASCADE'         // Si se elimina una solicitud de adopción, el campo ID_Usuario se actualizaría (si fuera necesario)
});

// Sincronizar la base de datos
sequelize.sync({ force: true })  // El parámetro force: true eliminará las tablas existentes y las volverá a crear
  .then(() => {
    console.log('Base de datos sincronizada');
  })
  .catch((error) => {
    console.error('Error al sincronizar la base de datos:', error);
  });

module.exports = { Usuario, Solicitud_Adopción };
