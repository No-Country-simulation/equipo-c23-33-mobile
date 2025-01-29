import { Request, Response } from 'express';
import { addRefugio, getRefugios, getRefugioById, updateRefugio, deleteRefugio } from '../services/refugioService';

// Crear un nuevo refugio
export const createRefugio = async (req: Request, res: Response) => {
  try {
    const refugioId = await addRefugio(req.body);
    res.status(201).json({ id: refugioId });
  } catch (error) {
    console.error('Error al añadir el refugio:', error);
    res.status(500).json({ error: 'Error al añadir el refugio' });
  }
};

// Listar todos los refugios
export const listRefugios = async (req: Request, res: Response) => {
  try {
    const refugios = await getRefugios();
    res.status(200).json(refugios);
  } catch (error) {
    console.error('Error al obtener los refugios:', error);
    res.status(500).json({ error: 'Error al obtener los refugios' });
  }
};

// Obtener refugio por ID
export const getRefugioController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const refugio = await getRefugioById(id); // Función en el servicio para obtener por ID
    if (!refugio) {
      return res.status(404).json({ error: 'Refugio no encontrado' });
    }
    res.status(200).json(refugio);
  } catch (error) {
    console.error('Error al obtener el refugio:', error);
    res.status(500).json({ error: 'Error al obtener el refugio' });
  }
};

// Actualizar un refugio
export const updateRefugioController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await updateRefugio(id, req.body);
    res.status(200).json({ message: 'Refugio actualizado exitosamente' });
  } catch (error) {
    console.error('Error al actualizar el refugio:', error);
    res.status(500).json({ error: 'Error al actualizar el refugio' });
  }
};

// Eliminar un refugio
export const deleteRefugioController = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await deleteRefugio(id);
    res.status(200).json({ message: 'Refugio eliminado exitosamente' });
  } catch (error) {
    console.error('Error al eliminar el refugio:', error);
    res.status(500).json({ error: 'Error al eliminar el refugio' });
  }
};
