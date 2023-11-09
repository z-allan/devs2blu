import 'package:exercicio01/media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Lista vazia retorna 0', () {
    var media = MediaNotasModel(listaNotas: []);
    expect(media.calcularMedia(), 0);
    expect(media.calcularMedia() == 7, false);
  });

  test('Arredondamento em 1 casa decimal', () {
    var media = MediaNotasModel(listaNotas: [5.5, 7.8, 4]);
    expect(media.calcularMedia(), 5.8);
    expect(media.calcularMedia() > 5.7, true);
    expect(media.calcularMedia() == 5.7, false);
  });

  test('Aceita nota negativa', () {
    var media = MediaNotasModel(listaNotas: [-5, 7, 7]);
    expect(media.calcularMedia(), 3);
  });
}
