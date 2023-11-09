// ignore_for_file: file_names

import 'package:animacao/exemplos/ripple/rippleContainer.dart';
import 'package:flutter/material.dart';

class RippleAnimationControlado extends StatefulWidget {
  const RippleAnimationControlado({super.key});

  @override
  State<RippleAnimationControlado> createState() =>
      _RippleAnimationControladoState();
}

class _RippleAnimationControladoState extends State<RippleAnimationControlado>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    this.animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    this.animation =
        Tween<double>(begin: 0.7, end: 1).animate(this.animationController);
    /*
    this.animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.animationController.reverse();
        return;
      }

      if (status == AnimationStatus.dismissed) {
        this.animationController.forward();
      }
    });*/

    this.animationController.repeat();
  }

  @override
  void dispose() {
    this.animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: this.animationController,
          builder: (context, child) {
            double vrFator = this.animation.value;

            return Stack(
              alignment: Alignment.center,
              children: [
                RippleContainer(
                    size: (300 * (vrFator / 4)),
                    opacity: (0.3 * vrFator),
                    color: Colors.blue),
                RippleContainer(
                    size: (250 * (vrFator / 4)),
                    opacity: (0.6 * vrFator),
                    color: Colors.blue),
                RippleContainer(
                    size: (200 * (vrFator / 4)),
                    opacity: (0.9 * vrFator),
                    color: Colors.blue)
              ],
            );
          },
        ),
      ),
    );
  }
}
