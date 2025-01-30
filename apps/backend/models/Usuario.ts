import bcrypt from 'bcryptjs';

export interface IUsuario {
  id_user?: string;
  name: string;
  email: string;
  contraseña: string;
  rol: 'Persona interesada' | 'shelter' | 'Administrador';
  created_at: Date;
}

export class Usuario {
  id_user?: string;
  name: string;
  email: string;
  contraseña: string;
  rol: 'Persona interesada' | 'shelter' | 'Administrador';
  created_at: Date;

  constructor(data: IUsuario) {
    if (!data.name || !data.email || !data.contraseña || !data.rol) {
      throw new Error("Faltan datos obligatorios: name, email, contraseña o rol");
    }

    this.id_user = data.id_user;
    this.name = data.name;
    this.email = data.email;
    this.contraseña = bcrypt.hashSync(data.contraseña, 10);  // Esto Encripta la contraseña
    this.rol = data.rol;
    this.created_at = data.created_at ?? new Date();  // Si no hay fecha, usa la actual
  }

  toFirestore(): Omit<IUsuario, 'id_user'> {
    return Object.fromEntries(
      Object.entries({
        name: this.name,
        email: this.email,
        contraseña: this.contraseña,
        rol: this.rol,
        created_at: this.created_at,
      }).filter(([_, v]) => v !== undefined) // Elimina valores undefined
    ) as Omit<IUsuario, 'id_user'>;
  }
}
