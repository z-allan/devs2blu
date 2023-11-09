import 'package:dart_avancado/exemplos/threads/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyThreads());
}

class MyThreads extends StatelessWidget {
  const MyThreads({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
