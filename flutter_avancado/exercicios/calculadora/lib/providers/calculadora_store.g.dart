// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculadora_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculadoraStore on _CalculadoraStoreBase, Store {
  Computed<bool>? _$divisionByZeroComputed;

  @override
  bool get divisionByZero =>
      (_$divisionByZeroComputed ??= Computed<bool>(() => super.divisionByZero,
              name: '_CalculadoraStoreBase.divisionByZero'))
          .value;

  late final _$valor1Atom =
      Atom(name: '_CalculadoraStoreBase.valor1', context: context);

  @override
  double get valor1 {
    _$valor1Atom.reportRead();
    return super.valor1;
  }

  @override
  set valor1(double value) {
    _$valor1Atom.reportWrite(value, super.valor1, () {
      super.valor1 = value;
    });
  }

  late final _$valor2Atom =
      Atom(name: '_CalculadoraStoreBase.valor2', context: context);

  @override
  double get valor2 {
    _$valor2Atom.reportRead();
    return super.valor2;
  }

  @override
  set valor2(double value) {
    _$valor2Atom.reportWrite(value, super.valor2, () {
      super.valor2 = value;
    });
  }

  late final _$operacaoAtom =
      Atom(name: '_CalculadoraStoreBase.operacao', context: context);

  @override
  Operacoes get operacao {
    _$operacaoAtom.reportRead();
    return super.operacao;
  }

  @override
  set operacao(Operacoes value) {
    _$operacaoAtom.reportWrite(value, super.operacao, () {
      super.operacao = value;
    });
  }

  late final _$resultadoAtom =
      Atom(name: '_CalculadoraStoreBase.resultado', context: context);

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  late final _$_CalculadoraStoreBaseActionController =
      ActionController(name: '_CalculadoraStoreBase', context: context);

  @override
  bool isOperacao(Operacoes value) {
    final _$actionInfo = _$_CalculadoraStoreBaseActionController.startAction(
        name: '_CalculadoraStoreBase.isOperacao');
    try {
      return super.isOperacao(value);
    } finally {
      _$_CalculadoraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionarOperacao(Operacoes value) {
    final _$actionInfo = _$_CalculadoraStoreBaseActionController.startAction(
        name: '_CalculadoraStoreBase.selecionarOperacao');
    try {
      return super.selecionarOperacao(value);
    } finally {
      _$_CalculadoraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor1(String valor) {
    final _$actionInfo = _$_CalculadoraStoreBaseActionController.startAction(
        name: '_CalculadoraStoreBase.setValor1');
    try {
      return super.setValor1(valor);
    } finally {
      _$_CalculadoraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor2(String valor) {
    final _$actionInfo = _$_CalculadoraStoreBaseActionController.startAction(
        name: '_CalculadoraStoreBase.setValor2');
    try {
      return super.setValor2(valor);
    } finally {
      _$_CalculadoraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valor1: ${valor1},
valor2: ${valor2},
operacao: ${operacao},
resultado: ${resultado},
divisionByZero: ${divisionByZero}
    ''';
  }
}
