import 'package:flutter/material.dart';

class ConfirmDelete extends StatelessWidget {
  final String nome;

  const ConfirmDelete({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.question_mark,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Deseja realmente excluir\n o registro '$nome'?",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Sim', style: TextStyle(fontSize: 20)))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Não', style: TextStyle(fontSize: 20)))),
          ),
        ]),
      ),
    );
  }
}
