import 'package:flutter/material.dart';
import 'package:mobile/Components/home/appbar_home.dart';
import 'package:mobile/Components/home/welcome_card.dart';
import 'package:mobile/Components/home/categories_section.dart'; // Importa la nueva sección de categorías

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        // Usamos SingleChildScrollView para permitir desplazamiento
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeCard(), // Tarjeta de bienvenida existente
            const SizedBox(height: 5), // Espaciado entre secciones
            CategoriesSection(), // Nueva sección de categorías
          ],
        ),
      ),
    );
  }
}
