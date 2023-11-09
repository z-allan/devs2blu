import 'package:dart_avancado/exercicios/ex05/widgets/list_inherited.dart';
import 'package:flutter/material.dart';
import 'package:dart_avancado/exercicios/ex05/screens/home_screen.dart';

void main() {
  runApp(Exercicio05());
}

class Exercicio05 extends StatelessWidget {
  const Exercicio05({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrencyListWidget(
        child: MaterialApp(
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: HomeScreen()));
  }
}
