import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/filter/filter.dart'; // Ajusta la ruta según tu estructura

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(249, 136, 72, 1),
            Color.fromRGBO(246, 51, 94, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Línea
          Positioned(
            right: 0,
            top: 0,
            width: 300,
            height: 200,
            child: Image.network(
              'https://i.ibb.co/PmBV8zY/Imagen3.png',
              fit: BoxFit.contain,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          // Imagen de mascotas
          Positioned(
            right: -5,
            top: 10,
            child: SizedBox(
              width: 240,
              height: 110,
              child: Image.network(
                'https://i.ibb.co/b5dK2fk/tarjeta111.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.pets,
                    size: 90,
                    color: Colors.white54,
                  );
                },
              ),
            ),
          ),

          // textos y barra de búsqueda
          Positioned(
            left: 16,
            top: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hola, Fulano',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(38, 50, 56, 1),
                  ),
                ),
                const Text(
                  'Lore ipsum',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(38, 50, 56, 1),
                  ),
                ),
                const SizedBox(height: 22),
                const SizedBox(height: 22),

                // Barra de búsqueda
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            // Lógica para navegar a la página de filtros
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FilterPage(category: ("Filtro")),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.tune, // Icono de filtro
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // circulos decorativos
          ..._buildSuns(),
        ],
      ),
    );
  }

  List<Widget> _buildSuns() {
    return [
      Positioned(
        right: 0,
        top: 20,
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(124, 183, 160, 1),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        right: 175,
        top: 20,
        child: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Color(0xFFFFD700),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        right: 350,
        top: 110,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Color.fromARGB(113, 240, 164, 217),
            shape: BoxShape.circle,
          ),
        ),
      ),
    ];
  }
}
