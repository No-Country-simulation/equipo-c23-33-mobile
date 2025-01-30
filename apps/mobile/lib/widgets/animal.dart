class Animal {
  String? id; // El ID es opcional
  String nombre;
  int edad;
  String especie;
  String tamano;
  String estadoSalud;
  String fotoURL;
  int idRefugio;

  // Constructor
  Animal({
    this.id,
    required this.nombre,
    required this.edad,
    required this.especie,
    required this.tamano,
    required this.estadoSalud,
    required this.fotoURL,
    required this.idRefugio,
  });

  // Método para crear un objeto Animal desde JSON
  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      nombre: json['nombre'],
      edad: json['edad'],
      especie: json['especie'],
      tamano: json['tamaño'],
      estadoSalud: json['estadoSalud'],
      fotoURL: json['fotoURL'],
      idRefugio: json['idRefugio'],
    );
  }

  // Método para convertir un objeto Animal a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
      'especie': especie,
      'tamano': tamano,
      'estadoSalud': estadoSalud,
      'fotoURL': fotoURL,
      'idRefugio': idRefugio,
    };
  }
}
