import 'package:exercicios_flutter_basico/exercicios/ex14/screen/product_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio14());
}

class Exercicio14 extends StatelessWidget {
  const Exercicio14({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
