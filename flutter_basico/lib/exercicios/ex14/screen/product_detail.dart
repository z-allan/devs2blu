import 'package:exercicios_flutter_basico/exercicios/ex14/model/price_extension.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel _product;

  const ProductDetail({required ProductModel product, super.key})
      : _product = product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Produto')),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image(
              image: (_product.isImageLocal)
                  ? AssetImage(_product.imagePath) as ImageProvider
                  : NetworkImage(_product.imagePath),
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 350,
                  child: Icon(
                    Icons.no_photography_outlined,
                    size: 120,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      _product.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    _product.price.priceFormatBRL(),
                    style: const TextStyle(fontSize: 24, color: Colors.green),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'descrição',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text(_product.description, textAlign: TextAlign.justify),
              visualDensity: VisualDensity.comfortable,
            ),
            ListTile(
              title: const Text(
                'fabricante',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_product.manufacturer),
              visualDensity: VisualDensity.comfortable,
            )
          ]),
        ),
        bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                padding:
                    const EdgeInsets.all(16) //content padding inside button
                ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_shopping_cart_sharp),
                Text('Adicionar ao Carrinho')
              ],
            )));
  }
}
