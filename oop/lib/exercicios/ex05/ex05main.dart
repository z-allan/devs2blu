import 'classe_continente.dart';

void main() {
  Continente c = Continente('America');

  c.adicionarPais(nome:'Brasil',populacao:214300000, area:8510000.0);
  c.adicionarPais(nome:'Chile',populacao:18050000,area:756950.0);
  c.adicionarPais(nome:'Canada',populacao:38005238,area:9984670.0);
  c.adicionarPais(nome:'Teste',populacao:38005238,area:0);
  c.adicionarPais(nome:'Estados Unidos',populacao:331893745,area:9371175.0);

  print('Continente ${c.nomeContinente}, população = ${c.populacaoContinente}');
  print('Continente ${c.nomeContinente}, área = ${c.areaContinente}');

}