import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar los botones
        children: [
          _buildCancelButton(context), // Pasamos el contexto aquí
          const SizedBox(width: 16), // Espacio entre los botones
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.pink),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 32, vertical: 14), // Aumentar el tamaño
      ),
      onPressed: () {
        // Navegar de regreso a la pantalla anterior (Home)
        Navigator.pop(context);
      },
      child: const Text(
        "Cancelar",
        style: TextStyle(color: Colors.pink, fontSize: 16),
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
        padding: const EdgeInsets.symmetric(
            horizontal: 32, vertical: 14), // Aumentar el tamaño
      ),
      onPressed: () {
        // Lógica para aplicar filtros
      },
      child: const Text(
        "Aplicar filtros",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
