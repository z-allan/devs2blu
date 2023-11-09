import 'home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio06());
}

class Exercicio06 extends StatelessWidget {
  const Exercicio06({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyLogin(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 26, 44, 63),
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color.fromARGB(255, 105, 183, 255),
                onPrimary: Color.fromARGB(255, 105, 183, 255),
                secondary: Colors.white,
                onSecondary: Colors.white,
                error: Color.fromARGB(255, 255, 56, 56),
                onError: Color.fromARGB(255, 255, 56, 56),
                background: Color.fromARGB(255, 105, 183, 255),
                onBackground: Color.fromARGB(255, 105, 183, 255),
                surface: Colors.white,
                onSurface: Colors.white)));
  }
}
