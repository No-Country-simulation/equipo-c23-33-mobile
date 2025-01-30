// services/refugioService.ts  
import { db } from '../config/firebaseConfig';  
import { Refugio } from '../models/Refugio';  

export const addRefugio = async (refugioData: Refugio) => {  
  const nuevoRefugio = new Refugio(refugioData);  
  const docRef = await db.collection('refugios').add(nuevoRefugio.toFirestore());  
  return docRef.id;  
};  

export const getRefugios = async () => {  
  const snapshot = await db.collection('Shelter').get();  
  return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));  
};