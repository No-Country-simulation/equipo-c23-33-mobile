// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mobile/screens/profileUser/profile_user.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 90.0, 
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
          const SizedBox(height: 5),
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
