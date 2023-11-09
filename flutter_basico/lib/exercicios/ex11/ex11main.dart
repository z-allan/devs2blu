import 'package:exercicios_flutter_basico/exercicios/ex11/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio11());
}

class Exercicio11 extends StatelessWidget {
  const Exercicio11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SignUp(),
        //'/signupok': (context) => SignUpConfirmation()
      },
    );
  }
}
