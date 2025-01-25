import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFilterSection(
      "Categoría",
      [
        _buildFilterButton("Gato"),
        _buildFilterButton("Perro", isSelected: true),
        _buildFilterButton("Otros"),
        _buildFilterButton("Refugio"),
      ],
    );
  }
}

class GenderFilter extends StatelessWidget {
  const GenderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFilterSection(
      "Sexo",
      [
        _buildFilterButton("Hembra", isSelected: true),
        _buildFilterButton("Macho"),
        _buildFilterButton("Ambos"),
      ],
    );
  }
}

class SizeFilter extends StatelessWidget {
  const SizeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFilterSection(
      "Tamaño",
      [
        _buildFilterButton("Pequeño"),
        _buildFilterButton("Mediano", isSelected: true),
        _buildFilterButton("Grande"),
      ],
    );
  }
}

class AgeFilter extends StatelessWidget {
  const AgeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFilterSection(
      "Edad",
      [
        _buildFilterButton("0-3", isSelected: true),
        _buildFilterButton("3-5"),
        _buildFilterButton("+5"),
      ],
    );
  }
}

Widget _buildFilterSection(String title, List<Widget> buttons) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttons,
      ),
    ],
  );
}

Widget _buildFilterButton(String text, {bool isSelected = false}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.pink : Colors.white,
      side: BorderSide(color: Colors.grey.shade300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    ),
  );
}
