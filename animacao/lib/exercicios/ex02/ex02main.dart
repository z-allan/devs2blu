import 'package:animacao/exercicios/ex02/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio02());
}

class Exercicio02 extends StatelessWidget {
  const Exercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
