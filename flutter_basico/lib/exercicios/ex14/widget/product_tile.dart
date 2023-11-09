import 'package:exercicios_flutter_basico/exercicios/ex14/model/price_extension.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/model/product_model.dart';
import 'package:flutter/material.dart';

typedef SelectedProduct = void Function(ProductModel product);

class ProductTile extends StatelessWidget {
  final ProductModel _product;
  final SelectedProduct _onProductSelect;

  const ProductTile(
      {required ProductModel product,
      required SelectedProduct onClick,
      super.key})
      : _onProductSelect = onClick,
        _product = product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: (_product.isImageLocal)
            ? AssetImage(_product.imagePath) as ImageProvider
            : NetworkImage(_product.imagePath),
        width: 100,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox(
              width: 100,
              child: Icon(
                Icons.no_photography_outlined,
                size: 30,
              ));
        },
      ),
      title: Text(
        _product.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      isThreeLine: true,
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'de ${_product.manufacturer}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Text(
            _product.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _product.price.priceFormatBRL(),
            style: const TextStyle(fontSize: 20, color: Colors.green),
            textAlign: TextAlign.right,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
      horizontalTitleGap: 0,
      visualDensity: VisualDensity.comfortable,
      onTap: () => _onProductSelect(this._product),
    );
  }
}
