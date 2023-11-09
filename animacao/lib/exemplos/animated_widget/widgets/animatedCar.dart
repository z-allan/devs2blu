// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AnimatedCar extends AnimatedWidget {
  final double top;

  const AnimatedCar(Animation<double> prAnimation, this.top, {super.key})
      : super(listenable: prAnimation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = this.listenable as Animation<double>;

    return Positioned(
        top: this.top,
        left: animation.value,
        child: Image.asset(
          "assets/car.png",
          width: 100,
        ));
  }
}
