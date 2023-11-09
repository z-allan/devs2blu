// ignore_for_file: file_names

class ProductModel {
  int id = 0;
  String name = "";
  String fabricante = "";
  double preco = 0.0;

  ProductModel(
      {required this.id,
      required this.name,
      required this.fabricante,
      required this.preco});

  ProductModel.fromJson(Map<String, dynamic> json) {
    // Código aqui
  }
}
