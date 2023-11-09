import 'package:exercicios_flutter_basico/exemplo/paineis/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exemplo());
}

class Exemplo extends StatelessWidget {
  const Exemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
