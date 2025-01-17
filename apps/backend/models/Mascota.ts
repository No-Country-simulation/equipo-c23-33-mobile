// models/Mascota.ts  
export interface IMascota {  
    id?: string;  
    nombre: string;  
    edad: number;  
    especie: string;  
    tamaño: string;  
    estadoSalud: string;  
    fotoURL: string;  
    idRefugio: number;  
  }  
  
  export class Mascota {  
    id?: string;  
    nombre: string;  
    edad: number;  
    especie: string;  
    tamaño: string;  
    estadoSalud: string;  
    fotoURL: string;  
    idRefugio: number;  
  
    constructor(data: IMascota) {  
      this.id = data.id;  
      this.nombre = data.nombre;  
      this.edad = data.edad;  
      this.especie = data.especie;  
      this.tamaño = data.tamaño;  
      this.estadoSalud = data.estadoSalud;  
      this.fotoURL = data.fotoURL;  
      this.idRefugio = data.idRefugio;  
    }  
  
    toFirestore(): Omit<IMascota, 'id'> {  
      return {  
        nombre: this.nombre,  
        edad: this.edad,  
        especie: this.especie,  
        tamaño: this.tamaño,  
        estadoSalud: this.estadoSalud,  
        fotoURL: this.fotoURL,  
        idRefugio: this.idRefugio,  
      };  
    }  
  }