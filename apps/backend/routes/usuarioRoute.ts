import { Router } from 'express';
import { 
  createUsuario, 
  listUsuarios, 
  getUsuario, 
  updateUsuario, 
  deleteUsuario 
} from '../controllers/usuarioController';

const router = Router();

const asyncHandler = (fn: Function) => (req: any, res: any, next: any) => {
  return Promise.resolve(fn(req, res, next)).catch(next);
};

// Definir las rutas usando `asyncHandler` para manejar errores en funciones asíncronas
router.post('/', asyncHandler(createUsuario)); // Crear un nuevo usuario
router.get('/', asyncHandler(listUsuarios)); // Obtener todos los usuarios
router.get('/:id', asyncHandler(getUsuario)); // Obtener un usuario por ID
router.put('/:id', asyncHandler(updateUsuario)); // Actualizar un usuario
router.delete('/:id', asyncHandler(deleteUsuario)); // Eliminar un usuario

export default router;
