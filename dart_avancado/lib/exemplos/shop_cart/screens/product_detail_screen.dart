import 'package:dart_avancado/exemplos/shop_cart/models/product_model.dart';
import 'package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_widget.dart';
import "package:flutter/material.dart";

import '../widgets/shopping_cart_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailScreen({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item"),
        actions: [ShoppingCartButton()],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Image.network(
              productModel.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(productModel.title),
            trailing: Text(
              "R\$ ${productModel.price.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.lightGreen, fontSize: 28),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ShoppingCartWidget.of(context)!.addItem(productModel);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 20,
                ),
                Text("Adicionar ao carrinho")
              ],
            ),
          )),
    );
  }
}
