import 'package:flutter/material.dart';

typedef ChangeCount = void Function(double newValue);

class PlusMinusButton extends StatelessWidget {
  final ChangeCount onChangeCount;
  final double countNumber;
  final double incrementBy;
  final double fontSize;

  const PlusMinusButton(
      {required this.countNumber,
      required this.onChangeCount,
      this.incrementBy = 1,
      this.fontSize = 36,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            iconSize: fontSize,
            onPressed: () =>
                this.onChangeCount(this.countNumber + this.incrementBy),
            icon: const Icon(
              Icons.add,
            )),
        IconButton(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            iconSize: fontSize,
            onPressed: () =>
                this.onChangeCount(this.countNumber - this.incrementBy),
            icon: const Icon(
              Icons.remove,
            )),
      ],
    );
  }
}
