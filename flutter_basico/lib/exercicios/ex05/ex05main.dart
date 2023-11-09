import 'package:exercicios_flutter_basico/exercicios/ex05/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio05());
}

class Exercicio05 extends StatelessWidget {
  const Exercicio05({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyChristmas(),
      debugShowCheckedModeBanner: false,
    );
  }
}
