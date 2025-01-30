import { db } from '../config/firebaseConfig';
import { Ishelter, shelter } from '../models/Refugio';

// Agregar un nuevo shelter
export const addshelter = async (shelterData: Ishelter) => {
  const nuevoshelter = new shelter(shelterData);
  const docRef = await db.collection('shelters').add(nuevoshelter.toFirestore());
  return docRef.id;
};

// Obtener todos los shelters
export const getshelters = async () => {
  const snapshot = await db.collection('shelters').get();
  return snapshot.docs.map(doc => ({
    id: doc.id,
    ...doc.data(),
  }));
};

// Obtener shelter por ID
export const getshelterById = async (id: string) => {
  const shelterRef = db.collection('shelters').doc(id);
  const doc = await shelterRef.get();
  if (!doc.exists) {
    return null; // Si no existe el shelter, devolver null
  }
  return { id: doc.id, ...doc.data() }; // Retornar los datos del shelter
};

// Actualizar un shelter por ID
export const updateshelter = async (id: string, shelterData: Partial<Ishelter>) => {
  const shelterRef = db.collection('shelters').doc(id);
  await shelterRef.update(shelterData);
};

// Eliminar un shelter por ID
export const deleteshelter = async (id: string) => {
  const shelterRef = db.collection('shelters').doc(id);
  await shelterRef.delete();
};
