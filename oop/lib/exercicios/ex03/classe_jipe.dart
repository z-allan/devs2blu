//part of lib;
import 'classe_carro.dart';

class Jipe extends Carro {

  bool _modo4x4 = false;

  void ativar4x4() {
    if (!veiculoEstaLigado) {
      print('O jipe não está ligado para ativar o 4x4.');
      return;
    }

    if (_modo4x4) {
      print('O modo 4x4 já está ligado.');
      return;
    }

    _modo4x4 = true;
    print('Ativando 4x4.');
  }

  void desativar4x4() {
    if (!veiculoEstaLigado) {
      print('O jipe não está ligado para desativar o 4x4.');
      return;
    }

    if (!_modo4x4) {
      print('O modo 4x4 já está desligado.');
      return;
    }

    _modo4x4 = false;
    print('Desativando 4x4.');
  }

}