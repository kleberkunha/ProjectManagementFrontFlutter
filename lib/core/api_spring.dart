import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';


class ApiSpring {
  static const String baseUrl = "http://localhost:9090";

  Future<String> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode(userData),
      headers: {'Content-type': 'application/json'},
    );
    return response.body;
  }

  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return User.fromJson(responseData['user']);
    } else {
      throw Exception('Failed to login. Status code: ${response.statusCode}');
    }
  }



/*
  Future<Response> login() async {
    //IMPLEMENT USER LOGIN
  }

  Future<Response> getUserProfileData() async {
    //GET USER PROFILE DATA
  }

  Future<Response> logout() async {
    //IMPLEMENT USER LOGOUT
  }*/
}