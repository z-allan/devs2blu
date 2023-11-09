import 'dart:math';
import 'classe_ticket.dart';
import 'classe_pessoa.dart';
import 'classe_membro.dart';
import 'classe_venda.dart';


void main(){

  Pessoa pessoa1 = Pessoa(nome: 'Maria',
                          nascimento: DateTime(1990,6,21));
  MembroClube membro1 = MembroClube.objeto(matricula: 9876,
                                           pessoa: pessoa1);
  VendaIngresso venda1 = VendaIngresso(nomeEvento: 'Evento 1',
                                       dataVenda: DateTime.now(),
                                       comprador: membro1);
  print(' ANTES: $venda1');
  venda1.nomeEvento = 'Evento 2';
  venda1.comprador.nome = 'Teste';
  venda1.dataVenda = venda1.dataVenda.add(Duration(days: 1));
  print('DEPOIS: $venda1');

  MembroClube membro2 = MembroClube(matricula: 1234,
                                    nome: 'Jose',
                                    nascimento: DateTime(1960,05,9));
  VendaIngresso venda2 = VendaIngresso(nomeEvento: 'Evento 2',
                                       dataVenda: DateTime.now().add(Duration(days: Random().nextInt(60)*-1,
                                                                              hours: Random().nextInt(24),
                                                                              minutes: Random().nextInt(60),
                                                                              seconds: Random().nextInt(60))),
                                       comprador: membro2);
  print(' ANTES: $venda2');
  venda2.comprador.nome = 'Mudei o nome';
  venda2.nomeEvento = 'Evento 1';
  venda2.dataVenda = venda2.dataVenda.add(Duration(days: -1));
  print('DEPOIS: $venda2');

  Ticket('1A', pessoa1);
  Ticket('2B', membro2);
}