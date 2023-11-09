import 'package:dart_avancado/exemplos/threads/models/thread.dart';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  String valorAtual = '';
  double valorAtualEmDouble = 0;
  bool isAtivo = false;

  @override
  Widget build(BuildContext context) {
    final model = ThreadModel(
        valorInicial: 1,
        valorFinal: 101,
        incrementarEm: 1,
        sleepInMiliseconds: 250,
        description: 'Stream 1');

    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  if (!isAtivo) {
                    model.contarStream();
                    isAtivo = true;
                  }
                },
                child: Text("Iniciar")),
            SizedBox(
              height: 50,
            ),
            StreamBuilder(
              stream: model.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );

                if (!snapshot.hasData)
                  return SizedBox(
                      height: 40, child: CircularProgressIndicator());

                if (snapshot.data == model.valorFinal - 1) {
                  isAtivo = false;
                  return SizedBox(
                      height: 40, child: CircularProgressIndicator());
                }

                return Container(
                  width: 250,
                  height: 40,
                  child: LinearProgressIndicator(
                    value: (snapshot.data! / model.valorFinal),
                  ),
                );
              },
            )
          ]),
    );
  }
}
