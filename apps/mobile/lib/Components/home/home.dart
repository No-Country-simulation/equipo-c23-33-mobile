import 'package:flutter/material.dart';
import 'package:mobile/Components/home/appbar_home.dart';
import 'package:mobile/Components/home/welcome_card.dart';

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
      body: Center(
        child: WelcomeCard(),
      ),
    );
  }
}
