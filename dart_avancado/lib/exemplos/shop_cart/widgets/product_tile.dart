import "package:dart_avancado/exemplos/shop_cart/models/product_model.dart";
import "package:dart_avancado/exemplos/shop_cart/screens/product_detail_screen.dart";
import "package:flutter/material.dart";

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(productModel: product),
        ));
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.image),
      ),
      title: Text(product.title),
      subtitle: Text("Produto: ${product.title}"),
      trailing: Text(
        "R\$ ${product.price.toStringAsFixed(2)}",
        style: TextStyle(color: Colors.lightGreen, fontSize: 28),
      ),
    );
  }
}
