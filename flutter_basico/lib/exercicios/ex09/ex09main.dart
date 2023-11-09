import 'package:flutter/material.dart';
import 'first.dart';

void main() {
  runApp(const Exercicio09());
}

class Exercicio09 extends StatelessWidget {
  const Exercicio09({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: FirstPage(), debugShowCheckedModeBanner: false);
  }
}
