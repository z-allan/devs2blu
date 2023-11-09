// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:node_store/src/models/productModel.dart";

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("#${product.id}"),
      title: Text(product.name),
      subtitle: Text(product.fabricante),
      trailing: Text(product.preco.toStringAsFixed(2),
          style: const TextStyle(color: Colors.green, fontSize: 22)),
    );
  }
}
