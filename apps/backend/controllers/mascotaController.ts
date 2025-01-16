// controllers/mascotaController.ts  
import { Request, Response } from 'express';  
import { addMascota, getMascotas } from '../services/mascotaService';  

export const createMascota = async (req: Request, res: Response) => {  
  try {  
    const mascotaId = await addMascota(req.body);  
    res.status(201).send({ id: mascotaId });  
  } catch (error) {  
    res.status(500).send({ error: 'Error al añadir la mascota' });  
  }  
};  

export const listMascotas = async (req: Request, res: Response) => {  
  try {  
    const mascotas = await getMascotas();  
    res.status(200).send(mascotas);  
  } catch (error) {  
    res.status(500).send({ error: 'Error al obtener las mascotas' });  
  }  
};