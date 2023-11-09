// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math';

class StaggeredScreen extends StatefulWidget {
  const StaggeredScreen({super.key});

  @override
  State<StaggeredScreen> createState() => _StaggeredScreenState();
}

class _StaggeredScreenState extends State<StaggeredScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animationHeight;
  late Animation<double> animationWidth;
  late Animation<double> animationRadius;
  late Animation<double> animationOpacity;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    animationWidth = Tween<double>(begin: 20, end: 500).animate(CurvedAnimation(
        parent: animationController, curve: const Interval(0.0, 0.3)));

    animationHeight = Tween<double>(begin: 20, end: 500).animate(
        CurvedAnimation(
            parent: animationController, curve: const Interval(0.3, 0.6)));

    animationRadius = Tween<double>(begin: 0, end: 250).animate(CurvedAnimation(
        parent: animationController, curve: const Interval(0.7, 1.0)));

    animationOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: const Interval(0.0, 1.0)));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: this.animationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: this.animationController.value * 2.0 * pi,
              child: Opacity(
                opacity: this.animationOpacity.value,
                child: Container(
                  height: this.animationHeight.value,
                  width: this.animationWidth.value,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(this.animationRadius.value),
                      gradient: const LinearGradient(colors: [
                        Colors.white,
                        Colors.lightBlueAccent,
                        Colors.blue,
                        Colors.lightBlueAccent
                      ])),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
