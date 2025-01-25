import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // Sin sombra
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          // Acción del menú
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: Colors.grey),
          SizedBox(width: 5),
          Text(
            'Buenos Aires, ARG',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.red),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // Acción del icono de notificaciones
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
