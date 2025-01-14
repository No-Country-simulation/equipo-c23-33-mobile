import Refugio from '../../models/refugio.js';
import { Router } from 'express';
const router = Router();
// CRUD for Refugio


router.get('/refugios', async (req, res) => {
    try {
        const refugios = await Refugio.findAll();
        res.json(refugios);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/refugios/:id', async (req, res) => {
    try {
        const refugio = await Refugio.findByPk(req.params.id);
        res.json(refugio);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('/refugios', async (req, res) => {
    const { Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador } = req.body;
    try {
        const refugio = await Refugio.create({ Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador });
        res.json(refugio);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/refugios/:id', async (req, res) => {
    const { Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador } = req.body;
    try {
        const refugio = await Refugio.findByPk(req.params.id);
        if (refugio) {
            await refugio.update({ Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador });
            res.json(refugio);
        } else {
            res.status(404).json({ error: 'Refugio not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/refugios/:id', async (req, res) => {
    try {
        const refugio = await Refugio.findByPk(req.params.id);
        if (refugio) {
            await refugio.destroy();
            res.json({ message: 'Refugio deleted' });
        } else {
            res.status(404).json({ error: 'Refugio not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

