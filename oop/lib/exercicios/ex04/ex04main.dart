import 'classe_folha.dart';
import 'classe_vendedor.dart';

void main() {
  FolhaSalarial folha1 = FolhaSalarial(200, 10);
  print(folha1.valorAReceber());
  FolhaSalarialVendedor vendedor1 = FolhaSalarialVendedor(200, 10, 100, 5);
  print(vendedor1.valorAReceber());
  FolhaSalarial folha2 = FolhaSalarial();
  print(folha2.valorAReceber());
  FolhaSalarialVendedor vendedor2 = FolhaSalarialVendedor();
  print(vendedor2.valorAReceber());
}