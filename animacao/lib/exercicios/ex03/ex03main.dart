import 'package:animacao/exercicios/ex03/screen/news_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio02());
}

class Exercicio02 extends StatelessWidget {
  const Exercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
