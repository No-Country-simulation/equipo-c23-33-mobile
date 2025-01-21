import { db } from '../config/firebaseConfig';
import { IMascota, Mascota } from '../models/Mascota';
import * as admin from 'firebase-admin';

// Función para agregar una nueva mascota
export const addMascota = async (mascotaData: IMascota) => {
  const nuevaMascota = new Mascota(mascotaData);
  const collectionRef = db.collection('mascotas');
  const docRef = await collectionRef.add(nuevaMascota.toFirestore());
  return docRef.id;
};
export const getMascotasByRefugio = async (idRefugio: string) => {
  const snapshot = await db.collection('mascotas').where('idRefugio', '==', idRefugio).get();

  if (snapshot.empty) {
    console.log('No se encontraron mascotas con este idRefugio.');
    return [];
  }

  return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
};

// Función para obtener mascotas con filtros
export const getMascotas = async (filtros?: {
  nombre?: string;
  especie?: string;
  tamaño?: string;
  estadoSalud?: string;
  idRefugio?: number;
  edad?: number;
}) => {
  const collectionRef = db.collection('mascotas');
  let queryRef: admin.firestore.Query = collectionRef;

  // Aplicar filtros dinámicamente
  if (filtros) {
    if (filtros.nombre) {
      queryRef = queryRef.where('nombre', '==', filtros.nombre);
    }
    if (filtros.especie) {
      queryRef = queryRef.where('especie', '==', filtros.especie);
    }
    if (filtros.tamaño) {
      queryRef = queryRef.where('tamaño', '==', filtros.tamaño);
    }
    if (filtros.estadoSalud) {
      queryRef = queryRef.where('estadoSalud', '==', filtros.estadoSalud);
    }
    if (filtros.idRefugio !== undefined) {
      queryRef = queryRef.where('idRefugio', '==', filtros.idRefugio);
    }
    if (filtros.edad !== undefined) {
      queryRef = queryRef.where('edad', '==', filtros.edad);
    }
  }

  const snapshot = await queryRef.get();

  if (snapshot.empty) {
    console.log("No se encontraron mascotas con los filtros proporcionados.");
    return [];
  }

  console.log("Documentos obtenidos:", snapshot.docs.map(doc => doc.data()));

  return snapshot.docs.map((doc) => ({
    id: doc.id,
    ...(doc.data() as IMascota),
  }));
};
