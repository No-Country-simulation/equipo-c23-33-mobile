// quiero que inicializes la DB 
const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('postgres://user:pass@localhost:5432/refugio_animales');

async function initializeDatabase() {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

initializeDatabase();


