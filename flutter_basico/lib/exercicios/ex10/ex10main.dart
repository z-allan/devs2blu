import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Exercicio10());
}

class Exercicio10 extends StatelessWidget {
  const Exercicio10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const BookPage()},
    );
  }
}
