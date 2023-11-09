// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RippleContainer extends StatelessWidget {
  final double size;
  final double opacity;
  final Color color;

  const RippleContainer(
      {required this.size,
      required this.opacity,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: this.opacity,
      child: Container(
        height: this.size,
        width: this.size,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(this.size / 2)),
      ),
    );
  }
}
