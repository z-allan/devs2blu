// ignore_for_file: unnecessary_null_comparison

import 'package:dart_avancado/exemplos/shop_cart/models/product_model.dart';

class ShoppingCartItem {
  late ProductModel productModel;
  int quantity = 1;

  ShoppingCartItem({required this.productModel, required this.quantity});

  double get totalCost =>
      (productModel == null ? 0.0 : productModel.price) * quantity;
}
