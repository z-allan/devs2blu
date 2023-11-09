import 'package:dart_avancado/exemplos/shop_cart/models/product_model.dart';
import 'package:dart_avancado/exemplos/shop_cart/models/shopping_cart_Item.dart';

class ShoppingCart {
  List<ShoppingCartItem> items = [];

  int? _getProductIndex(ProductModel productModel) {
    for (int i = 0; i < items.length; i++)
      if (items[i].productModel.title == productModel.title) return i;

    return null;
  }

  void addItem(ProductModel productModel) {
    int? productIndex = this._getProductIndex(productModel);

    if (productIndex == null) {
      items.add(ShoppingCartItem(productModel: productModel, quantity: 1));

      return;
    }

    items[productIndex].quantity = items[productIndex].quantity + 1;
  }

  void removeItem(ProductModel productModel) {
    int? productIndex = this._getProductIndex(productModel);

    if (productIndex == null) return;

    if (items[productIndex].quantity == 1) items.removeAt(productIndex);

    items[productIndex].quantity = items[productIndex].quantity - 1;
  }

  double get totalCost {
    double value = 0;

    items.forEach((element) {
      value = value + element.totalCost;
    });

    return value;
  }

  int get totalItens {
    int value = 0;

    items.forEach((element) {
      value = value + element.quantity;
    });

    return value;
  }
}
