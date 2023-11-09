import 'package:exercicios_oop/exercicios/ex14/c_pedido.dart';
import 'package:exercicios_oop/exercicios/ex14/c_produto.dart';

class Estoque {
  final List<Item> _listaEstoque = [];

  List<Item> listarEstoque() {
    return _listaEstoque;
  }

  void adcEstoque(PedidoCompra pc) {
    bool existe = false;
    for (Item itemPedido in pc.itensPedido) {
      for (Item itemEstoque in _listaEstoque) {
        if (itemPedido.produto.nome == itemEstoque.produto.nome) {
          itemEstoque.qtd += itemPedido.qtd;
          existe = true;
          print('+ ${itemPedido.produto.nome} -> [+] ${itemPedido.qtd} [=] ${itemEstoque.qtd}.');
          break;
        }
      }
      if (!existe) {
        _listaEstoque.add(Item(produto: itemPedido.produto, qtd: itemPedido.qtd));
        print('+ ${itemPedido.produto.nome} -> não existe [+] ${itemPedido.qtd}.');
      }
      existe = false;
    }
  }

  void remEstoque(PedidoVenda pv) {
    bool existe = false;
    for (Item itemPedido in pv.itensPedido) {
      for (Item itemEstoque in _listaEstoque) {
        if (itemPedido.produto.nome == itemEstoque.produto.nome) {
          existe = true;
          if (itemPedido.qtd > itemEstoque.qtd) {
            print('! ${itemPedido.produto.nome} -> quantidade ${itemPedido.qtd} indisponível. Disponível=${itemEstoque.qtd}');
            break;
          }
          itemEstoque.qtd -= itemPedido.qtd;
          print('- ${itemPedido.produto.nome} -> removido ${itemPedido.qtd} do estoque, total ${itemEstoque.qtd}.');
          break;
        }
      }
      if (!existe) {
        print('! ${itemPedido.produto.nome} não existe no estoque.');
      }
      existe = false;
    }
  }
}

class EstoqueVisualizacao {

  late List<Item> _listaEstoque;

  EstoqueVisualizacao({required Estoque estoque}){
    _listaEstoque = estoque.listarEstoque();
  }

  void imprimirEstoque() {
    print('Estoque {');
    for (Item item in _listaEstoque) {
      if(item.qtd > 0) {
        print(' Produto:[${item.produto.nome}] Qtd:[${item.qtd}]');
      }
    }
    print('}');
  }

  bool listaEstoque() {
    int i = 1;
    bool existe = false;
    for (Item ei in _listaEstoque) {
      if (ei.qtd > 0) {
        print(' $i - Produto:[${ei.produto.nome}] Valor:[${ei.produto.valor}] Disponivel:[${ei.qtd}]');
        i++;
        existe = true;
      }
    }
    if (!existe) {
      print(' Nenhum item em estoque');
    }
    return existe;
  }

}
