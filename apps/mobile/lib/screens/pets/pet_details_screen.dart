import 'package:flutter/material.dart';

class PetDetailsScreen extends StatelessWidget {
  final String petName;
  final String petType;
  final String petGender;
  final String petAge;
  final String petStatus;

  const PetDetailsScreen({
    super.key,
    required this.petName,
    required this.petType,
    required this.petGender,
    required this.petAge,
    required this.petStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la mascota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre de la mascota
            Text(
              petName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Tipo de solicitud (Adopción, etc.)
            Text(
              'Hace 2 días - $petType',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 16),

            // Información adicional
            _buildDetailRow('Género', petGender),
            _buildDetailRow('Edad', petAge),
            _buildDetailRow('Estado', petStatus),
          ],
        ),
      ),
    );
  }

  // Método para construir una fila de detalles
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
