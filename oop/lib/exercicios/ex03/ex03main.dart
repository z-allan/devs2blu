import 'classe_jipe.dart';

void main() {
  Jipe jipe1 = Jipe();
  print('km atual=${jipe1.kmAtual}');
  jipe1.kmAtual = 1/0;
  print('km atual=${jipe1.kmAtual}');
  jipe1.litrosTanque = 6;
  jipe1.ligar();
  jipe1.ligar();
  jipe1.acelerar();
  jipe1.acelerar();
  jipe1.acelerar();
  jipe1.acelerar();
  jipe1.acelerar();
  jipe1.acelerar();
  jipe1.frear();
  jipe1.desativar4x4();
  jipe1.ativar4x4();
  jipe1.ativar4x4();
  jipe1.desativar4x4();
  jipe1.desligar();
  jipe1.desligar();
}