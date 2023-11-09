import 'package:animacao/exercicios/exExtra/widget/car_painter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animation = Tween<double>(begin: 0, end: pi * 10).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData info = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício Extra'),
      ),
      body: SafeArea(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 5)),
          width: info.size.width,
          height: info.size.height,
          child: GestureDetector(
            onTapDown: (details) {
              final tapPosition = details.globalPosition;
              final x = tapPosition.dx;
              final y = tapPosition.dy;
              print('X=$x | Y=$y | Screen:${info.size}');
            },
            child: CustomPaint(
              painter: CarPainter(animation.value),
            ),
          ),
        ),
      ),
    );
  }
}
