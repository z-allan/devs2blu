// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookStore on _BookStore, Store {
  Computed<bool>? _$inInsertComputed;

  @override
  bool get inInsert => (_$inInsertComputed ??=
          Computed<bool>(() => super.inInsert, name: '_BookStore.inInsert'))
      .value;
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_BookStore.canSave'))
      .value;

  late final _$idAtom = Atom(name: '_BookStore.id', context: context);

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

  late final _$nameAtom = Atom(name: '_BookStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$authorAtom = Atom(name: '_BookStore.author', context: context);

  @override
  String get author {
    _$authorAtom.reportRead();
    return super.author;
  }

  @override
  set author(String value) {
    _$authorAtom.reportWrite(value, super.author, () {
      super.author = value;
    });
  }

  late final _$coverAtom = Atom(name: '_BookStore.cover', context: context);

  @override
  String get cover {
    _$coverAtom.reportRead();
    return super.cover;
  }

  @override
  set cover(String value) {
    _$coverAtom.reportWrite(value, super.cover, () {
      super.cover = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_BookStore.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_BookStoreActionController =
      ActionController(name: '_BookStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_BookStoreActionController.startAction(name: '_BookStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAuthor(String value) {
    final _$actionInfo =
        _$_BookStoreActionController.startAction(name: '_BookStore.setAuthor');
    try {
      return super.setAuthor(value);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCover(String value) {
    final _$actionInfo =
        _$_BookStoreActionController.startAction(name: '_BookStore.setCover');
    try {
      return super.setCover(value);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fromObject(BookModel bookModel) {
    final _$actionInfo =
        _$_BookStoreActionController.startAction(name: '_BookStore.fromObject');
    try {
      return super.fromObject(bookModel);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
author: ${author},
cover: ${cover},
inInsert: ${inInsert},
canSave: ${canSave}
    ''';
  }
}
