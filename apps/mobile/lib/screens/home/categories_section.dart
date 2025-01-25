import 'package:flutter/material.dart';
import 'package:mobile/screens/filters/filtered_page.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Categorías',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 2.2,
          children: [
            _buildCategoryCard(
              context,
              title: 'Gatos',
              color: const Color.fromRGBO(254, 156, 86, 1),
              image: 'assets/images/Gato1_categorias.png',
            ),
            _buildCategoryCard(
              context,
              title: 'Perros',
              color: const Color.fromRGBO(254, 201, 86, 1),
              image: 'assets/images/Perro1_categoria.png',
            ),
            _buildCategoryCard(
              context,
              title: 'Otros',
              color: const Color.fromRGBO(187, 140, 209, 1),
              image: 'assets/images/Otros1_categorias.png',
            ),
            _buildCategoryCard(
              context,
              title: 'Refugios',
              color: const Color.fromRGBO(82, 191, 113, 1),
              image: 'assets/images/Refugios1_categorias.png',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required Color color,
    required String image,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FilteredPage(category: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(153), // alpha = opacidad * 255 -> 0.6 * 255 =  153
              blurRadius: 8, // Difuminado
              offset: const Offset(0, 4), // Sombra desplazada hacia abajo
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen rectangular al lado del texto
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Texto de la categoría
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
