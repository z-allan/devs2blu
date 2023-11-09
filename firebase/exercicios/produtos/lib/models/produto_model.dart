class ProdutoModel {
  String? id;
  String nome = "";
  double preco = 0;

  ProdutoModel({required this.nome, required this.preco, this.id});

  ProdutoModel.fromJson(Map<String, dynamic> json, String pId) {
    nome = json['nome'];
    preco = json['preco'];

    id = pId;
  }

  Map<String, dynamic> toJson() {
    return {"nome": nome, "preco": preco};
  }
}
