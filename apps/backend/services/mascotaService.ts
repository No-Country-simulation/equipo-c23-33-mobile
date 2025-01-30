import { db } from '../config/firebaseConfig';
import { Pets, pet } from '../models/Mascota';

// Agregar una nueva mascota
export const addMascota = async (mascotaData: Pets): Promise<string> => {
  const nuevaMascota = new pet(mascotaData);
  const docRef = await db.collection('pets').add(nuevaMascota.toFirestore());
  return docRef.id;
};

// Obtener una mascota por ID
export const getMascotaById = async (id: string): Promise<Pets | null> => {
  const doc = await db.collection('pets').doc(id).get();
  return doc.exists ? { id: doc.id, ...doc.data() as Pets } : null;
};

// Obtener todas las mascotas con filtros
export const getMascotas = async (filtros: Partial<Pets>): Promise<Pets[]> => {
  let queryRef = db.collection('pets') as FirebaseFirestore.Query;

  Object.entries(filtros).forEach(([key, value]) => {
    if (value !== undefined) {
      queryRef = queryRef.where(key, '==', value);
    }
  });

  const snapshot = await queryRef.get();
  return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() as Pets }));
};

// Actualizar mascota
export const updateMascotaService = async (id: string, data: Partial<Pets>): Promise<boolean> => {
  const docRef = db.collection('pets').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.update(data);
  return true;
};

// Eliminar mascota
export const deleteMascotaService = async (id: string): Promise<boolean> => {
  const docRef = db.collection('pets').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.delete();
  return true;
};
