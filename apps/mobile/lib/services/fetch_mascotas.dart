// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:mobile/services/api.dart';

void fetchDataMascotas() async {
  final response = await ApiService.getRequest('/mascotas');
  if (response.statusCode == 200) {
    print(jsonDecode(response.body)); // Datos recibidos
  } else {
    print('Error: ${response.statusCode}');
  }
}

void sendDataMascota() async {
  final response = await ApiService.postRequest('/mascota', {
    'name': 'Bobby',
    'type': 'Perro',
    'breed': 'Salchicha',
    'size': 'Mediano',
    'age': '3',
    'sex': 'M',
    'shelter': '1',
    'photo_url': 'https://example.com/photo1.jpg',
    'health_status': 'Healthy',
    'status': 'Available',
    'id_shelter': '1',
    'created_at': '2025-01-15 10:00:00',
  });

  if (response.statusCode == 201) {
    print('Usuario creado: ${response.body}');
  } else {
    print('Error: ${response.statusCode}');
  }
}
