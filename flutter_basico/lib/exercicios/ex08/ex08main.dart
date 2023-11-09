import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Exercicio08());
}

class Exercicio08 extends StatelessWidget {
  const Exercicio08({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyToDoList(), debugShowCheckedModeBanner: false);
  }
}
