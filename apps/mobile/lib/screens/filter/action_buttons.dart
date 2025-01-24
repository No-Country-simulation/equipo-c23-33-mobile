import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildClearButton(),
        _buildApplyButton(),
      ],
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.pink),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Lógica para limpiar filtros
      },
      child: const Text(
        "Limpiar",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  Widget _buildApplyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Lógica para aplicar filtros
      },
      child: const Text(
        "Aplicar filtros",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
