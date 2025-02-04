import { db } from '../config/firebaseConfig';
import { IAdoptionRequest, AdoptionRequest } from '../models/AdoptionRequest';

// Agregar una nueva solicitud de adopción
export const addAdoptionRequest = async (data: IAdoptionRequest): Promise<string> => {
    const newRequest = new AdoptionRequest(data);
    const docRef = await db.collection('adoption_requests').add(newRequest.toFirestore());
    return docRef.id;
};

// Obtener una solicitud por ID
export const getAdoptionRequestById = async (id: string): Promise<IAdoptionRequest | null> => {
    const doc = await db.collection('adoption_requests').doc(id).get();
    return doc.exists ? { id_request: doc.id, ...doc.data() as IAdoptionRequest } : null;
};

// Obtener todas las solicitudes con filtros
export const getAdoptionRequests = async (filters: Partial<IAdoptionRequest>): Promise<IAdoptionRequest[]> => {
    let queryRef = db.collection('adoption_requests') as FirebaseFirestore.Query;

    Object.entries(filters).forEach(([key, value]) => {
        if (value !== undefined) {
            queryRef = queryRef.where(key, '==', value);
        }
    });

    const snapshot = await queryRef.get();
    return snapshot.docs.map(doc => ({ id_request: doc.id, ...doc.data() as IAdoptionRequest }));
};

// Actualizar una solicitud
export const updateAdoptionRequest = async (id: string, data: Partial<IAdoptionRequest>): Promise<boolean> => {
    const docRef = db.collection('adoption_requests').doc(id);
    const doc = await docRef.get();

    if (!doc.exists) return false;

    await docRef.update(data);
    return true;
};

// Eliminar una solicitud
export const deleteAdoptionRequest = async (id: string): Promise<boolean> => {
    const docRef = db.collection('adoption_requests').doc(id);
    const doc = await docRef.get();

    if (!doc.exists) return false;

    await docRef.delete();
    return true;
};
