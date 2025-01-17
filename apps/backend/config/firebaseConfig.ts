import * as admin from 'firebase-admin';
import * as dotenv from 'dotenv';
// import * as serviceAccount from './api-mascotas-46740-firebase-adminsdk-tpf97-2ab385f558.json';

dotenv.config();
// Ajusta la ruta según tu estructura  
console.log(process.env.FIREBASE_TYPE);


const serviceAccount = {
  type: process.env.FIREBASE_TYPE,
  project_id: process.env.FIREBASE_PROJECT_ID,
  private_key_id: process.env.FIREBASE_PRIVATE_KEY_ID,
  private_key: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
  client_email: process.env.FIREBASE_CLIENT_EMAIL,
  client_id: process.env.FIREBASE_CLIENT_ID,
  auth_uri: process.env.FIREBASE_AUTH_URI,
  token_uri: process.env.FIREBASE_TOKEN_URI,
  auth_provider_x509_cert_url: process.env.FIREBASE_AUTH_PROVIDER_X509_CERT_URL,
  client_x509_cert_url: process.env.FIREBASE_CLIENT_X509_CERT_URL,
};

if (!serviceAccount.project_id) {
  throw new Error('Faltan datos del proyecto Firebase. Compruebe sus variables de entorno.');
}

admin.initializeApp({  
  credential: admin.credential.cert(serviceAccount as admin.ServiceAccount), // Configura las credenciales  
  databaseURL: process.env.FIREBASE_DATABASE_URL // Cambia esto por tu URL de base de datos  
});  

// Para usar Firestore  
const db = admin.firestore();  

// Si deseas usar la Realtime Database  
// const db = admin.database();  

export { db };