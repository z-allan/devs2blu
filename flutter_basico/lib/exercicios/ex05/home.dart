import 'package:flutter/material.dart';

class MyChristmas extends StatelessWidget {
  const MyChristmas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 5')),
      body: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
            image: AssetImage('assets/ex05/christmas-tree.gif'),
            width: 250,
            fit: BoxFit.fill),
        Image(
            image: NetworkImage(
                'https://openclipart.org/image/2400px/svg_to_png/189356/1386271561.png',
                scale: 10))
      ])),
      backgroundColor: Colors.white,
    );
  }
}
