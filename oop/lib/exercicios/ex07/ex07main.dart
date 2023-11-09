import 'c_carro.dart';

void main() {
  Carro c = Carro(capacidadeTanque: 50);
  c.percorrerQuilometros(100);
  c.encherTanque();
  c.consumirCombustivel(15);
  c.percorrerQuilometros(100);
  c.consumirCombustivel(40);
  c.percorrerQuilometros(50);
  c.calcularMedia();
  c.encherTanque();
  c.calcularMedia();
  c.percorrerQuilometros(100);
  c.consumirCombustivel(20);
  c.calcularMedia();
}