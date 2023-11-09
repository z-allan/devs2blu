import "package:dart_avancado/exemplos/shop_cart/models/product_model.dart";
import "package:dart_avancado/exemplos/shop_cart/widgets/product_tile.dart";
import "package:dart_avancado/exemplos/shop_cart/widgets/shopping_cart_button.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
        title: "Coca-cola",
        image:
            "https://d2r9epyceweg5n.cloudfront.net/stores/001/266/031/products/coca-2lt-site1-3fe594a7cce8f4f97c16402142098102-640-0.png",
        price: 8.57),
    ProductModel(
        title: "Queijo Brie",
        image:
            "https://cdn.awsli.com.br/600x1000/1550/1550750/produto/58836578/98940b2a64.jpg",
        price: 32.90),
    ProductModel(
        title: "Figurinha do menino Ney",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZp53fBsIdA5_3GYRlTf8qWaVqA_N8aSc0bA&usqp=CAU",
        price: 250000)
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja"),
        actions: [ShoppingCartButton()],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductTile(product: products[index]),
      ),
    );
  }
}
