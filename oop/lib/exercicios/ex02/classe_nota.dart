class Nota {
  String descricao = '';
  double nota = 0;

  Nota(pDesc, pNota) {
    descricao = pDesc;
    nota = pNota;    
  }
}

class Aluno {

  String nome = "";
  double media = 0;
  final List<Nota> _listaNotas = [];

  void adicionarNota(String descricao, double nota) {
    Nota novaNota = Nota(descricao, nota);
    _listaNotas.add(novaNota);
  }

  String calcularMedia() {
    if (_listaNotas.isEmpty) {
      return 'Nenhuma nota cadastrada';
    }
    double total = 0;
    for (Nota item in _listaNotas) { total += item.nota; }
    media = total/_listaNotas.length;
    return "A média geral foi ${media.toStringAsFixed(1)}";
  }

  bool passouAno() {
    return media >= 6;
  }
}

void main() {
  Aluno aluno = Aluno();
  aluno.nome = 'Allan';
  print(aluno.calcularMedia());
  aluno.adicionarNota('Matematica', 8.0);
  aluno.adicionarNota('Portugues', 9.0);
  aluno.adicionarNota('Fisica', 7.0);
  aluno.adicionarNota('Filosofia', 9.5);
  aluno.adicionarNota('Educação Fisica', 5.0);
  aluno.adicionarNota('', 0.0);

  print(aluno.calcularMedia());
  print(aluno.media);
  print(aluno.nome);
  print(aluno.passouAno());
}
