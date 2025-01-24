import { Request, Response } from 'express';
import { addMascota, getMascotas, getMascotasByRefugio } from '../services/mascotaService';
import { db } from '../config/firebaseConfig';

// Endpoint para crear una nueva mascota
export const createMascota = async (req: Request, res: Response) => {
  try {
    const mascotaId = await addMascota(req.body);
    res.status(201).send({ id: mascotaId });
  } catch (error) {
    console.error("Error al crear mascota:", error);
    res.status(500).send({ error: 'Error al añadir la mascota' });
  }
};

// Endpoint para listar mascotas con filtros
export const listMascotas = async (req: Request, res: Response) => {
  try {
    console.log("Query parameters recibidos:", req.query);

    const filtros = {
      nombre: req.query.nombre as string,
      especie: req.query.especie as string,
      tamaño: req.query.tamaño as string,
      estadoSalud: req.query.estadoSalud as string,
      idRefugio: req.query.idRefugio ? Number(req.query.idRefugio) : undefined,
      edad: req.query.edad ? Number(req.query.edad) : undefined,
    };

    console.log("Filtros aplicados:", filtros);

    const mascotas = await getMascotas(filtros);

    console.log("Resultados obtenidos del servicio:", mascotas);

    res.json(mascotas);
  } catch (error) {
    console.error("Error al listar mascotas:", error);
    res.status(500).json({ error: "Error al listar las mascotas" });
  }
};

export const listMascotasByRefugio = async (req: Request, res: Response) => {
  const { idRefugio } = req.params;

  try {
    const snapshot = await db
      .collection('mascotas')
      .where('idRefugio', '==', idRefugio) // No es necesario convertir el tipo aquí
      .get();

    if (snapshot.empty) {
      return res.status(404).send({ message: 'No se encontraron mascotas con este idRefugio.' });
    }

    const mascotas = snapshot.docs.map((doc) => ({
      id: doc.id,
      ...doc.data(),
    }));

    res.status(200).send(mascotas);
  } catch (error) {
    res.status(500).send({ error: 'Error al obtener mascotas por refugio' });
  }
};