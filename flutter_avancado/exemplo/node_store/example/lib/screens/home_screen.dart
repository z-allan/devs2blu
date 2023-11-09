// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:node_store/node_store.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<ProductModel> products = [
    ProductModel(id: 1, name: "Refri", fabricante: "João", preco: 3.50),
    ProductModel(id: 2, name: "Batata", fabricante: "Deus", preco: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de produtos"),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) =>
              ProductTile(product: products[index])),
    );
  }
}
