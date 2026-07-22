import 'dart:io' show Platform;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

class ApiClient {
  static String get baseUrl {
    const customUrl = String.fromEnvironment('API_URL', defaultValue: '');
    if (customUrl.isNotEmpty) {
      return customUrl;
    }

    if (kIsWeb) {
      return 'http://localhost:8000';
    }

    try {
      if (Platform.isAndroid) {
        return 'http://10.0.2.2:8000';
      } else {
        return 'http://localhost:8000'; // iOS simulator or desktop
      }
    } catch (e) {
      return 'http://localhost:8000';
    }
  }

  Future<Map<String, dynamic>> checkHealth() async {
    final response = await http.get(Uri.parse('$baseUrl/health'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load health status');
    }
  }
}
