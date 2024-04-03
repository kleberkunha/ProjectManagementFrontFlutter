import 'package:flutter/material.dart';
import 'package:projectmanagementflutter/services/user_service.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  const RegistrationPage({super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    final UserService userService = UserService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
              onPressed: () => userService.register(context, emailController.text, passwordController.text),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
