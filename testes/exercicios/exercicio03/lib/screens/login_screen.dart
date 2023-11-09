import 'package:exercicio03/screens/list_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final senhaController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: const ValueKey('form_input_usuario'),
              controller: usuarioController,
              decoration: const InputDecoration(labelText: 'Usuário'),
              validator: (value) {
                if (value.toString().trim().isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey('form_input_senha'),
              controller: senhaController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              validator: (value) {
                if (value.toString().trim().isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (usuarioController.text.trim() == 'teste' && senhaController.text.trim() == '1234') {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ListScreen(),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                              'Usuário/Senha inválido',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.red),
                      );
                    }
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
