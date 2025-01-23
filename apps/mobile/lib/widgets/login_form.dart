import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/Components/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _loginUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      // Intentar iniciar sesión
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Chequear si el widget sigue montado antes de navegar
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Si el usuario no existe, intentar registrarlo
        try {
          await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Chequear si el widget sigue montado antes de navegar
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }
        } on FirebaseAuthException catch (e) {
          if (mounted) {
            // Mostrar mensaje de error si ocurre un problema al registrar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error al registrar: ${e.message}')),
            );
          }
        }
      } else if (e.code == 'wrong-password') {
        if (mounted) {
          // Mostrar mensaje de error para contraseña incorrecta
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contraseña incorrecta')),
          );
        }
      } else {
        if (mounted) {
          // Otros errores
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.message}')),
          );
        }
      }
    }
  }

  // Crear una funcion para crear un usuario en firebase

  Future<void> _registerUser() async {
    // Escribir el codigo para registrar un nuevo usuario y poder acceder a la plataforma
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos')),
      );
      return;
    }

    try {
      // Crear un nuevo usuario
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si el registro es exitoso, navega al Home
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Manejo de errores comunes de Firebase
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'La contraseña es demasiado débil.';
          break;
        case 'email-already-in-use':
          errorMessage = 'El correo electrónico ya está registrado.';
          break;
        case 'invalid-email':
          errorMessage = 'El correo electrónico no es válido.';
          break;
        default:
          errorMessage = 'Ocurrió un error. Intente nuevamente.';
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      // Para otros errores inesperados
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error desconocido. Intente nuevamente.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loginUser,
              child: const Text('Ingresar'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text('Registrar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
