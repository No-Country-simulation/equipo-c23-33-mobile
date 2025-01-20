import 'package:flutter/material.dart';
import 'package:mobile/Components/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 1),
        useMaterial3: true,
      ),
      home: const Home(), // Llamamos al componente Home como pantalla inicial
    );
  }
}
