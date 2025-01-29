import { db } from '../config/firebaseConfig';
import { IRefugio, Refugio } from '../models/Refugio';

// Agregar un nuevo refugio
export const addRefugio = async (refugioData: IRefugio) => {
  const nuevoRefugio = new Refugio(refugioData);
  const docRef = await db.collection('refugios').add(nuevoRefugio.toFirestore());
  return docRef.id;
};

// Obtener todos los refugios
export const getRefugios = async () => {
  const snapshot = await db.collection('refugios').get();
  return snapshot.docs.map(doc => ({
    id: doc.id,
    ...doc.data(),
  }));
};

// Obtener refugio por ID
export const getRefugioById = async (id: string) => {
  const refugioRef = db.collection('refugios').doc(id);
  const doc = await refugioRef.get();
  if (!doc.exists) {
    return null; // Si no existe el refugio, devolver null
  }
  return { id: doc.id, ...doc.data() }; // Retornar los datos del refugio
};

// Actualizar un refugio por ID
export const updateRefugio = async (id: string, refugioData: Partial<IRefugio>) => {
  const refugioRef = db.collection('refugios').doc(id);
  await refugioRef.update(refugioData);
};

// Eliminar un refugio por ID
export const deleteRefugio = async (id: string) => {
  const refugioRef = db.collection('refugios').doc(id);
  await refugioRef.delete();
};
