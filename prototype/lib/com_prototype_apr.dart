// ignore_for_file: unused_field

abstract class IPrototype<Tipo> {
  Tipo criarCopia();
}

class Pessoa implements IPrototype<Pessoa> {
  late String _cpf;
  late String nome;
  late int idade;

  Pessoa(
      {required String cpfNumeros, required this.nome, required this.idade}) {
    this._cpf = _formatarCPF(cpfNumeros);
  }

  @override
  Pessoa criarCopia() {
    return Pessoa(cpfNumeros: this._cpf, nome: this.nome, idade: this.idade);
  }

  String _formatarCPF(String param) {
    param = param.replaceAll(RegExp(r'[^0-9]'), '');
    var regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    return param.padLeft(11, "0").replaceAllMapped(
        regExp, (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');
  }

  @override
  String toString() {
    return "Nome: '${this.nome}' | Idade: ${this.idade} | CPF: '${this._cpf}'";
  }
}

void main() {
  Pessoa p1 =
      Pessoa(cpfNumeros: '3-45678b91a0', nome: 'João da Silva', idade: 55);
  print(p1);
  //Nome: 'João da Silva' | Idade: 55 | CPF: '003.456.789-10'

  Pessoa p2 = p1.criarCopia();
  print(p2);
  //Nome: 'João da Silva' | Idade: 55 | CPF: '003.456.789-10'
}
