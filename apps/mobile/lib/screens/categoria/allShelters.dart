// ignore_for_file: file_names, unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:mobile/screens/filters/filtered_shelter_page.dart';
import 'package:mobile/services/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllShelters extends StatelessWidget {
  const AllShelters({super.key});

  //Fetch a la api local "localhost:3000/shelters"

  Future<List<Map<String, String>>> fetchShelters() async {
    try {
      final response = await ApiService.getRequest('/shelters');

      if (response is http.Response) {
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          return data.map<Map<String, String>>((e) {
            return e.map<String, String>((key, value) => MapEntry(
                  key.toString(),
                  value?.toString() ?? '', // Evitamos valores null
                ));
          }).toList();
        } else {
          throw Exception('Error al obtener datos: ${response.statusCode}');
        }
      } else {
        throw Exception('La respuesta no es del tipo esperado');
      }
    } catch (e) {
      throw Exception('Error en la API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchShelters(), // Llamamos a la función que llama a la api
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          final shelters = snapshot.data ?? [];
          final objets = "shelters";
          return Scaffold(
            body: FilteredPageShelter(
              type: objets,
              objets: shelters,
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text('No data available')),
        );
      },
    );
  }
}
