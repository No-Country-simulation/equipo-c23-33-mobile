import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCancelButton(context),
          const SizedBox(width: 16),
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
            horizontal: 32, vertical: 14),
      ),
      onPressed: () {
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
            horizontal: 32, vertical: 14),
      ),
      onPressed: () {

      },
      child: const Text(
        "Aplicar filtros",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
