import bcrypt from 'bcryptjs'
import { db } from '../config/firebaseConfig';
import { IUsuario, Usuario } from '../models/Usuario';

// Agregar un nuevo usuario
export const addUsuario = async (usuarioData: IUsuario): Promise<string> => {
  // Encriptamos la contraseña antes de guardar
  const salt = bcrypt.genSaltSync(10);
  usuarioData.contraseña = bcrypt.hashSync(usuarioData.contraseña, salt);

  const nuevoUsuario = new Usuario(usuarioData);
  const docRef = await db.collection('user').add(nuevoUsuario.toFirestore());
  return docRef.id;
};

// usuario por email 
export const getUsuarioByEmail = async (email: string): Promise<IUsuario | null> => {
  const snapshot = await db.collection('user').where('email', '==', email).get();
  
  if (snapshot.empty) return null;

  const doc = snapshot.docs[0];
  return { id_user: doc.id, ...doc.data() as IUsuario };
};

// Obtener un usuario por ID
export const getUsuarioById = async (id: string): Promise<IUsuario | null> => {
  const doc = await db.collection('user').doc(id).get();
  return doc.exists ? { id_user: doc.id, ...doc.data() as IUsuario } : null;
};

// Obtener todos los usuarios con filtros
export const getUsuarios = async (filtros: Partial<IUsuario>): Promise<IUsuario[]> => {
  let queryRef = db.collection('user') as FirebaseFirestore.Query;

  Object.entries(filtros).forEach(([key, value]) => {
    if (value !== undefined) {
      queryRef = queryRef.where(key, '==', value);
    }
  });

  const snapshot = await queryRef.get();
  return snapshot.docs.map(doc => ({ id_user: doc.id, ...doc.data() as IUsuario }));
};

// Actualizar usuario
export const updateUsuarioService = async (id: string, data: Partial<IUsuario>): Promise<boolean> => {
  const docRef = db.collection('user').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.update(data);
  return true;
};

// Eliminar usuario
export const deleteUsuarioService = async (id: string): Promise<boolean> => {
  const docRef = db.collection('user').doc(id);
  const doc = await docRef.get();

  if (!doc.exists) return false;

  await docRef.delete();
  return true;
};
