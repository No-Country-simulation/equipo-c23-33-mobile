import 'package:flutter/material.dart';
import 'package:mobile/services/firebase_auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pet Friends',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Crear una cuenta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(_nameController, 'Nombre y apellido'),
            const SizedBox(height: 16),
            _buildTextField(_emailController, 'Correo electrónico'),
            const SizedBox(height: 16),
            _buildPasswordField(
                _passwordController, 'Contraseña', _obscurePassword, () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            }),
            const SizedBox(height: 16),
            _buildPasswordField(_repeatPasswordController, 'Repetir contraseña',
                _obscureRepeatPassword, () {
              setState(() {
                _obscureRepeatPassword = !_obscureRepeatPassword;
              });
            }),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _rememberPassword,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      _rememberPassword = value!;
                    });
                  },
                ),
                const Text(
                  'Recordar contraseña',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuthService.registerUser(
                    context,
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tenés una cuenta?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFF6335E),
                side: const BorderSide(color: Color(0xFFF6335E), width: 1),
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Entrar como invitado',
                style: TextStyle(
                    fontFamily: 'Pally Variable',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label,
      bool obscureText, VoidCallback toggle) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}
