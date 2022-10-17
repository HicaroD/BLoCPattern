import 'package:flutter/material.dart';
import 'package:learning_bloc_pattern_flutter/client_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clientes",
        ),
      ),
      body: const ClientPage(),
    );
  }
}
