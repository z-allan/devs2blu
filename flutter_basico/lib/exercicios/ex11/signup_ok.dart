import 'package:exercicios_flutter_basico/exercicios/ex11/c_signup.dart';
import 'package:flutter/material.dart';

class SignUpConfirmation extends StatelessWidget {
  final LoginModel infoLogin;

  const SignUpConfirmation({required this.infoLogin, super.key});

  @override
  Widget build(BuildContext context) {
    final LoginModel args =
        ModalRoute.of(context)!.settings.arguments as LoginModel;

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 300,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 75)),
          Container(
              width: 300,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                  "Muito obrigado por se cadastrar em nosso sistema, ${args.nome}.",
                  style: const TextStyle(fontSize: 16))),
          Container(
              width: 300,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                  "Um e-mail de confirmação de cadastro foi enviado para o e-mail ${infoLogin.email}.",
                  style: const TextStyle(fontSize: 16)))
        ]),
      ),
      bottomNavigationBar: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 160, 166, 168),
              )),
        ],
      ),
    );
  }
}
