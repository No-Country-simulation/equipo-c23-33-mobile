import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/widgets/leadingLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        useMaterial3: true,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(), // Ruta de login
        '/home': (context) => const Home(), // Ruta de home
      },
    );
  }
}
