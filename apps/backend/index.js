// Arranca la aplicacion del servidor.
const app = require("./app.js")

// Express


const PORT = require("./config.js");
const sequelize = require("./database.js");

async function main() {
    await // Sincronizar la base de datos
    sequelize.sync({ force: true }) 
    app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
}

main();