import { Request, Response } from 'express';
import { addshelter, getshelters, getshelterById, updateshelter, deleteshelter } from '../services/refugioService';

// Crear un nuevo shelter
export const createshelter = async (req: Request, res: Response) => {
  try {
    const shelterId = await addshelter(req.body);
    res.status(201).json({ id: shelterId });
  } catch (error) {
    console.error('Error al añadir el shelter:', error);
    res.status(500).json({ error: 'Error al añadir el shelter' });
  }
};

// Listar todos los shelters
export const listshelters = async (req: Request, res: Response) => {
  try {
    const shelters = await getshelters();
    res.status(200).json(shelters);
  } catch (error) {
    console.error('Error al obtener los shelters:', error);
    res.status(500).json({ error: 'Error al obtener los shelters' });
  }
};

// Obtener shelter por ID
export const getshelterController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const shelter = await getshelterById(id); // Función en el servicio para obtener por ID
    if (!shelter) {
      return res.status(404).json({ error: 'shelter no encontrado' });
    }
    res.status(200).json(shelter);
  } catch (error) {
    console.error('Error al obtener el shelter:', error);
    res.status(500).json({ error: 'Error al obtener el shelter' });
  }
};

// Actualizar un shelter
export const updateshelterController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await updateshelter(id, req.body);
    res.status(200).json({ message: 'shelter actualizado exitosamente' });
  } catch (error) {
    console.error('Error al actualizar el shelter:', error);
    res.status(500).json({ error: 'Error al actualizar el shelter' });
  }
};

// Eliminar un shelter
export const deleteshelterController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await deleteshelter(id);
    res.status(200).json({ message: 'shelter eliminado exitosamente' });
  } catch (error) {
    console.error('Error al eliminar el shelter:', error);
    res.status(500).json({ error: 'Error al eliminar el shelter' });
  }
};
