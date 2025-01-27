import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildIconButton('assets/icons/Home.png', 0),
            _buildIconButton('assets/icons/Chats.png', 1),
            _buildIconButton('assets/icons/Mascotas.png', 2),
            _buildIconButton('assets/icons/Perfil.png', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath, int index) {
    return IconButton(
      icon: Image.asset(
        assetPath,
        color: _selectedIndex == index
            ? Colors.red
            : const Color.fromRGBO(155, 149, 149, 1),
        width: 88, // Ancho del ícono
      ),
      iconSize: 40,
      onPressed: () => _onItemTapped(index),
    );
  }
}
