// home.dart
import 'package:flutter/material.dart';
import 'package:mobile/screens/home/appbar_home.dart';
import 'package:mobile/screens/home/carousel.dart';
import 'package:mobile/screens/home/welcome_card.dart';
import 'package:mobile/screens/home/categories_section.dart';
import 'package:mobile/screens/navBar/navBar.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeCard(),
            const CategoriesSection(),
            const SizedBox(height: 16),
            SizedBox(
              height: 314,
              child: const Carousel(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
        bottomNavigationBar: const NavBar(),
    );
  }
}
