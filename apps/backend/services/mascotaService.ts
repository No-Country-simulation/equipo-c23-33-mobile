import { db } from '../config/firebaseConfig';
import { IMascota, Mascota } from '../models/Mascota';

// Agregar una nueva mascota
export const addMascota = async (mascotaData: IMascota): Promise<string> => {
  const nuevaMascota = new Mascota(mascotaData);
  const docRef = await db.collection('mascotas').add(nuevaMascota.toFirestore());
  return docRef.id;
};

// Obtener una mascota por ID
export const getMascotaById = async (id: string): Promise<IMascota | null> => {
  const doc = await db.collection('mascotas').doc(id).get();
  return doc.exists ? { id: doc.id, ...doc.data() as IMascota } : null;
};

// Obtener todas las mascotas con filtros
export const getMascotas = async (filtros: Partial<IMascota>): Promise<IMascota[]> => {
  let queryRef = db.collection('mascotas') as FirebaseFirestore.Query;

  Object.entries(filtros).forEach(([key, value]) => {
    if (value !== undefined) {
      queryRef = queryRef.where(key, '==', value);
    }
  });

  const snapshot = await queryRef.get();
  return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() as IMascota }));
};

// Actualizar mascota
export const updateMascotaService = async (id: string, data: Partial<IMascota>): Promise<boolean> => {
  const docRef = db.collection('mascotas').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.update(data);
  return true;
};

// Eliminar mascota
export const deleteMascotaService = async (id: string): Promise<boolean> => {
  const docRef = db.collection('mascotas').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.delete();
  return true;
};
