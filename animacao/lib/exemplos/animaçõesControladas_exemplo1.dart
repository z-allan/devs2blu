// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool mostraForm = false;

  @override
  void initState() {
    super.initState();

    this.animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    // Redesenha o componente a cada intervalo
    this.animationController.addListener(() {
      setState(() {});
    });

    // Muda o estado da animação

    this.animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.animationController.forward(from: 0);
        return;
      }

      if (status == AnimationStatus.dismissed) {
        this.animationController.forward();
      }
    });

    this.animation =
        Tween<double>(begin: 0, end: 9).animate(this.animationController);

    animationController.forward();
  }

  List<Color> cores = [
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.black,
    Colors.brown
  ];

  @override
  void dispose() {
    this.animationController.dispose();

    super.dispose();
  }

  Widget _buildForm() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bem vindo!",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Login"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.mostraForm = this.mostraForm || this.animation.value >= 5;

    Random vrRandom = Random();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Exemplo de animações"),
        ),
        body: Stack(
          children: [
            Positioned(
              top: vrRandom.nextInt(500) * 1,
              left: vrRandom.nextInt(500) * 1,
              child: Container(
                width: 500,
                height: 500,
                color: this.cores[animation.value.floor()],
                child: (this.mostraForm ? _buildForm() : null),
              ),
            )
          ],
        ));
  }
}
