//part of lib;

class Carro {
  double kmAtual = 0;
  double litrosTanque = 0;
  String placa = '';
  double velocidade = 0;
  bool _isLigado = false;

  void ligar() {
    if (litrosTanque == 0) {
      print('Tanque vazio, não foi possível ligar.');
      return;
    }

    if (_isLigado) {
      print('O carro já está ligado.');
      return;
    }

    _isLigado = true;
    print('Carro ligado.');
  }

  void desligar() {
    if (!_isLigado) {
      print('O carro não está ligado para ser desligado.');
      return;
    }

    _isLigado = false;
    print('Carro desligado.');
  }

  void acelerar() {
    if (!_isLigado) {
      print('O carro não está ligado para acelerar.');
      return;
    }

    if (litrosTanque <= 0) {
      print('O tanque está vázio, não foi possível acelerar.');
      return;
    }

    if (velocidade >= 50) {
      print('Velocidade máxima da via atingida, não foi possível acelerar.');
      return;
    }

    velocidade += 10;
    litrosTanque--;
    print('Carro acelerando. (${velocidade}km/h)');

  }

  void frear() {
    if (!_isLigado) {
      print('O carro não está ligado para frear.');
      return;
    }

    velocidade = 0;
    print('Carro freando. (0km/h)');
  }

  bool get veiculoEstaLigado => _isLigado;
}