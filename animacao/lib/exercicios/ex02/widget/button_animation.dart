import 'package:flutter/material.dart';

class AnimatedButton extends AnimatedWidget {
  final VoidCallback onClickAction;
  final String textLabel;

  const AnimatedButton(
      {required this.textLabel,
      required Animation<double> animation,
      required this.onClickAction,
      super.key})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      width: animation.value,
      height: 60,
      child: TextButton(
        onPressed: this.onClickAction,
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(animation.value, 90))),
        child: animation.status == AnimationStatus.completed ||
                animation.status == AnimationStatus.reverse
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))
            : Text(
                this.textLabel,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
      ),
    );
  }
}
