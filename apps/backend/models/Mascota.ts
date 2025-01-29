export interface IMascota {
  id?: string;
  nombre: string;
  edad: number;
  especie: string;
  tamaño: string;
  estadoSalud: string;  // Estado de salud (Saludable, Enfermo, Recuperación)
  fotoURL: string;
  idRefugio: string;
  criar: boolean;       // Indica si la mascota es una cría
  sexo: string;         // Sexo de la mascota (Macho/Hembra)
  refugio: string;      // Nombre del refugio
  creadoEn: Date;       // Fecha de creación de la mascota
}

export class Mascota {
  id?: string;
  nombre: string;
  edad: number;
  especie: string;
  tamaño: string;
  estadoSalud: string;  // Estado de salud (Saludable, Enfermo, Recuperación)
  fotoURL: string;
  idRefugio: string;
  criar: boolean;       // Indica si la mascota es una cría
  sexo: string;         // Sexo de la mascota (Macho/Hembra)
  refugio: string;      // Nombre del refugio
  creadoEn: Date;       // Fecha de creación de la mascota

  constructor(data: IMascota) {
    this.id = data.id;
    this.nombre = data.nombre;
    this.edad = data.edad;
    this.especie = data.especie;
    this.tamaño = data.tamaño;
    this.estadoSalud = data.estadoSalud;
    this.fotoURL = data.fotoURL;
    this.idRefugio = data.idRefugio;
    this.criar = data.criar;
    this.sexo = data.sexo;
    this.refugio = data.refugio;
    this.creadoEn = data.creadoEn;
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
      criar: this.criar,
      sexo: this.sexo,
      refugio: this.refugio,
      creadoEn: this.creadoEn,
    };
  }
}
