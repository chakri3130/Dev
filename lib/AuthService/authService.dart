import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constants/constants.dart';

class ApiService {
  //Common post method without access token//

  Future<Map<String, dynamic>> fetchData(
      String endpoint, Map<String, String> map) async {
    final response = await http.get(Uri.parse('/$endpoint'));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    return {};
  }
}
