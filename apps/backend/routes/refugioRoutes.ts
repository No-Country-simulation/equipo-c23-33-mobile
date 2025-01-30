import { Router } from 'express';
import { 
  createshelter, 
  listshelters, 
  updateshelterController, 
  deleteshelterController,
  getshelterController 
} from '../controllers/refugioController';

const router = Router();

// Middleware para manejar errores en funciones async
const asyncHandler = (fn: Function) => (req: any, res: any, next: any) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

router.post('/', asyncHandler(createshelter));
router.get('/', asyncHandler(listshelters));
router.get('/:id', asyncHandler(getshelterController)); // Obtener shelter por ID
router.put('/:id', asyncHandler(updateshelterController)); // Actualizar shelter
router.delete('/:id', asyncHandler(deleteshelterController)); // Eliminar shelter

export default router;
