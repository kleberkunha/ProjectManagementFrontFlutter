import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

import '../pages/profile.dart';

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



  Future<void> register(BuildContext context, String email, String password) async {

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password.')),
      );
      return;
    }

    final Map<String, String> data = {'email': email, 'password': password};

    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final userId = responseData['id'];
      final user = await UserService().fetchUserData(userId);

      //Create redirection here
      if(context.mounted){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Profile(user),
          ),
        );
      }
    } else if (response.statusCode == 400) {
      // Unauthorized: email not found or invalid credentials
      // Show error message to the user
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email Already Exists, please re-check the information or recover the password !')),
      );
    } else {
      String errorMessage = jsonDecode(response.body)['message'] ?? 'An error occurred. Please try again later.';

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  Future<User> fetchUserData(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final user = User.fromJson(jsonData);
      return user;
    } else {
      // Handle specific error cases
      if (response.statusCode == 404) {
        throw Exception('User not found');
      } else if (response.statusCode == 500) {
        throw Exception('Internal server error occurred');
      } else {
        throw Exception(
            'Failed to fetch user data. Status code: ${response.statusCode}');
      }
    }
  }

}