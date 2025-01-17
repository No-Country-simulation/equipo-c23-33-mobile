// routes/refugioRoutes.ts  
import { Router } from 'express';  
import { createRefugio, listRefugios } from '../controllers/refugioController';  

const router = Router();  

router.post('/', createRefugio);  
router.get('/', listRefugios);  

export default router;