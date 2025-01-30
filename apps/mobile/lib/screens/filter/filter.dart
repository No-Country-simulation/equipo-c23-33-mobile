import 'package:flutter/material.dart';
import 'dropdown_filters.dart';
import 'action_buttons.dart';

class FilterPage extends StatefulWidget {
  final String category;

  const FilterPage({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String _selectedCategory = "Perro";
  String _selectedGender = "Hembra";
  String _selectedSize = "Mediano";
  String _selectedAge = "0-3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtros: ${widget.category}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSection(
              "Categoría",
              [
                _buildFilterButton("Gato", _selectedCategory == "Gato"),
                _buildFilterButton("Perro", _selectedCategory == "Perro"),
                _buildFilterButton("Otros", _selectedCategory == "Otros"),
                _buildFilterButton("shelter", _selectedCategory == "shelter"),
              ],
              (value) => setState(() => _selectedCategory = value),
            ),
            const SizedBox(height: 16),
            const LocationFilter(),
            const SizedBox(height: 16),
            const BreedFilter(),
            const SizedBox(height: 16),
            _buildFilterSection(
              "sex",
              [
                _buildFilterButton("Hembra", _selectedGender == "Hembra"),
                _buildFilterButton("Macho", _selectedGender == "Macho"),
                _buildFilterButton("Ambos", _selectedGender == "Ambos"),
              ],
              (value) => setState(() => _selectedGender = value),
            ),
            const SizedBox(height: 16),
            _buildFilterSection(
              "size",
              [
                _buildFilterButton("Pequeño", _selectedSize == "Pequeño"),
                _buildFilterButton("Mediano", _selectedSize == "Mediano"),
                _buildFilterButton("Grande", _selectedSize == "Grande"),
              ],
              (value) => setState(() => _selectedSize = value),
            ),
            const SizedBox(height: 16),
            _buildFilterSection(
              "age",
              [
                _buildFilterButton("0-3", _selectedAge == "0-3"),
                _buildFilterButton("3-5", _selectedAge == "3-5"),
                _buildFilterButton("+5", _selectedAge == "+5"),
              ],
              (value) => setState(() => _selectedAge = value),
            ),
            const SizedBox(height: 16),
            const ActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(
    String title,
    List<Widget> buttons,
    void Function(String) onPressed,
  ) {
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
          children: buttons.map((button) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: button,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(90, 40), // Ajusta el size de los botones
        backgroundColor: isSelected ? Colors.pink : Colors.white,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => _handleFilterButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14, // Ajuste del size de la fuente
        ),
      ),
    );
  }

  void _handleFilterButtonPressed(String value) {
    setState(() {
      if (value == "Gato") {
        _selectedCategory = "Gato";
      } else if (value == "Perro") {
        _selectedCategory = "Perro";
      } else if (value == "Otros") {
        _selectedCategory = "Otros";
      } else if (value == "shelter") {
        _selectedCategory = "shelter";
      } else if (value == "Hembra") {
        _selectedGender = "Hembra";
      } else if (value == "Macho") {
        _selectedGender = "Macho";
      } else if (value == "Ambos") {
        _selectedGender = "Ambos";
      } else if (value == "Pequeño") {
        _selectedSize = "Pequeño";
      } else if (value == "Mediano") {
        _selectedSize = "Mediano";
      } else if (value == "Grande") {
        _selectedSize = "Grande";
      } else if (value == "0-3") {
        _selectedAge = "0-3";
      } else if (value == "3-5") {
        _selectedAge = "3-5";
      } else if (value == "+5") {
        _selectedAge = "+5";
      }
    });
  }
}
