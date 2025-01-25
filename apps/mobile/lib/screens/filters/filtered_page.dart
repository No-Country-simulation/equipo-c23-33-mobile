import 'package:flutter/material.dart';

class FilteredPage extends StatelessWidget {
  final String category; // Recibe la categoría seleccionada

  const FilteredPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Categoría: $category'), // Título dinámico según la categoría
      ),
      body: Center(
        child: Text(
          'Mostrando contenido para $category',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
