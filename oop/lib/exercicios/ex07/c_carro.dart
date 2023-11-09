import 'package:exercicios_oop/exercicios/ex07/c_consumo.dart';

class Carro {
  late final double _capacidadeTanque;
  double _qtdCombAtual = 0;
  double _qtdKmPercorrida = 0;

  Carro({required double capacidadeTanque}) {
    _capacidadeTanque = capacidadeTanque;
  }

  double get capacidadeTanque => _capacidadeTanque;
  double get combustivelRestante => _qtdCombAtual;
  double get kmTrajetoAtual => _qtdKmPercorrida;

  void encherTanque() {
    double abastecido = _capacidadeTanque - _qtdCombAtual;
    _qtdCombAtual = _capacidadeTanque;
    _qtdKmPercorrida = 0;
    print('Foram abastecidos $abastecido litros.');
  }

  void calcularMedia() {
    CalculaConsumoMedia(_capacidadeTanque,_qtdCombAtual,_qtdKmPercorrida).calcularMedia();
  }

  void consumirCombustivel(double quantComb){
    if (quantComb > _qtdCombAtual) {
      print('Não é possível consumir esta quantidade.');
      return;
    }
    _qtdCombAtual -= quantComb;
    print('Foram consumidos $quantComb litros, ainda existem $_qtdCombAtual.');
  }

  void percorrerQuilometros(double quantKm) {
    if (_qtdCombAtual <= 0) {
      print('O tanque está vazio, não é possível percorrer nenhum km.');
      return;
    }
    _qtdKmPercorrida += quantKm;
    print('Foram percorridos $quantKm km, já foram percorridos $_qtdKmPercorrida km.');
  }

}