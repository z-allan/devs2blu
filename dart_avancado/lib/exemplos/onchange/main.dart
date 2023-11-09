import 'package:dart_avancado/exemplos/onchange/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(OnChangeExercicio());
}

class OnChangeExercicio extends StatelessWidget {
  const OnChangeExercicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
