// routes/mascotaRoutes.ts  
import { Router } from 'express';  
import { createMascota, listMascotas } from '../controllers/mascotaController';  

const router = Router();  

router.post('/', createMascota);  
router.get('/', listMascotas);  

export default router;