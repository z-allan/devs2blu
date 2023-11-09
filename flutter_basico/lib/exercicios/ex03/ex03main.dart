import 'package:exercicios_flutter_basico/exercicios/ex03/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio03());
}

class Exercicio03 extends StatelessWidget {
  final bool callFromIndex;

  const Exercicio03({this.callFromIndex = false, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Exercício 3')),
      body: const MyCounter(),
    ));
  }
}
