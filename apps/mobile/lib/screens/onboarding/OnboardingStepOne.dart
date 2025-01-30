// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/onboarding/OnboardingStepTwo.dart';

class OnboardingStepOne extends StatelessWidget {
  const OnboardingStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Indicador de progreso
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Imagen
                  Image.asset(
                    'assets/images/onboardingStepOne.png',
                    height: 250,
                  ),
                  SizedBox(height: 20),

                  // Texto
                  Text(
                    'Lorem ipsum',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Botón siguiente
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Navegar al siguiente paso del onboarding
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingStepTwo(),
                        ),
                      );
                    },
                    child: Text(
                      'Siguiente',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Botón omitir
                  TextButton(
                    onPressed: () {
                      // Omitir onboarding
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Omitir',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
