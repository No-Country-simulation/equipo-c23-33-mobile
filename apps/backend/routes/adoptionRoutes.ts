import { Router } from 'express';
import { 
    createAdoptionRequest, 
    listAdoptionRequests, 
    getAdoptionRequest, 
    updateAdoptionRequestController, 
    deleteAdoptionRequestController 
} from '../controllers/adoptionController';

const router = Router();

// Middleware para manejar errores en función async
const asyncHandler = (fn: Function) => async (req: any, res: any, next: any) => {
  try {
    await fn(req, res, next);
  } catch (error) {
    next(error);
  }
};

// Definir las rutas usando `asyncHandler`
router.post('/', asyncHandler(createAdoptionRequest)); // Crear solicitud de adopción
router.get('/', asyncHandler(listAdoptionRequests)); // Listar solicitudes
router.get('/:id', asyncHandler(getAdoptionRequest)); // Obtener solicitud por ID
router.put('/:id', asyncHandler(updateAdoptionRequestController)); // Actualizar solicitud
router.delete('/:id', asyncHandler(deleteAdoptionRequestController)); // Eliminar solicitud

export default router;
