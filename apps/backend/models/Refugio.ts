export interface Ishelter {
  id?: string;
  name: string;
  address: string;
  phone: string;
  email: string; // Agregado
  accepted_health_condition: 'Saludable' | 'Enfermo' | 'Recuperación'; // Agregado
  pet_capacity: number; // Agregado
  id_user: string; // FK de usuario
  id_admin: string; // FK de admin
  created_at: string; // Fecha de creación
}

export class shelter {
  id?: string;
  name: string;
  address: string;
  phone: string;
  email: string; // Agregado
  accepted_health_condition: 'Saludable' | 'Enfermo' | 'Recuperación'; // Agregado
  pet_capacity: number; // Agregado
  id_user: string; // FK de usuario
  id_admin: string; // FK de admin
  created_at: string; // Fecha de creación

  constructor(data: Ishelter) {
    this.id = data.id;
    this.name = data.name;
    this.address = data.address;
    this.phone = data.phone;
    this.email = data.email;
    this.accepted_health_condition = data.accepted_health_condition;
    this.pet_capacity = data.pet_capacity;
    this.id_user = data.id_user;
    this.id_admin = data.id_admin;
    this.created_at = data.created_at;
  }

  toFirestore(): Omit<Ishelter, 'id'> {
    return {
      name: this.name,
      address: this.address,
      phone: this.phone,
      email: this.email,
      accepted_health_condition: this.accepted_health_condition,
      pet_capacity: this.pet_capacity,
      id_user: this.id_user,
      id_admin: this.id_admin,
      created_at: this.created_at,
    };
  }
}

