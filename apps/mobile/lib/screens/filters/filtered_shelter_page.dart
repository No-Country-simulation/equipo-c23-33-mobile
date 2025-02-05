// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mobile/screens/filter/filter.dart';
import 'package:mobile/widgets/cardShelter.dart';
import 'package:mobile/widgets/cards.dart';
import 'package:mobile/screens/perfilMascota/perfil.dart';

class FilteredPageShelter extends StatelessWidget {
  
  final String type;
  final List<Map<String, String>> objets;

  const FilteredPageShelter({
    super.key,
    required this.type,
    required this.objets
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refugios"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FilterPageShelter(type: type),
                //   ),
                // );
              },
              child: const Icon(
                Icons.tune,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: objets.isEmpty
          ? const Center(
              child: Text('No se encontraron animales para esta categoría.'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: objets.length,
              itemBuilder: (context, index) {
                final shelter = objets[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ShelterProfile(shelter: shelter),
                    //   ),
                    // );
                  },
                  child: ShelterCard(
                    address: shelter['address'] ?? 'Desconocido',
                    createdAt: shelter['created_at'] ?? 'Desconocido',
                    email: shelter['email'] ?? 'Desconocido',
                    followers: shelter['followers'] ?? 'Desconocido',
                    idAdmin: shelter['id_admin'] ?? 'Desconocido',
                    idUser: shelter['id_user'] ?? 'Desconocido',
                    name: shelter['name'] ?? 'Desconocido',
                    photoUrl: shelter['photo_Url'] ?? 'Desconocido',
                    petCapacity: shelter['pet_capacity'] ?? 'Desconocido',
                    phone: shelter['phone'] ?? 'Desconocido',
                    publications: shelter['publications'] ?? 'Desconocido',
                  ),
                );
              },
            ),
    );
  }
}
