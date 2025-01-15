// Arranca la aplicacion del servidor.
const app = require("./app.js")

// Express


const PORT = require("./config.js")

async function main() {
    await app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
}

main();