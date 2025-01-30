// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mobile/screens/filter/filter.dart';
import 'package:mobile/screens/home/cards.dart';
import 'package:mobile/screens/perfilMascota/perfil.dart';
import 'animal_card.dart';
import 'perfil_mascota.dart';

class FilteredPage extends StatelessWidget {
  final String especie;
  final List<Map<String, String>> animals;

  const FilteredPage({
    super.key,
    required this.especie,
    required this.animals,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAnimals = especie == "all"
        ? animals
        : animals.where((animal) => animal['type'] == especie).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(especie),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterPage(especie: especie),
                  ),
                );
              },
              child: const Icon(
                Icons.tune,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: filteredAnimals.isEmpty
          ? const Center(
              child: Text('No se encontraron animales para esta categoría.'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredAnimals.length,
              itemBuilder: (context, index) {
                final animal = filteredAnimals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetProfile(animal: animal),
                      ),
                    );
                  },
                  child: AnimalCard(
                    name: animal['name'] ?? 'Desconocido',
                    type: animal['type'] ?? 'Desconocido',
                    breed: animal['breed'] ?? 'Desconocido',
                    size: animal['size'] ?? 'Desconocido',
                    age: animal['age'] ?? 'Desconocido',
                    sex: animal['sex'] ?? 'Desconocido',
                    shelter: animal['shelter'] ?? 'Desconocido',
                    photoUrl: animal['photo_url'] ?? 'Desconocido',
                    healthStatus: animal['health_status'] ?? 'Desconocido',
                    status: animal['status'] ?? 'Desconocido',
                    idShelter: animal['id_shelter'] ?? 'Desconocido',
                    createdAt: animal['created_at'] ?? 'Desconocido',
                  ),
                );
              },
            ),
    );
  }
}
