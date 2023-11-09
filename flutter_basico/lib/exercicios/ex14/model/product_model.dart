class ProductModel {
  late String name;
  late String manufacturer;
  late String description;
  late double price;
  late String imagePath;
  late bool isImageLocal;

  ProductModel(
      {required this.name,
      required this.manufacturer,
      required this.description,
      required this.price,
      this.imagePath = '',
      this.isImageLocal = true});

  ProductModel.json(Map item) {
    this.name = item['nome'];
    this.manufacturer = item['fabricante'];
    this.description = item['descricao'];
    this.price = item['preco'] as double;
    this.imagePath = item['caminhoImagem'] ?? '';
    this.isImageLocal = item['localImagem'] ?? true;
  }
}
