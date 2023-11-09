import 'package:exercicios_flutter_basico/exercicios/ex04/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio04());
}

class Exercicio04 extends StatelessWidget {
  const Exercicio04({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
