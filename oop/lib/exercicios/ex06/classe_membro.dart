import 'classe_pessoa.dart';

class MembroClube extends Pessoa {

  late int matricula;

  MembroClube({required this.matricula, required String nome, required DateTime nascimento}) : super(nome: nome, nascimento: nascimento);

  MembroClube.objeto({required this.matricula, required Pessoa pessoa}) : super(nome: pessoa.nome, nascimento: pessoa.nascimento);

  MembroClube.copy(MembroClube membro) : super(nome: membro.nome, nascimento: membro.nascimento) {
    matricula = membro.matricula;
  }

}