import 'package:flutter/material.dart';
import 'screen/counter.dart';

void main() {
  runApp(const Exercicio13());
}

class Exercicio13 extends StatelessWidget {
  const Exercicio13({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
