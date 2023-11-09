import 'classe_folha.dart';

class FolhaSalarialVendedor extends FolhaSalarial {

  late int qtdVendas;
  late double bonificacaoEmReais;

  FolhaSalarialVendedor(
      [double valorHora=0.0, double horasTrabalhadas=0.0, this.qtdVendas=0, this.bonificacaoEmReais=0.0])
      : super(valorHora, horasTrabalhadas);

  @override
  double valorAReceber() {
    return super.valorAReceber() + (qtdVendas * bonificacaoEmReais);
  }
}
