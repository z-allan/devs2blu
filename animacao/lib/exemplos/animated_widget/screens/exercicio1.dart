import 'package:animacao/exemplos/animated_widget/widgets/animatedCar.dart';
import 'package:flutter/material.dart';

class Exercicio1 extends StatefulWidget {
  const Exercicio1({super.key});

  @override
  State<Exercicio1> createState() => _Exercicio1State();
}

class _Exercicio1State extends State<Exercicio1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();

    this.animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    this.animation =
        Tween<double>(begin: 100, end: 500).animate(this.animationController);
    this.animation2 =
        Tween<double>(begin: 100, end: 600).animate(this.animationController);

    this.animationController.repeat();
  }

  @override
  void dispose() {
    this.animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("AnimationController progress: ${this.animationController.value}");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Carrinho em movimento"),
        ),
        body: Stack(
          children: [
            AnimatedCar(this.animation, 200),
            AnimatedCar(this.animation2, 500),
          ],
        ));
  }
}
