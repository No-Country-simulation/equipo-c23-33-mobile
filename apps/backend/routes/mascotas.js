const Mascota = require('../models/mascotas');
const { Router } = require('express');
const router = Router();


// CRUD for Mascota
router.get('', async (req, res) => {
    try {
        const mascotas = await Mascota.findAll();
        res.json(mascotas);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const mascota = await Mascota.findByPk(req.params.id);
        res.json(mascota);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


router.post('/', async (req, res) => {
    const { Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio } = req.body;
    try {
        const mascota = await Mascota.create({ Nombre, Edad, Especie, Tamaño, Estado_Salud, Foto_URL, ID_Refugio });
        res.json(mascota);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/:id', async (req, res) => {
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

router.delete('/:id', async (req, res) => {
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

router.get('/filtros', async (req, res) => {
    const { especie, edad, tamano } = req.query;
    const filters = {};

    if (especie) {
        filters.Especie = especie;
    }
    if (edad) {
        filters.Edad = parseInt(edad,10);
    }
    if (tamano) {
        filters.Tamaño = tamano;
    }

    try {
        const mascotas = await Mascota.findAll({ where: filters });
        res.json(mascotas);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
