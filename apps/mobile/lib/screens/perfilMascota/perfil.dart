import 'package:flutter/material.dart';
import 'package:mobile/screens/home/cards.dart';
import 'package:mobile/screens/perfilMascota/sherterProfile.dart';

class PetProfile extends StatefulWidget {
  final Map<String, String>? animal; // Puede ser null
  const PetProfile({super.key, required this.animal});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  late final Map<String, String>? animal; // Puede ser null

  @override
  void initState() {
    super.initState();
    animal = widget.animal; // Acceder a la propiedad del widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal?['name'] ?? 'Desconocido'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen y carrusel
            Center(
              child: SizedBox(
                height: 200,
                child: PageView(
                  children: List.generate(3, (index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        animal?['photo_url'] ?? '', // Cambia la ruta según las imágenes
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Datos básicos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoChip(label: 'Edad', value: animal?['age'] ?? 'Desconocido', color: Colors.purple),
                InfoChip(label: 'Sexo', value: animal?['sex'] ?? 'Desconocido', color: Colors.green),
                InfoChip(label: 'Peso', value: animal?['weight'] ?? 'Desconocido', color: Colors.orange),
              ],
            ),
            const SizedBox(height: 16.0),

            // Publicado por
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.pets, color: Colors.grey),
              ),
              title: const Text('Publicado por'),
              subtitle: Text(animal?['shelter'] ?? 'Desconocido'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShelterProfile(
                      shelterName: animal?['shelter'] ?? 'Desconocido',
                      followers: 4500,
                      posts: 15,
                      recentAnimals: [
                        AnimalCard(
                          name: animal?['name'] ?? 'Desconocido',
                          type: animal?['type'] ?? 'Desconocido',
                          breed: animal?['breed'] ?? 'Desconocido',
                          size: animal?['size'] ?? 'Desconocido',
                          age: animal?['age'] ?? 'Desconocido',
                          sex: animal?['sex'] ?? 'Desconocido',
                          shelter: animal?['shelter'] ?? 'Desconocido',
                          photoUrl: animal?['photo_url'] ?? '',
                          healthStatus: animal?['health_status'] ?? 'Desconocido',
                          status: animal?['status'] ?? 'Desconocido',
                          idShelter: animal?['id_shelter'] ?? 'Desconocido',
                          createdAt: animal?['created_at'] ?? 'Desconocido',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Divider(),

            // Conoce al animal
            SectionHeader(title: 'Conoce a ${animal?["name"] ?? "Desconocido"}'),
            Text(
              animal?['description'] ?? 'Descripción no disponible.',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            // Su historial médico
            const SectionHeader(title: 'Su historial médico'),
            Text(
              animal?['medical_history'] ?? 'No disponible.',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            // Su personalidad
            const SectionHeader(title: 'Su personalidad'),
            Text(
              animal?['personality'] ?? 'No disponible.',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.pink,
                    ),
                    child: const Text(
                      'Solicitar adopción',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Icon(Icons.phone),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const InfoChip({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
        const SizedBox(height: 4.0),
        Chip(
          label: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: color,
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}