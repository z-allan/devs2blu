import 'dart:convert';
import 'package:exercicios_flutter_basico/exercicios/ex14/model/product_model.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/screen/product_detail.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/products_string.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> _productList = [];

  void searchProducts() {
    var jsonProducts = json.decode(JsonProducts.products);
    List<ProductModel> temp = [];
    for (var item in jsonProducts) {
      temp.add(ProductModel.json(item));
    }
    setState(() => _productList = temp);
  }

  @override
  Widget build(BuildContext context) {
    searchProducts();
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 14')),
      body: ListView.builder(
        itemBuilder: (context, index) => ProductTile(
            product: _productList[index],
            onClick: (product) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product)));
            }),
        itemCount: _productList.length,
      ),
    );
  }
}
