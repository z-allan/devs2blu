import "package:dart_avancado/exemplos/shop_cart/models/shopping_cart_Item.dart";
import 'package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_widget.dart';
import "package:flutter/material.dart";

class ProductTileButtons extends StatelessWidget {
  final ShoppingCartItem item;

  const ProductTileButtons({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.productModel.image),
      ),
      title: Text(item.productModel.title),
      subtitle: Text(
          "R\$ ${item.productModel.price.toStringAsFixed(2)} x ${item.quantity} = ${item.totalCost.toStringAsFixed(2)}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                ShoppingCartWidget.of(context)!.addItem(item.productModel);
              },
              icon: Icon(Icons.add_circle_outline_outlined)),
          IconButton(
              onPressed: () {
                ShoppingCartWidget.of(context)!.removeItem(item.productModel);
              },
              icon: Icon(Icons.remove_circle_outline_outlined))
        ],
      ),
    );
  }
}
