// models/Refugio.ts  
export interface IRefugio {  
    id?: string;  
    nombre: string;  
    direccion: string;  
    telefono: string;  
  }  
  
  export class Refugio {  
    id?: string;  
    nombre: string;  
    direccion: string;  
    telefono: string;  
  
    constructor(data: IRefugio) {  
      this.id = data.id;  
      this.nombre = data.nombre;  
      this.direccion = data.direccion;  
      this.telefono = data.telefono;  
    }  
  
    toFirestore(): Omit<IRefugio, 'id'> {  
      return {  
        nombre: this.nombre,  
        direccion: this.direccion,  
        telefono: this.telefono,  
      };  
    }  
  }