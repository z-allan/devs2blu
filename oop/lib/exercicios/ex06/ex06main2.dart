import 'package:exercicios_oop/exercicios/ex06/classe_membro.dart';
import 'package:exercicios_oop/exercicios/ex06/classe_venda.dart';

void main(){
  MembroClube membro = MembroClube(matricula: 1234, nome: 'Jose', nascimento: DateTime(1960,05,9));
  VendaIngresso venda = VendaIngresso(nomeEvento: 'Evento 1', dataVenda: DateTime.now(), comprador: membro);
  print(' ANTES > ${venda.comprador.nome}');
  venda.comprador.nome = 'Mudei o nome';
  print('DEPOIS > ${venda.comprador.nome}\n');

  print(' ANTES > ${venda.nomeEvento}');
  venda.nomeEvento = 'Evento 2';
  print('DEPOIS > ${venda.nomeEvento}\n');

  print(' ANTES > ${venda.comprador.nascimento}');
  venda.comprador.nascimento = DateTime.now();
  print('DEPOIS > ${venda.comprador.nascimento}');
}