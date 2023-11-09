import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio02());
}

class Exercicio02 extends StatelessWidget {
  final bool callFromIndex;

  const Exercicio02({this.callFromIndex = false, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Exercício 2')),
            body: const Column(children: [
              Text('Texto 1'),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text('Texto 2')),
              Text('Texto 3')
            ])));
  }
}
