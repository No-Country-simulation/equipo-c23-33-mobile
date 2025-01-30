// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mobile/screens/home/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la página correspondiente
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MascotasPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PerfilPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 90.0, // Aumentamos la altura para incluir el texto
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildIconWithText(Icons.home, "Home", 0),
            _buildIconWithText(Icons.chat_bubble_outline, "Chats", 1),
            _buildIconWithText(Icons.pets, "Mascotas", 2),
            _buildIconWithText(Icons.person_outline, "Perfil", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? Colors.red
                : const Color.fromRGBO(155, 149, 149, 1),
            size: 30,
          ),
          const SizedBox(height: 5), // Espacio entre el ícono y el texto
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index
                  ? Colors.red
                  : const Color.fromRGBO(155, 149, 149, 1),
            ),
          ),
        ],
      ),
    );
  }
}

// Aquí van las pantallas correspondientes
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Página de Inicio")),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: const Center(child: Text("Página de Chats")),
    );
  }
}

class MascotasPage extends StatelessWidget {
  const MascotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mascotas")),
      body: const Center(child: Text("Página de Mascotas")),
    );
  }
}

// class PerfilPage extends StatelessWidget {
//   const PerfilPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Perfil")),
//       body: const Center(child: Text("Página de Perfil")),
//     );
//   }
// }
