// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:mobile/screens/filters/filtered_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/screens/filters/filtered_shelter_page.dart';
import 'package:mobile/services/api.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  List<Map<String, dynamic>> animals = [];
  List<Map<String, dynamic>> shelters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAnimals();
    fetchShelters();
  }

  Future<void> fetchShelters() async {
    try {
      final response = await ApiService.getRequest('/shelters');
      if (response.statusCode == 200) {
        setState(() {
          shelters = List<Map<String, dynamic>>.from(jsonDecode(response.body));
          isLoading = false;
        });
        // print('Datos de animals: $animals');
      } else {
        throw Exception('Error al obtener los datos');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchAnimals() async {
    try {
      final response = await ApiService.getRequest('/pets');
      if (response.statusCode == 200) {
        setState(() {
          animals = List<Map<String, dynamic>>.from(jsonDecode(response.body));
          isLoading = false;
        });
        // print('Datos de animals: $animals');
      } else {
        throw Exception('Error al obtener los datos');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    List<Map<String, String>> animalsString = animals.map((animal) {
      return Map<String, String>.from(animal.map((key, value) {
        return MapEntry(key, value.toString());
      }));
    }).toList();

    List<Map<String, String>> sheltersString = shelters.map((shelter) {
      return Map<String, String>.from(shelter.map((key, value) {
        return MapEntry(key, value.toString());
      }));
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Categorías',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 2.2,
          children: [
            _buildCategoryCard(context,
                title: 'Gato',
                color: const Color.fromRGBO(254, 156, 86, 1),
                image: 'assets/images/Gato1_categorias.png',
                objets: animalsString),
            _buildCategoryCard(context,
                title: 'Perro',
                color: const Color.fromRGBO(254, 201, 86, 1),
                image: 'assets/images/Perro1_categoria.png',
                objets: animalsString),
            _buildCategoryCard(context,
                title: 'Otros',
                color: const Color.fromRGBO(187, 140, 209, 1),
                image: 'assets/images/Otros1_categorias.png',
                objets: animalsString),
            _buildCategoryCard(context,
                title: 'Refugios',
                color: const Color.fromRGBO(82, 191, 113, 1),
                image: 'assets/images/Refugios1_categorias.png',
                objets: sheltersString),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context,
      {required String title,
      required Color color,
      required String image,
      required List<Map<String, String>> objets}) {
    return GestureDetector(
      onTap: () {
        if (objets.isNotEmpty) {
          List<Map<String, String>> filteredAnimals = [];

          if (title == 'Otros') {
            // Filtrar los animales para excluir "gato" y "perro"
            filteredAnimals = objets.where((animal) {
              String type = animal['type'] ?? ''; // Obtener el tipo
              return type != 'Gato' &&
                  type != 'Perro'; // Excluir gatos y perros
            }).toList();
          } else {
            filteredAnimals = objets; // Mostrar todos los animales
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return title == 'Refugios'
                    ? FilteredPageShelter(
                        type: title,
                        objets: objets) // Pasar la lista filtrada
                    : FilteredPage(
                        type: title,
                        animals: filteredAnimals); // Pasar la lista filtrada
              },
            ),
          );
        } else {
          // Mostrar un mensaje de error o algo si no hay datos
          print('No hay datos disponibles ($objets)');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(153),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
