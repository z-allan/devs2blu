import 'package:exercicios_flutter_basico/exercicios/ex12/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio12());
}

class Exercicio12 extends StatelessWidget {
  const Exercicio12({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListNames(),
    );
  }
}
