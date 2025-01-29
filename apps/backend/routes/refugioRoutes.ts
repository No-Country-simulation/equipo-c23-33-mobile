import { Router } from 'express';
import { 
  createRefugio, 
  listRefugios, 
  updateRefugioController, 
  deleteRefugioController,
  getRefugioController 
} from '../controllers/refugioController';

const router = Router();

// Middleware para manejar errores en funciones async
const asyncHandler = (fn: Function) => (req: any, res: any, next: any) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

router.post('/', asyncHandler(createRefugio));
router.get('/', asyncHandler(listRefugios));
router.get('/:id', asyncHandler(getRefugioController)); // Obtener refugio por ID
router.put('/:id', asyncHandler(updateRefugioController)); // Actualizar refugio
router.delete('/:id', asyncHandler(deleteRefugioController)); // Eliminar refugio

export default router;
