export interface IRefugio {
  id?: string;
  nombre: string;
  direccion: string;
  telefono: string;
  correoElectronico: string; // Agregado
  estadoSaludAceptado: 'Saludable' | 'Enfermo' | 'Recuperación'; // Agregado
  capacidadMascota: number; // Agregado
  idUsuario: string; // FK de usuario
  idAdmin: string; // FK de admin
  creadoEn: string; // Fecha de creación
}

export class Refugio {
  id?: string;
  nombre: string;
  direccion: string;
  telefono: string;
  correoElectronico: string; // Agregado
  estadoSaludAceptado: 'Saludable' | 'Enfermo' | 'Recuperación'; // Agregado
  capacidadMascota: number; // Agregado
  idUsuario: string; // FK de usuario
  idAdmin: string; // FK de admin
  creadoEn: string; // Fecha de creación

  constructor(data: IRefugio) {
    this.id = data.id;
    this.nombre = data.nombre;
    this.direccion = data.direccion;
    this.telefono = data.telefono;
    this.correoElectronico = data.correoElectronico;
    this.estadoSaludAceptado = data.estadoSaludAceptado;
    this.capacidadMascota = data.capacidadMascota;
    this.idUsuario = data.idUsuario;
    this.idAdmin = data.idAdmin;
    this.creadoEn = data.creadoEn;
  }

  toFirestore(): Omit<IRefugio, 'id'> {
    return {
      nombre: this.nombre,
      direccion: this.direccion,
      telefono: this.telefono,
      correoElectronico: this.correoElectronico,
      estadoSaludAceptado: this.estadoSaludAceptado,
      capacidadMascota: this.capacidadMascota,
      idUsuario: this.idUsuario,
      idAdmin: this.idAdmin,
      creadoEn: this.creadoEn,
    };
  }
}

