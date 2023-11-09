import 'classe_membro.dart';
import 'classe_pessoa.dart';

class Ticket {
  String numPoltrona;
  Pessoa pessoa;

  Ticket(this.numPoltrona, this.pessoa) {
    if(pessoa is MembroClube) {
      print('É um membro do clube. Matricula=${(pessoa as MembroClube).matricula}');
    } else {
      print('É uma pessoa.');
    }
  }
}