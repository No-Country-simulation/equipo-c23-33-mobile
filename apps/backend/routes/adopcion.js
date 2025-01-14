import Solicitud_Adopción from '../../models/solicitud.js';
import { Router } from 'express';
const router = Router();


// CRUD for Solicitud_Adopción
router.get('/solicitudes', async (req, res) => {
    try {
        const solicitudes = await Solicitud_Adopción.findAll();
        res.json(solicitudes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/solicitudes/:id', async (req, res) => {
    try {
        const solicitud = await Solicitud_Adopción.findByPk(req.params.id);
        res.json(solicitud);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('/solicitudes', async (req, res) => {
    const { ID_Usuario, ID_Mascota, Fecha_Solicitud, Estado } = req.body;
    try {
        const solicitud = await Solicitud_Adopción.create({ ID_Usuario, ID_Mascota, Fecha_Solicitud, Estado });
        res.json(solicitud);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/solicitudes/:id', async (req, res) => {
    const { ID_Usuario, ID_Mascota, Fecha_Solicitud, Estado } = req.body;
    try {
        const solicitud = await Solicitud_Adopción.findByPk(req.params.id);
        if (solicitud) {
            await solicitud.update({ ID_Usuario, ID_Mascota, Fecha_Solicitud, Estado });
            res.json(solicitud);
        } else {
            res.status(404).json({ error: 'Solicitud_Adopción not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/solicitudes/:id', async (req, res) => {
    try {
        const solicitud = await Solicitud_Adopción.findByPk(req.params.id);
        if (solicitud) {
            await solicitud.destroy();
            res.json({ message: 'Solicitud_Adopción deleted' });
        } else {
            res.status(404).json({ error: 'Solicitud_Adopción not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});