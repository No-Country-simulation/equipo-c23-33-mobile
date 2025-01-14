// Arranca la aplicacion del servidor.
import app from './app.js';
import PORT  from '../config.js';

async function main() {
    await app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
}

main();