import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw_riverpod/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: ApiSW()));
}

class ApiSW extends StatelessWidget {
  const ApiSW({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
