import "package:exercicio03/screens/login_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const Exercicio03());
}

class Exercicio03 extends StatelessWidget {
  const Exercicio03({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
