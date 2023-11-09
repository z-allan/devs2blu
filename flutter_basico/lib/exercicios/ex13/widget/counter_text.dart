import 'package:flutter/material.dart';

class CounterColoredText extends StatelessWidget {
  final double count;
  final double fontSize;
  final int decimal;
  final Color positiveColor;
  final Color negativeColor;

  const CounterColoredText(
      {required this.count,
      this.fontSize = 48,
      this.decimal = 0,
      this.positiveColor = Colors.green,
      this.negativeColor = Colors.redAccent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        this.count.toStringAsFixed(decimal),
        style: TextStyle(
            color: this.count >= 0 ? this.positiveColor : this.negativeColor,
            fontSize: this.fontSize),
      ),
    );
  }
}
