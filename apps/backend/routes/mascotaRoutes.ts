import { Router } from 'express';
import { createMascota, listMascotas, listMascotasByRefugio } from '../controllers/mascotaController';

const router = Router();

// Usa una envoltura para manejar errores en las funciones asincrónicas
const asyncHandler = (fn: Function) => (req: any, res: any, next: any) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

router.post('/', asyncHandler(createMascota)); // Crear mascota
router.get('/', asyncHandler(listMascotas));  // Listar todas las mascotas
router.get('/refugio/:idRefugio', asyncHandler(listMascotasByRefugio)); // Listar mascotas por refugio

export default router;

