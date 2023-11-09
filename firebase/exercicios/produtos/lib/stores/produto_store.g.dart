// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoStore on _ProdutoStoreBase, Store {
  Computed<bool>? _$ehInsercaoComputed;

  @override
  bool get ehInsercao =>
      (_$ehInsercaoComputed ??= Computed<bool>(() => super.ehInsercao,
              name: '_ProdutoStoreBase.ehInsercao'))
          .value;
  Computed<bool>? _$podeSalverComputed;

  @override
  bool get podeSalver =>
      (_$podeSalverComputed ??= Computed<bool>(() => super.podeSalver,
              name: '_ProdutoStoreBase.podeSalver'))
          .value;

  late final _$idAtom = Atom(name: '_ProdutoStoreBase.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_ProdutoStoreBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$precoAtom =
      Atom(name: '_ProdutoStoreBase.preco', context: context);

  @override
  double get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  late final _$salvarAsyncAction =
      AsyncAction('_ProdutoStoreBase.salvar', context: context);

  @override
  Future<void> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  late final _$_ProdutoStoreBaseActionController =
      ActionController(name: '_ProdutoStoreBase', context: context);

  @override
  void setName(String valor) {
    final _$actionInfo = _$_ProdutoStoreBaseActionController.startAction(
        name: '_ProdutoStoreBase.setName');
    try {
      return super.setName(valor);
    } finally {
      _$_ProdutoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(double valor) {
    final _$actionInfo = _$_ProdutoStoreBaseActionController.startAction(
        name: '_ProdutoStoreBase.setPreco');
    try {
      return super.setPreco(valor);
    } finally {
      _$_ProdutoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fromObjeto(ProdutoModel modelo) {
    final _$actionInfo = _$_ProdutoStoreBaseActionController.startAction(
        name: '_ProdutoStoreBase.fromObjeto');
    try {
      return super.fromObjeto(modelo);
    } finally {
      _$_ProdutoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nome: ${nome},
preco: ${preco},
ehInsercao: ${ehInsercao},
podeSalver: ${podeSalver}
    ''';
  }
}
