import "dart:async";

import "package:dart_avancado/exemplos/shop_cart/models/product_model.dart";
import "package:dart_avancado/exemplos/shop_cart/models/shopping_Cart.dart";
import "package:flutter/material.dart";

class ShoppingCartWidget extends InheritedWidget {
  final ShoppingCart _shoppingCart = ShoppingCart();
  final StreamController<ShoppingCart> _streamController =
      new StreamController<ShoppingCart>.broadcast();

  ShoppingCartWidget({required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  double get totalCost => _shoppingCart.totalCost;

  int get itemCount => _shoppingCart.totalItens;

  void addItem(ProductModel productModel) {
    try {
      _shoppingCart.addItem(productModel);
    } finally {
      _streamController.sink.add(_shoppingCart);
    }
  }

  void removeItem(ProductModel productModel) {
    try {
      _shoppingCart.removeItem(productModel);
    } finally {
      _streamController.sink.add(_shoppingCart);
    }
  }

  ShoppingCart get shoppingCart => this._shoppingCart;

  Stream<ShoppingCart> get stream => this._streamController.stream;

  static ShoppingCartWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShoppingCartWidget>();
  }
}
