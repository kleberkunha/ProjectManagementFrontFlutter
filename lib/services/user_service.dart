import 'dart:convert';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService{
  static const String baseUrl = "http://localhost:9090";


  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final userData = responseData['user']; // Get user data from response
      if (userData != null) {
        return User.fromJson(userData);
      } else {
        throw Exception('User data is null in the response');
      }
    } else {
      throw Exception('Failed to login. Status code: ${response.statusCode}');
    }
  }

}