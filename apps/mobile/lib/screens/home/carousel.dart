// carousel.dart
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Map<String, dynamic>> pets = [
    {
      'name': 'Milo',
      'type': 'Macho',
      'age': '1,5 años',
      'location': 'Gral. Rodriguez (2.7 km)',
      'image': 'assets/images/milo.png',
    },
    {
      'name': 'Lola',
      'type': 'Hembra',
      'age': '6 meses',
      'location': 'Gral. Rodriguez (2.7 km)',
      'image': 'assets/images/lola.png',
    },
    {
      'name': 'Bella',
      'type': 'Hembra',
      'age': '3 años',
      'location': 'San Martin (5.2 km)',
      'image': 'assets/images/lola.png',
    },
    {
      'name': 'Choco',
      'type': 'Macho',
      'age': '2 años',
      'location': 'Merlo (8.1 km)',
      'image': 'assets/images/lola.png',
    },
    {
      'name': 'Luna',
      'type': 'Hembra',
      'age': '1 año',
      'location': 'Lujan (10.4 km)',
      'image': 'assets/images/lola.png',
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: pets.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final pet = pets[index];
              return PetCard(
                name: pet['name'],
                type: pet['type'],
                age: pet['age'],
                location: pet['location'],
                image: pet['image'],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pets.length,
            (index) => Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PetCard extends StatelessWidget {
  final String name;
  final String type;
  final String age;
  final String location;
  final String image;

  const PetCard({
    super.key,
    required this.name,
    required this.type,
    required this.age,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 200,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('Tipo: $type'),
                    const SizedBox(width: 16),
                    Text('Edad: $age'),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Ubicación: $location'),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
