import { Request, Response } from 'express';
import { 
  addMascota, 
  getMascotas, 
  getMascotaById, 
  updateMascotaService, 
  deleteMascotaService 
} from '../services/mascotaService';

// Crear nueva mascota
export const createMascota = async (req: Request, res: Response) => {
  try {
    const mascotaId = await addMascota(req.body);
    res.status(201).json({ id: mascotaId });
  } catch (error) {
    console.error("Error al crear mascota:", error);
    res.status(500).json({ error: 'Error al añadir la mascota' });
  }
};

// Listar todas las mascotas con filtros
export const listMascotas = async (req: Request, res: Response) => {
  try {
    const filtros = req.query;
    const mascotas = await getMascotas(filtros);
    res.json(mascotas);
  } catch (error) {
    console.error("Error al listar mascotas:", error);
    res.status(500).json({ error: "Error al listar las mascotas" });
  }
};

// Obtener una mascota por ID
export const getMascota = async (req: Request, res: Response) => {
  try {
    const mascota = await getMascotaById(req.params.id);
    if (!mascota) {
      return res.status(404).json({ error: 'Mascota no encontrada' });
    }
    res.json(mascota);
  } catch (error) {
    console.error("Error al obtener mascota:", error);
    res.status(500).json({ error: "Error al obtener la mascota" });
  }
};

// Actualizar mascota
export const updateMascota = async (req: Request, res: Response) => {
  try {
    const updated = await updateMascotaService(req.params.id, req.body);
    if (!updated) {
      return res.status(404).json({ error: "Mascota no encontrada" });
    }
    res.json({ message: "Mascota actualizada correctamente" });
  } catch (error) {
    console.error("Error al actualizar mascota:", error);
    res.status(500).json({ error: "Error al actualizar la mascota" });
  }
};

// Eliminar mascota
export const deleteMascota = async (req: Request, res: Response) => {
  try {
    const deleted = await deleteMascotaService(req.params.id);
    if (!deleted) {
      return res.status(404).json({ error: "Mascota no encontrada" });
    }
    res.json({ message: "Mascota eliminada correctamente" });
  } catch (error) {
    console.error("Error al eliminar mascota:", error);
    res.status(500).json({ error: "Error al eliminar la mascota" });
  }
};
