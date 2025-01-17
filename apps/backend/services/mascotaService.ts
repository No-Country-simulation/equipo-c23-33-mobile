// services/mascotaService.ts  
import { db } from '../config/firebaseConfig';  
import { Mascota } from '../models/Mascota';  

export const addMascota = async (mascotaData: Mascota) => {  
  const nuevaMascota = new Mascota(mascotaData);  
  const docRef = await db.collection('mascotas').add(nuevaMascota.toFirestore());  
  return docRef.id;  
};  

export const getMascotas = async () => {  
  const snapshot = await db.collection('mascotas').get();  
  return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));  
};