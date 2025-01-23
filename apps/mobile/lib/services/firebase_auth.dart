import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/home/home.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showSnackBar(context, 'Usuario no encontrado. Intente registrarse.');
      } else if (e.code == 'wrong-password') {
        _showSnackBar(context, 'Contraseña incorrecta.');
      } else {
        _showSnackBar(context, 'Error: ${e.message}');
      }
    }
  }

  static Future<void> registerUser(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Por favor, complete todos los campos.');
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } on FirebaseAuthException catch (e) {
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
      _showSnackBar(context, errorMessage);
    }
  }

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
