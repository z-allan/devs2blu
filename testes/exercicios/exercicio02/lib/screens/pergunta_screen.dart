import 'package:exercicio02/models/pergunta_model.dart';
import 'package:flutter/material.dart';

class PerguntaScreen extends StatefulWidget {
  final PerguntaModel perguntaModel;

  const PerguntaScreen({required this.perguntaModel, super.key});

  @override
  State<PerguntaScreen> createState() => _PerguntaScreenState();
}

class _PerguntaScreenState extends State<PerguntaScreen> {
  bool isSelecionado = false;
  bool isOpcaoCerta = false;

  Widget _msgRetorno() {
    Icon icone = const Icon(Icons.question_mark_sharp);
    String texto = 'Responda a pergunta';
    Color cor = Colors.grey;

    if (isSelecionado) {
      if (isOpcaoCerta) {
        icone = const Icon(Icons.check_circle_outline_rounded);
        texto = 'Certo';
        cor = Colors.green;
      } else {
        icone = const Icon(Icons.error_outline_rounded);
        texto = 'Errado';
        cor = Colors.red;
      }
    }

    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: cor),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          icone,
          Text(
            texto,
            style: const TextStyle(fontSize: 16),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pergunta')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(flex: 3, child: _msgRetorno()),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(child: Text(widget.perguntaModel.pergunta, style: const TextStyle(fontSize: 24))),
              )),
          Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: widget.perguntaModel.respostas.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: isSelecionado
                        ? null
                        : () {
                            isSelecionado = true;
                            isOpcaoCerta = widget.perguntaModel.respostas[index]['correta'];
                            setState(() {});
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        widget.perguntaModel.respostas[index]['opcao'],
                        style: isSelecionado
                            ? TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: widget.perguntaModel.respostas[index]['correta'] ? Colors.green : Colors.red)
                            : const TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
