// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _login = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  late bool _passwordVisible = false;

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 75),
                      child: Image.asset('assets/ex06/login.png',
                          width: 150,
                          fit: BoxFit.cover,
                          excludeFromSemantics: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: _login,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Login não pode ser vazio';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Login',
                              border: OutlineInputBorder(),
                              constraints: BoxConstraints(maxWidth: 250))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          obscureText: !_passwordVisible,
                          controller: _senha,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Senha não pode ser vazio';
                            }
                            if (value.length < 6 || value.length > 12) {
                              return 'Senha deve ter 6 a 12 caracteres';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: _toggle,
                              ),
                              hintText: 'Senha',
                              border: const OutlineInputBorder(),
                              constraints:
                                  const BoxConstraints(maxWidth: 250))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Fazendo login de '${_login.text}'")),
                                  );
                                }
                              },
                              child: const Text('Login')),
                          const TextButton(
                              onPressed: null,
                              child: Text('Esqueci minha senha')),
                        ],
                      ),
                    ),
                    const TextButton(
                        onPressed: null,
                        child: Text('Ainda não tem uma conta? Clique aqui'))
                  ]),
            ),
          )),
    );
  }
}
