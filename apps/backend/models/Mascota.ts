export interface Pets {
  id?: string;
  name: string;
  age: number;
  type: string;
  size: string;
  health_status: string;  // Estado de salud (Saludable, Enfermo, Recuperación)
  photo_url: string;
  id_shelter : string;
  breed: string;       // Indica si la mascota es una cría
  sex: string;         // sex de la mascota (Macho/Hembra)
  shelter: string;      // name del shelter
  created_at: Date;       // Fecha de creación de la mascota
  status : string;
}

export class pet {
  id?: string;
  name: string;
  age: number;
  type: string;
  size: string;
  health_status: string;  // Estado de salud (Saludable, Enfermo, Recuperación)
  photo_url: string;
  id_shelter : string;
  breed: string;       // Indica la breed
  sex: string;         // sex de la mascota (Macho/Hembra)
  shelter: string;      // name del shelter
  created_at: Date;       // Fecha de creación de la mascota
  status : string;

  constructor(data: Pets) {
    this.id = data.id;
    this.name = data.name;
    this.age = data.age;
    this.type = data.type;
    this.size = data.size;
    this.health_status = data.health_status;
    this.photo_url = data.photo_url;
    this.id_shelter  = data.id_shelter ;
    this.breed = data.breed;
    this.sex = data.sex;
    this.shelter = data.shelter;
    this.created_at = data.created_at;
    this.status = data.status;
  }

  toFirestore(): Omit<Pets, 'id'> {
    return {
      name: this.name,
      age: this.age,
      type: this.type,
      size: this.size,
      health_status: this.health_status,
      photo_url: this.photo_url,
      id_shelter : this.id_shelter ,
      breed: this.breed,
      sex: this.sex,
      shelter: this.shelter,
      created_at: this.created_at,
      status: this.status,
    };
  }
}
