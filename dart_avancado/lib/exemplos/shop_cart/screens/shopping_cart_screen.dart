import "package:dart_avancado/exemplos/shop_cart/widgets/product_tile_buttons.dart";
import 'package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_widget.dart';
import "package:flutter/material.dart";

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho de compras"),
      ),
      body: StreamBuilder(
        initialData: ShoppingCartWidget.of(context)!.shoppingCart,
        stream: ShoppingCartWidget.of(context)!.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString(),
                  style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          if (snapshot.data!.totalItens == 0)
            return Center(
              child: Text("Seu carrinho está vazio! Compre, compre, compre ;)"),
            );

          return ListView.builder(
              itemCount: snapshot.data!.items.length,
              itemBuilder: (context, index) {
                return ProductTileButtons(item: snapshot.data!.items[index]);
              });
        },
      ),
    );
  }
}
