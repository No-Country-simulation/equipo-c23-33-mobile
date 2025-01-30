// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mobile/screens/home/cards.dart';

class ShelterProfile extends StatelessWidget {
  final String shelterName;
  final int followers;
  final int posts;
  final List<AnimalCard> recentAnimals;

  const ShelterProfile({
    super.key,
    required this.shelterName,
    required this.followers,
    required this.posts,
    required this.recentAnimals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.pets, size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    shelterName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _InfoStat(label: 'Seguidores', value: followers.toString()),
                      const SizedBox(width: 16.0),
                      _InfoStat(label: 'Publicaciones', value: posts.toString()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabButton(label: 'Publicaciones', isSelected: true, onTap: () {}),
                _TabButton(label: 'Perfil', isSelected: false, onTap: () {}),
              ],
            ),
            const SizedBox(height: 16.0),

            // Recent animals
            const Text(
              'Recientes',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: recentAnimals.length,
              itemBuilder: (context, index) {
                return recentAnimals[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoStat extends StatelessWidget {
  final String label;
  final String value;

  const _InfoStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSelected ? Colors.pink : Colors.grey[200],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

// class _AttributeChip extends StatelessWidget {
//   final String label;
//   final Color color;

//   const _AttributeChip({required this.label, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.white),
//       ),
//       backgroundColor: color,
//     );
//   }
// }