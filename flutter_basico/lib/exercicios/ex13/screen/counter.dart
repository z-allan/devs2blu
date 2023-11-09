import 'package:exercicios_flutter_basico/exercicios/ex13/widget/counter_text.dart';
import 'package:exercicios_flutter_basico/exercicios/ex13/widget/plusminus_button.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  double count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 13'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CounterColoredText(
          count: this.count,
          fontSize: 64,
        ),
        const Divider(),
        PlusMinusButton(
            countNumber: this.count,
            fontSize: 36,
            onChangeCount: (newValue) {
              setState(() => this.count = newValue);
            }),
        const Divider()
      ])),
    );
  }
}
