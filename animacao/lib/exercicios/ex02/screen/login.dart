import 'package:animacao/exercicios/ex02/widget/button_animation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController animationControler;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationControler = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 250, end: 90).animate(
        CurvedAnimation(parent: animationControler, curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    animationControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 2')),
      body: Form(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Login',
                    border: UnderlineInputBorder(),
                    constraints: BoxConstraints(maxWidth: 250))),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Senha',
                    border: UnderlineInputBorder(),
                    constraints: BoxConstraints(maxWidth: 250))),
            const SizedBox(
              height: 56,
            ),
            AnimatedButton(
                textLabel: 'Login',
                animation: animation,
                onClickAction: () {
                  if (this.animation.status == AnimationStatus.dismissed) {
                    animationControler.forward();
                    return;
                  }
                  if (this.animation.status == AnimationStatus.completed) {
                    animationControler.reverse();
                  }
                })
          ],
        ),
      )),
    );
  }
}
