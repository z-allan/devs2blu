// ignore_for_file: must_be_immutable

import 'package:dart_avancado/exemplos/threads/models/thread.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeTile extends StatefulWidget {
  final ThreadModel threadModel;

  ComputeTile({required this.threadModel, super.key});

  @override
  State<ComputeTile> createState() => _ComputeTileState();
}

class _ComputeTileState extends State<ComputeTile> {
  bool isRunning = false;
  String resultado = '00:00.000';
  List<String> listaResultados = [];

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.threadModel.description,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start: ${widget.threadModel.valorInicial.toStringAsFixed(0)} | End: ${widget.threadModel.valorFinal.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Add: ${widget.threadModel.incrementarEm} | Sleep: ${widget.threadModel.sleepInMiliseconds}ms',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        isThreeLine: true,
        leading: TextButton(
          onPressed: (isRunning) ? null : _iniciarThread,
          child: _icone(),
        ),
        trailing: (listaResultados.length > 1)
            ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(listaResultados[listaResultados.length - 1],
                    style: TextStyle(fontSize: 20)),
                Text(listaResultados[listaResultados.length - 2],
                    style: TextStyle(fontSize: 14))
              ])
            : Text(resultado, style: TextStyle(fontSize: 20)));
  }

  Widget _icone() {
    if (isRunning) {
      return Container(
          width: 30, height: 30, child: CircularProgressIndicator());
    } else {
      return Icon(
        Icons.play_arrow,
        size: 40,
      );
    }
  }

  void _iniciarThread() async {
    if (!isRunning) {
      isRunning = !isRunning;
      setState(() {});
      resultado = await compute<ThreadModel, String>(
          ThreadModel.contar,
          ThreadModel(
              valorInicial: widget.threadModel.valorInicial,
              valorFinal: widget.threadModel.valorFinal,
              incrementarEm: widget.threadModel.incrementarEm,
              sleepInMiliseconds: widget.threadModel.sleepInMiliseconds,
              description: widget.threadModel.description));
      isRunning = !isRunning;
      listaResultados.add(resultado);
      setState(() {});
    }
  }
}
