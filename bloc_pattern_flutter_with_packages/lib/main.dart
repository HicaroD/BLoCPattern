import 'package:bloc_pattern_flutter_with_packages/client_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clientes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClientPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
