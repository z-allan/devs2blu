import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  final bool backButton;

  const Exercicio01({this.backButton = false, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Exercício 1'),
              leading: backButton
                  ? BackButton(
                      onPressed: () => Navigator.pop(context),
                    )
                  : null,
            ),
            body: const Center(
                child: Text('Flutter é legal :)',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)))),
        debugShowCheckedModeBanner: false);
  }
}
