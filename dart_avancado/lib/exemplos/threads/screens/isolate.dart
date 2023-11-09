import 'dart:isolate';

import 'package:dart_avancado/exemplos/threads/models/thread.dart';
import 'package:flutter/material.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  Isolate? vrI;
  Capability? vrCap;
  String statusAtual = '...';

  @override
  Widget build(BuildContext context) {
    final model = ThreadModel(
        valorInicial: 1,
        valorFinal: 100,
        incrementarEm: 1,
        sleepInMiliseconds: 250,
        description: 'Isolate 1');

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 35, child: CircularProgressIndicator()),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (vrI != null)
                    ? null
                    : () async {
                        vrI = await Isolate.spawn<ThreadModel>(
                            ThreadModel.contar, model);
                        setState(() {
                          statusAtual = 'Clicou em Iniciar';
                        });
                      },
                child: Text("Iniciar")),
            ElevatedButton(
                onPressed: (vrCap == null)
                    ? null
                    : () async {
                        vrI!.resume(vrCap!);
                        vrCap = null;
                        setState(() {
                          statusAtual = 'Clicou em Retornar';
                        });
                      },
                child: Text("Retornar")),
            ElevatedButton(
                onPressed: (vrCap != null || vrI == null)
                    ? null
                    : () async {
                        vrCap = vrI!.pause(vrI!.pauseCapability);
                        setState(() {
                          statusAtual = 'Clicou em Pausar';
                        });
                      },
                child: Text("Pausar")),
            ElevatedButton(
                onPressed: (vrI == null)
                    ? null
                    : () async {
                        vrI!.kill();
                        vrI = null;
                        vrCap = null;
                        setState(() {
                          statusAtual = 'Clicou em Finalizar';
                        });
                      },
                child: Text("Finalizar")),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          statusAtual,
          style: TextStyle(fontSize: 34),
        )
      ],
    );
  }
}
