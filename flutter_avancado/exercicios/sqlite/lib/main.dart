import 'package:flutter/material.dart';
import 'package:sqlite/screens/home_screen.dart';

void main() {
  runApp(const SQLiteExample());
}

class SQLiteExample extends StatelessWidget {
  const SQLiteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
