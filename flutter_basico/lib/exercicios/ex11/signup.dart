import 'package:exercicios_flutter_basico/exercicios/ex11/c_signup.dart';
import 'package:exercicios_flutter_basico/exercicios/ex11/e_string.dart';
import 'package:exercicios_flutter_basico/exercicios/ex11/signup_ok.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  void _signUp() {
    LoginModel login = LoginModel(nome: _name.text, email: _email.text);

    //1ª forma
    //Navigator.of(context).pushReplacementNamed('/signupok', arguments: login);

    //2ª forma
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => const SignUpConfirmation(),
    //     settings: RouteSettings(arguments: login)));

    //3ª forma
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   builder: (context) => SignUpConfirmation(infoLogin: login),
    // ));

    //2ª + 3ª forma
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SignUpConfirmation(infoLogin: login),
        settings: RouteSettings(arguments: login)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exercício 11'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 40),
                  width: 300,
                  child: const Text(
                      'Bem vindo a tela de cadastro de usuário.\nPreencha as informações abaixo para iniciar o cadastro'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome não pode ser vazio';
                    }
                    return null;
                  },
                  controller: _name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: 'Nome',
                      constraints: BoxConstraints(maxWidth: 300)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmptyOrNull()) {
                      return 'E-mail não pode ser vazio';
                    }
                    if (!value!.isValidEmail()) {
                      return 'Favor preencher com um e-mail válido';
                    }
                    return null;
                  },
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'E-mail',
                      constraints: BoxConstraints(maxWidth: 300)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
