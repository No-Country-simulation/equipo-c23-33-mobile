import Mascota from '../../models/mascotas.js';
import { Router } from 'express';
const router = Router();


// CRUD for Mascota
router.get('/mascotas', async (req, res) => {
    try {
        const mascotas = await Mascota.findAll();
        res.json(mascotas);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/mascotas/:id', async (req, res) => {
    try {
        const mascota = await Mascota.findByPk(req.params.id);
        res.json(mascota);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('/mascotas', async (req, res) => {
    const { Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio } = req.body;
    try {
        const mascota = await Mascota.create({ Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio });
        res.json(mascota);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/mascotas/:id', async (req, res) => {
    const { Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio } = req.body;
    try {
        const mascota = await Mascota.findByPk(req.params.id);
        if (mascota) {
            await mascota.update({ Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio });
            res.json(mascota);
        } else {
            res.status(404).json({ error: 'Mascota not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/mascotas/:id', async (req, res) => {
    try {
        const mascota = await Mascota.findByPk(req.params.id);
        if (mascota) {
            await mascota.destroy();
            res.json({ message: 'Mascota deleted' });
        } else {
            res.status(404).json({ error: 'Mascota not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});
