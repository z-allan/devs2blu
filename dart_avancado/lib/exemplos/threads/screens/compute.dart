import 'package:dart_avancado/exemplos/threads/models/thread.dart';
import 'package:dart_avancado/exemplos/threads/widgets/compute_tile.dart';
import 'package:flutter/material.dart';

class ComputeScreen extends StatelessWidget {
  const ComputeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ThreadModel> listaTile = [
      ThreadModel(
          valorInicial: 0,
          valorFinal: 10,
          incrementarEm: 0.25,
          sleepInMiliseconds: 750,
          description: 'Compute 1'),
      ThreadModel(
          valorInicial: 0,
          valorFinal: 10,
          incrementarEm: 1,
          sleepInMiliseconds: 1500,
          description: 'Compute 2'),
      ThreadModel(
          valorInicial: 0,
          valorFinal: 1,
          incrementarEm: 0.1,
          sleepInMiliseconds: 1000,
          description: 'Compute 3'),
      ThreadModel(
          valorInicial: 0,
          valorFinal: 10,
          incrementarEm: 0.1,
          sleepInMiliseconds: 500,
          description: 'Compute 4'),
    ];

    return ListView.builder(
      itemCount: listaTile.length,
      itemBuilder: (context, index) {
        return ComputeTile(threadModel: listaTile[index]);
      },
    );
  }
}
