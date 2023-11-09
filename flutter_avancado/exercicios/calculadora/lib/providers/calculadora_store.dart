// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'package:mobx/mobx.dart';
part 'calculadora_store.g.dart';

class CalculadoraStore = _CalculadoraStoreBase with _$CalculadoraStore;

enum Operacoes { Somar, Subtrair, Multiplicar, Dividir }

abstract class _CalculadoraStoreBase with Store {
  @observable
  double valor1 = 0;

  @observable
  double valor2 = 0;

  @observable
  Operacoes operacao = Operacoes.Somar;

  @observable
  String resultado = '=';

  @computed
  bool get divisionByZero => operacao == Operacoes.Dividir && valor2 == 0;

  @action
  bool isOperacao(Operacoes value) => operacao == value;

  @action
  void selecionarOperacao(Operacoes value) {
    operacao = value;
    _doAction();
  }

  @action
  void setValor1(String valor) {
    valor1 = valor.isEmpty ? 0 : double.parse(valor);
    _doAction();
  }

  @action
  void setValor2(String valor) {
    valor2 = valor.isEmpty ? 0 : double.parse(valor);
    _doAction();
  }

  void _doAction() {
    switch (operacao) {
      case Operacoes.Somar:
        resultado = '= ${(valor1 + valor2).toStringAsFixed(1)}';
        break;
      case Operacoes.Subtrair:
        resultado = '= ${(valor1 - valor2).toStringAsFixed(1)}';
        break;
      case Operacoes.Multiplicar:
        resultado = '= ${(valor1 * valor2).toStringAsFixed(1)}';
        break;
      case Operacoes.Dividir:
        resultado = divisionByZero
            ? '= DIV / 0'
            : '= ${(valor1 / valor2).toStringAsFixed(1)}';
        break;
      default:
        resultado = '= 0';
    }
  }
}
