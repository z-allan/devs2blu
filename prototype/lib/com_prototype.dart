// ignore_for_file: unused_field

abstract class IProtoype<Tipo> {
  late bool _isCopia;
  String get isCopia;
  Tipo copiar();
}

class Pessoa implements IProtoype<Pessoa> {
  late String _cpf;
  late String nome;
  late int idade;
  @override
  bool _isCopia = false;

  @override
  String get isCopia => _isCopia ? 'É uma cópia' : 'Não é uma cópia';

  @override
  Pessoa copiar() {
    return Pessoa._(this);
  }

  Pessoa._(Pessoa pessoa) {
    this._cpf = pessoa._cpf;
    this.nome = pessoa.nome;
    this.idade = pessoa.idade;
    this._isCopia = true;
  }

  Pessoa(
      {required String cpfNumeros, required this.nome, required this.idade}) {
    this._cpf = _formatarCPF(cpfNumeros);
  }

  String _formatarCPF(String param) {
    param = param.replaceAll(RegExp(r'[^0-9]'), '');
    var regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    return param.padLeft(11, "0").replaceAllMapped(
        regExp, (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');
  }

  @override
  String toString() {
    return "Nome: '${this.nome}' | Idade: ${this.idade} | CPF: '${this._cpf}' | $isCopia";
  }
}

void main() {
  Pessoa p1 =
      Pessoa(cpfNumeros: '3-45678b91a0', nome: 'João da Silva', idade: 55);
  print(p1);
  //Nome: 'João da Silva' | Idade: '55' | CPF: '003.456.789-10' | Não é uma cópia

  Pessoa p2 = p1.copiar();
  print(p2);
  //Nome: 'João da Silva' | Idade: '55' | CPF: '003.456.789-10' | É uma cópia
}
