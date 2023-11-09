import 'package:animacao/exercicios/exExtra/screen/paint_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExercicioExtra());
}

class ExercicioExtra extends StatelessWidget {
  const ExercicioExtra({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaintScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
