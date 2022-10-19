import 'package:flutter/material.dart';
import 'package:learning_bloc_pattern_flutter/client_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clients app - BLoC pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClientPage(),
    );
  }
}
