import 'package:flutter/material.dart';
import 'package:projectmanagementflutter/pages/profile.dart';

import '../services/user_service.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  const Login({super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                final userService = UserService(); // Instantiate UserService
                userService.login(emailController.text, passwordController.text)
                    .then((user) {
                  // Navigate to profile page if login is successful
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Profile(user.id);
                      },
                    ),
                  );
                }).catchError((error) {
                  // Handle login error
                  print('Login failed: $error');
                });
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
