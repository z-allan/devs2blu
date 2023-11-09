import 'package:exercicios_oop/exercicios/ex14/c_estoque.dart';
import 'package:exercicios_oop/exercicios/ex14/c_pedido.dart';
import 'package:exercicios_oop/exercicios/ex14/c_produto.dart';
import 'dart:io';

void main() {

  Estoque e = Estoque();
  EstoqueVisualizacao v = EstoqueVisualizacao(estoque: e);
  int nrPedidoCompra = 0;
  int nrPedidoVenda = 0;
  while (true) {
    print('\n Opções:');
    print(' 1 - Criar Pedido Compra');
    print(' 2 - Criar Pedido Venda');
    print(' 3 - Listar Estoque');
    print(' 0 - Sair');
    stdout.write("Escolha uma opção: ");
    String input = stdin.readLineSync() ?? '';
    if (input.trim().isEmpty) {
      print('! Entrada vazia, tente novamente.');
      continue;
    }
    if (input.trim().toLowerCase() == '0') {
      exit(0);
    }
    if (input.trim().toLowerCase() == '1') {
      nrPedidoCompra++;
      stdout.write("Qual nome do fornecedor: ");
      String forn = stdin.readLineSync() ?? '';
      PedidoCompra pc = PedidoCompra(nr: nrPedidoCompra, fornecedor: forn);
      while (true) {
        stdout.write("Qual nome do produto: ");
        String produto = stdin.readLineSync() ?? '';
        stdout.write("Qual a descricao do produto: ");
        String desc = stdin.readLineSync() ?? '';
        stdout.write("Qual o valor do produto: ");
        double valor = double.parse(stdin.readLineSync()!);
        stdout.write("Qual a qtd de produto: ");
        double qtd = double.parse(stdin.readLineSync()!);
        pc.adcProduto(Item(produto: Produto(produto, desc, valor), qtd: qtd));
        stdout.write("Deseja adicionar mais um produto? [S/N] ");
        String continuar = stdin.readLineSync() ?? '';
        if (continuar.trim().toLowerCase() == 'n') {
          break;
        }
      }
      e.adcEstoque(pc);
    }
    if (input.trim().toLowerCase() == '2') {
      nrPedidoVenda++;
      stdout.write("Qual nome do cliente: ");
      String cliente = stdin.readLineSync() ?? '';
      PedidoVenda pv = PedidoVenda(nr: nrPedidoVenda, cliente: cliente);
      while (true) {
        bool existe = v.listaEstoque();
        if (existe) {
          stdout.write("Escolha o produto: ");
          int item = int.parse(stdin.readLineSync()!);
          Produto p = e.listarEstoque()[item - 1].produto;
          stdout.write("Qual a qtd de produto: ");
          double qtd = double.parse(stdin.readLineSync()!);
          pv.adcProduto(Item(produto: p, qtd: qtd));
          stdout.write("Deseja adicionar mais um produto? [S/N] ");
          String continuar = stdin.readLineSync() ?? '';
          if (continuar.trim().toLowerCase() == 'n') {
            break;
          }
        } else {
          break;
        }
      }
      e.remEstoque(pv);
    }
    if (input.trim().toLowerCase() == '3') {
      v.imprimirEstoque();
    }
  }




  // Produto p1 = Produto('Produto 1','Desc prod 1', 10.5);
  // Produto p2 = Produto('Produto 2','Desc prod 2', 22.5);
  // Produto p3 = Produto('Produto 3','Desc prod 2', 20);
  //
  // PedidoCompra pc1 = PedidoCompra(nr: 1, fornecedor: 'Forn 1');
  // pc1.adcProduto(PedidoItem(produto: p1, qtd: 10));
  // pc1.adcProduto(PedidoItem(produto: p2, qtd: 20));
  // pc1.resumoPedido();
  // estoque.adcEstoque(pc1);
  //
  // PedidoCompra pc2 = PedidoCompra(nr: 2, fornecedor: 'Forn 2');
  // pc2.adcProduto(PedidoItem(produto: p1, qtd: 20));
  // pc2.resumoPedido();
  // estoque.adcEstoque(pc2);
  //
  // PedidoVenda pv1 = PedidoVenda(nr: 1, cliente: 'Cliente 1');
  // pv1.adcProduto(PedidoItem(produto: p3, qtd: 10));
  // pv1.adcProduto(PedidoItem(produto: p1, qtd: 29));
  // estoque.remEstoque(pv1);
  //
  // estoque.imprimirEstoque();

}
