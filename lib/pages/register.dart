import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/home'),
        child: const Icon(Icons.arrow_forward),
      ),
      body: const Center(child: Text('Home')),
    );
  }
}