import { Router } from 'express';
import { createMascota, listMascotas, getMascota, updateMascota, deleteMascota } from '../controllers/mascotaController';

const router = Router();

// Middleware para manejar errores en funcion async
const asyncHandler = (fn: Function) => async (req: any, res: any, next: any) => {
  try {
    await fn(req, res, next);
  } catch (error) {
    next(error);
  }
};

// Definir las rutas usando `asyncHandler`
router.post('/', asyncHandler(createMascota)); // Crear una mascota
router.get('/', asyncHandler(listMascotas)); // Obtener todas las mascotas
router.get('/:id', asyncHandler(getMascota)); // Obtener una mascota por ID
router.put('/:id', asyncHandler(updateMascota)); // Actualizar una mascota
router.delete('/:id', asyncHandler(deleteMascota)); // Eliminar una mascota

export default router;
