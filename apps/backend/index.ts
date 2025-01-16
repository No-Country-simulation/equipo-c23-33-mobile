import express from 'express';  
import mascotaRoutes from './routes/mascotaRoutes';  
import refugioRoutes from './routes/refugioRoutes';  

const app = express();  
app.use(express.json());  

const PORT = process.env.PORT || 3000;  

app.use('/mascotas', mascotaRoutes);  
app.use('/refugios', refugioRoutes);  

app.listen(PORT, () => {  
  console.log(`Servidor corriendo en puerto ${PORT}`);  
});