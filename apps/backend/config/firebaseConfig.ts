
import * as admin from 'firebase-admin';  
import * as serviceAccount from './api-mascotas-46740-firebase-adminsdk-tpf97-2ab385f558.json'; // Ajusta la ruta según tu estructura  

admin.initializeApp({  
  credential: admin.credential.cert(serviceAccount as admin.ServiceAccount), // Configura las credenciales  
  databaseURL: 'https://api-mascotas-46740.firebaseio.com' // Cambia esto por tu URL de base de datos  
});  

// Para usar Firestore  
const db = admin.firestore();  

// Si deseas usar la Realtime Database  
// const db = admin.database();  

export { db };