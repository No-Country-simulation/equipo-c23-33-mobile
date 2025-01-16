const Refugio = require('../models/refugio');
const { Router } = require('express');
const router = Router();
// CRUD for Refugio


router.get('', async (req, res) => {
    try {
        const refugios = await Refugio.findAll();
        res.json(refugios);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const refugio = await Refugio.findByPk(req.params.id);
        res.json(refugio);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('', async (req, res) => {
    const { Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador } = req.body;
    try {
        const refugio = await Refugio.create({ Nombre, Dirección, Teléfono, Email, Capacidad_Mascotas, ID_Usuario, ID_Administrador });
        res.json(refugio);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/:id', async (req, res) => {
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

router.delete('/:id', async (req, res) => {
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

module.exports = router;