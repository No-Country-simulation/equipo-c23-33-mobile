import 'package:flutter/material.dart';
import 'package:mobile/screens/register_screen.dart';
import 'package:mobile/services/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isChecked = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/loginLogo.png', height: 100),
                    const SizedBox(height: 10),
                    const Text(
                      'Pet Friends',
                      style: TextStyle(
                        fontFamily: 'Pally Variable',
                        fontSize: 24.13,
                        fontWeight: FontWeight.w700,
                        height: 32.57 / 24.13,
                        color: Color(0xFFF6335E),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Correo electrónico',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 16.57 / 16.13,
                  color: Color(0xff263238),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 328,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Contraseña',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 16.57 / 16.13,
                  color: Color(0xff263238),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 328,
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'Recordar contraseña',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff263238),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6335E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuthService.loginUser(
                    context,
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                child: const Text('Ingresar', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tenés una cuenta?',
                      style: TextStyle(fontSize: 16)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterForm()),
                      );
                    },
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        color: Color(0xFFF6335E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
