import "package:dart_avancado/exemplos/shop_cart/screens/home_screen.dart";
import "package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_widget.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShoppingCartWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
