// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RippleAnimationImplicito extends StatelessWidget {
  const RippleAnimationImplicito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            child: const Text("Clique aqui"),
          ),
        ),
      ),
    );
  }
}
