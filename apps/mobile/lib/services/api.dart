// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // GET request
  static Future<http.Response> getRequest(String endpoint) async {
    final Uri url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url, headers: headers);
  }

  // POST request
  static Future<http.Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    final Uri url = Uri.parse('$baseUrl$endpoint');
    return await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );
  }
}
