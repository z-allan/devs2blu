import 'package:exercicio02/models/pergunta_model.dart';
import 'package:exercicio02/screens/pergunta_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PerguntaModel pergunta = PerguntaModel(pergunta: 'Qual maior rio do mundo (em extensão)?', respostas: [
      {'opcao': 'Rio Amazonas', 'correta': true},
      {'opcao': 'Rio Nilo', 'correta': false},
      {'opcao': 'Rio Missisipi', 'correta': false},
      {'opcao': 'Rio Paraná', 'correta': false},
    ]);

    return Scaffold(
      appBar: AppBar(title: const Text('Show do milhão')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://t1.uc.ltmcdn.com/pt/posts/8/5/8/como_se_inscrever_para_o_show_do_milhao_27858_orig.jpg',
              cacheHeight: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerguntaScreen(perguntaModel: pergunta),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Ir para pergunta'),
                )),
          )
        ],
      ),
    );
  }
}
