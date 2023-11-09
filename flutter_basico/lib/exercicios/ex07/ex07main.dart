import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Exercicio07());
}

class Exercicio07 extends StatelessWidget {
  const Exercicio07({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyEvents(), debugShowCheckedModeBanner: false);
  }
}
