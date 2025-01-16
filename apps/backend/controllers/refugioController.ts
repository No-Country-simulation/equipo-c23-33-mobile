// controllers/refugioController.ts  
import { Request, Response } from 'express';  
import { addRefugio, getRefugios } from '../services/refugioService';  

export const createRefugio = async (req: Request, res: Response) => {  
  try {  
    const refugioId = await addRefugio(req.body);  
    res.status(201).send({ id: refugioId });  
  } catch (error) {  
    res.status(500).send({ error: 'Error al añadir el refugio' });  
  }  
};  

export const listRefugios = async (req: Request, res: Response) => {  
  try {  
    const refugios = await getRefugios();  
    res.status(200).send(refugios);  
  } catch (error) {  
    res.status(500).send({ error: 'Error al obtener los refugios' });  
  }  
};