class Produto {
  String nome = '';
  String descricao = '';
  double valor = 0;

  Produto([this.nome='', this.descricao='', this.valor=0]);
}

class Item {
  late Produto produto;
  late double qtd;

  Item({required this.produto, required this.qtd});

  double valorTotal() {
    return produto.valor * qtd;
  }
}
