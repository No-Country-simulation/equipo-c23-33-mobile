import 'package:flutter/material.dart';
import 'package:mobile/services/firebase_auth.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Mueve los controladores dentro del método build para que sean accesibles.
    final TextEditingController emailUserController = TextEditingController();
    final TextEditingController passwordUserController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailUserController, // Retira el `const` ya que tiene un controlador.
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordUserController, // Retira el `const` ya que tiene un controlador.
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuthService.registerUser(
                  context,
                  emailUserController.text.trim(),
                  passwordUserController.text.trim(),
                );
              },
              child: const Text('Registrar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
