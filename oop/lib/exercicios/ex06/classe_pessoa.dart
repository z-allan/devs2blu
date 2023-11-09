class Pessoa {

  //late final String nome;
  late String nome;
  late DateTime nascimento;
  bool _isAniversario = false;

  Pessoa({required this.nome, required this.nascimento});

  bool get aniversarioHoje {
    idade;
    return _isAniversario;
  }

  int get idade {
    DateTime agora = DateTime.now();
    int anos = agora.year - nascimento.year;
    int mes = agora.month - nascimento.month;
    int dia = agora.day - nascimento.day;
    int idade = 0;

    // print(agora);
    // print(nascimento);
    // print('anos:$anos, meses:$mes, dias:$dia');

    if (mes < 0) {
      idade = anos - 1;
    } else if (mes == 0) {
      idade = dia < 0 ? anos - 1 : anos;
      _isAniversario = dia == 0 ? true : false;
    } else {
      idade = anos;
    }

    return idade;
  }

}