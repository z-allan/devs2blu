import 'classe_pais.dart';

class Continente {

  late String nomeContinente;
  late List<Pais> _paisesContinente;

  Continente(String nome) {
    nomeContinente = nome;
    _paisesContinente = [];
  }

  void adicionarPais({required String nome, required int populacao, required double area}) {
      if (nome.trim()=='' || populacao==0 || area==0.0) {
        print('Favor preencher todas os campos');
        return;
      }

      _paisesContinente.add(Pais(nome, populacao, area));
      print("País '$nome' adicionado ao continente '$nomeContinente'");
  }

  int get populacaoContinente {
    int total = 0;
    for (Pais item in _paisesContinente) { total += item.populacaoPais; }
    return total;
  }

  double get areaContinente {
    double total = 0;
    for (Pais item in _paisesContinente) { total += item.areaPais; }
    return total;
  }

}