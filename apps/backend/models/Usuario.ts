import bcrypt from 'bcryptjs';

export interface IUsuario {
  id_user?: string;
  nombre: string;
  email: string;
  contraseña: string;
  rol: 'Persona interesada' | 'Refugio' | 'Administrador';
  creadoEn: Date;
}

export class Usuario {
  id_user?: string;
  nombre: string;
  email: string;
  contraseña: string;
  rol: 'Persona interesada' | 'Refugio' | 'Administrador';
  creadoEn: Date;

  constructor(data: IUsuario) {
    if (!data.nombre || !data.email || !data.contraseña || !data.rol) {
      throw new Error("Faltan datos obligatorios: nombre, email, contraseña o rol");
    }

    this.id_user = data.id_user;
    this.nombre = data.nombre;
    this.email = data.email;
    this.contraseña = bcrypt.hashSync(data.contraseña, 10);  // Esto Encripta la contraseña
    this.rol = data.rol;
    this.creadoEn = data.creadoEn ?? new Date();  // Si no hay fecha, usa la actual
  }

  toFirestore(): Omit<IUsuario, 'id_user'> {
    return Object.fromEntries(
      Object.entries({
        nombre: this.nombre,
        email: this.email,
        contraseña: this.contraseña,
        rol: this.rol,
        creadoEn: this.creadoEn,
      }).filter(([_, v]) => v !== undefined) // Elimina valores undefined
    ) as Omit<IUsuario, 'id_user'>;
  }
}
