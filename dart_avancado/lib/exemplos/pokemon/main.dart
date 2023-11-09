import 'package:dart_avancado/exemplos/pokemon/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
