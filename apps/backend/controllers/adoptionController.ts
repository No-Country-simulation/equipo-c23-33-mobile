import { Request, Response } from 'express';
import { 
    addAdoptionRequest, 
    getAdoptionRequestById, 
    getAdoptionRequests, 
    updateAdoptionRequest, 
    deleteAdoptionRequest 
} from '../services/adoptionService';

// Crear una nueva solicitud de adopción
export const createAdoptionRequest = async (req: Request, res: Response) => {
    try {
        const requestId = await addAdoptionRequest(req.body);
        res.status(201).json({ id_request: requestId });
    } catch (error) {
        console.error("Error al crear solicitud:", error);
        res.status(500).json({ error: 'Error al añadir la solicitud' });
    }
};

// Obtener todas las solicitudes con filtros
export const listAdoptionRequests = async (req: Request, res: Response) => {
    try {
        const filters = req.query;
        const requests = await getAdoptionRequests(filters);
        res.json(requests);
    } catch (error) {
        console.error("Error al listar solicitudes:", error);
        res.status(500).json({ error: "Error al listar las solicitudes" });
    }
};

// Obtener una solicitud por ID
export const getAdoptionRequest = async (req: Request, res: Response) => {
    try {
        const request = await getAdoptionRequestById(req.params.id);
        if (!request) {
            return res.status(404).json({ error: 'Solicitud no encontrada' });
        }
        res.json(request);
    } catch (error) {
        console.error("Error al obtener solicitud:", error);
        res.status(500).json({ error: "Error al obtener la solicitud" });
    }
};

// Actualizar una solicitud de adopción
export const updateAdoptionRequestController = async (req: Request, res: Response) => {
    try {
        const updated = await updateAdoptionRequest(req.params.id, req.body);
        if (!updated) {
            return res.status(404).json({ error: "Solicitud no encontrada" });
        }
        res.json({ message: "Solicitud actualizada correctamente" });
    } catch (error) {
        console.error("Error al actualizar solicitud:", error);
        res.status(500).json({ error: "Error al actualizar la solicitud" });
    }
};

// Eliminar una solicitud de adopción
export const deleteAdoptionRequestController = async (req: Request, res: Response) => {
    try {
        const deleted = await deleteAdoptionRequest(req.params.id);
        if (!deleted) {
            return res.status(404).json({ error: "Solicitud no encontrada" });
        }
        res.json({ message: "Solicitud eliminada correctamente" });
    } catch (error) {
        console.error("Error al eliminar solicitud:", error);
        res.status(500).json({ error: "Error al eliminar la solicitud" });
    }
};
