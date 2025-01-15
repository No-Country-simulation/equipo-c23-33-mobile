require('dotenv').config(); // Carga variables de entorno desde .env

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASS, {
    host: process.env.DB_HOST,
    port: 5432, // Especifica el puerto si no es el estándar
    dialect: process.env.DB_DIALECT,
    logging: false,
});

async function initializeDatabase() {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error.message);
    }
}

initializeDatabase();

module.exports = sequelize;
