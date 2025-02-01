import express from 'express';
import dotenv from 'dotenv';
import mascotaRoutes from './routes/mascotaRoutes';
import refugioRoutes from './routes/refugioRoutes';

// Cargar las variables de entorno desde el archivo .env
dotenv.config();

const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3000;

app.use('/pets', mascotaRoutes);
app.use('/shelters', refugioRoutes);

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
