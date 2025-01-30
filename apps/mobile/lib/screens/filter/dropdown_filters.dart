import 'package:flutter/material.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDropdownFilter(
      "Ubicación",
      ["Ubicación 1", "Ubicación 2"],
    );
  }
}

class BreedFilter extends StatelessWidget {
  const BreedFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDropdownFilter(
      "breed",
      ["breed 1", "breed 2"],
    );
  }
}

Widget _buildDropdownFilter(
  String label,
  List<String> options,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        items: options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: (_) {},
        hint: Text("Seleccionar ${label.toLowerCase()}"),
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    ],
  );
}
