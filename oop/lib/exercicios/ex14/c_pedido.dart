import 'package:exercicios_oop/exercicios/ex14/c_produto.dart';

abstract class Pedido {
  int nrPedido = 0;
  double _valorTotal = 0;
  int _nrProdutos = 0;
  double _nrItens = 0;
  List<Item> itensPedido = [];

  void adcProduto(Item item) {
    itensPedido.add(item);
    print('> $runtimeType[$nrPedido] -> [+] ${item.produto.nome}.');

    _valorTotal += item.valorTotal();
    _nrItens += item.qtd;
    _nrProdutos += 1;
  }

  void resumoPedido() {
    print('> $runtimeType[$nrPedido] -> R\$ $_valorTotal [Qtd=$_nrProdutos|Itens=$_nrItens].');
  }

}

class PedidoCompra extends Pedido {
  String fornecedor = '';

  PedidoCompra({required int nr, required this.fornecedor}) {
    super.nrPedido = nr;
  }
}

class PedidoVenda extends Pedido {
  String cliente = '';

  PedidoVenda({required int nr, required this.cliente}){
    super.nrPedido = nr;
  }
}