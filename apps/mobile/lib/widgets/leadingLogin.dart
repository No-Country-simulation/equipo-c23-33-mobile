// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/onboarding/OnboardingStepOne.dart';
import 'dart:async';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingStepOne()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loginLogo.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'Pet Friends',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '¡Te damos la bienvenida!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
