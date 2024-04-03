import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/login'),
        child: const Icon(Icons.arrow_forward),
      ),
      body: const Center(child: Text('Home')),
    );
  }
}