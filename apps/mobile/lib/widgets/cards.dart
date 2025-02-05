import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final String name;
  final String type;
  final String breed;
  final String size;
  final String age;
  final String sex;
  final String shelter;
  final String photoUrl;
  final String healthStatus;
  final String status;
  final String idShelter;
  final String createdAt;

  const AnimalCard({
    required this.name,
    required this.type,
    required this.breed,
    required this.size,
    required this.age,
    required this.sex,
    required this.shelter,
    required this.photoUrl,
    required this.healthStatus,
    required this.status,
    required this.idShelter,
    required this.createdAt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              photoUrl,
              height: 93, 
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Chip(
                        label: Text(sex),
                        backgroundColor: sex == 'Macho'
                            ? Colors.blue.shade100
                            : Colors.pink.shade100,
                        labelStyle: const TextStyle(fontSize: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      ),
                      const SizedBox(width: 4),
                      Chip(
                        label: Text('${int.tryParse(age) ?? 0} ${int.tryParse(age) != null && int.tryParse(age)! > 1 ? 'años' : 'año'}'),
                        backgroundColor: Colors.green.shade100,
                        labelStyle: const TextStyle(fontSize: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '(idShelter - dirección)', // Debo acceder al id del refugio y con ese id buscar el campo de address
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
