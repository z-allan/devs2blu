import "package:dart_avancado/exemplos/shop_cart/screens/shopping_cart_screen.dart";
import 'package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_widget.dart';
import "package:flutter/material.dart";

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (ShoppingCartWidget.of(context) == null) return Container();

    return StreamBuilder(
      initialData: ShoppingCartWidget.of(context)!.shoppingCart,
      stream: ShoppingCartWidget.of(context)!.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Icon(Icons.error_outline);

        if (!snapshot.hasData) return CircularProgressIndicator();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(),
                ));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            Text(
              snapshot.data!.totalItens.toString(),
              style:
                  TextStyle(backgroundColor: Colors.red, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}
