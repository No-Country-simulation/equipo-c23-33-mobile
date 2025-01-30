import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import mascotaRoutes from './routes/mascotaRoutes';
import refugioRoutes from './routes/refugioRoutes';
import usuarioRoutes from './routes/usuarioRoute';
dotenv.config();

const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3000;

// Rutas
app.use('/mascotas', mascotaRoutes);
app.use('/refugios', refugioRoutes);
app.use('/usuarios',usuarioRoutes);

// Middleware para manejar errores (IMPORTANTE)
app.use((err: any, req: Request, res: Response, next: NextFunction) => {
  console.error('Error en el servidor:', err.stack);
  res.status(err.status || 500).json({ error: err.message || 'Error interno del servidor' });
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en puerto ${PORT}`);
});
