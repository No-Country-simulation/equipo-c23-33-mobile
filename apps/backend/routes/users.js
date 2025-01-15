const Usuario = require('../models/users');

const { Router } = require('express');
const router = Router();
console.log(router);


// CRUD for Usuario
router.get('/usuarios', async (req, res) => {
    try {
        const usuarios = await Usuario.findAll();
        res.json(usuarios);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/usuarios/:id', async (req, res) => {
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        res.json(usuario);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('/usuarios', async (req, res) => {
    console.log(req.body);
    
    const { Nombre, Email, Contraseña, Rol } = req.body;
    try {
        const usuario = await Usuario.create({ Nombre, Email, Contraseña, Rol });
        res.json(usuario);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/usuarios/:id', async (req, res) => {
    const { Nombre, Email, Contraseña, Rol } = req.body;
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        if (usuario) {
            await usuario.update({ Nombre, Email, Contraseña, Rol });
            res.json(usuario);
        } else {
            res.status(404).json({ error: 'Usuario not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/usuarios/:id', async (req, res) => {
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        if (usuario) {
            await usuario.destroy();
            res.json({ message: 'Usuario deleted' });
        } else {
            res.status(404).json({ error: 'Usuario not found' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});




module.exports =  router;


